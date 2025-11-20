// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";

// PancakeSwap V3 Interfaces
interface ISwapRouter {
    struct ExactInputSingleParams {
        address tokenIn;
        address tokenOut;
        uint24 fee;
        address recipient;
        uint256 deadline;
        uint256 amountIn;
        uint256 amountOutMinimum;
        uint160 sqrtPriceLimitX96;
    }

    struct ExactOutputSingleParams {
        address tokenIn;
        address tokenOut;
        uint24 fee;
        address recipient;
        uint256 deadline;
        uint256 amountOut;
        uint256 amountInMaximum;
        uint160 sqrtPriceLimitX96;
    }

    function exactInputSingle(ExactInputSingleParams calldata params) external payable returns (uint256 amountOut);
    function exactOutputSingle(ExactOutputSingleParams calldata params) external payable returns (uint256 amountIn);
}

interface IQuoter {
    function quoteExactInputSingle(
        address tokenIn,
        address tokenOut,
        uint24 fee,
        uint256 amountIn,
        uint160 sqrtPriceLimitX96
    ) external pure returns (uint256 amountOut);

    function quoteExactOutputSingle(
        address tokenIn,
        address tokenOut,
        uint24 fee,
        uint256 amountOut,
        uint160 sqrtPriceLimitX96
    ) external pure returns (uint256 amountIn);
}

// PancakeSwap V3 Transfer Helper Library
library TransferHelper {
    function safeApprove(address token, address to, uint256 value) internal {
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(IERC20.approve.selector, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: APPROVE_FAILED');
    }

    function safeTransferFrom(address token, address from, address to, uint256 value) internal {
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(IERC20.transferFrom.selector, from, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FROM_FAILED');
    }
}

contract SwapManagerV3 is Initializable, AccessControlUpgradeable, UUPSUpgradeable, ReentrancyGuardUpgradeable {
    using SafeERC20 for IERC20;

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");

    uint24 public  POOL_FEE;
    ISwapRouter public swapRouter;
    IQuoter public quoter;
    address public treasury;

    uint256 public platformFeeBps; 

    event SwapExecuted(address indexed user, address indexed tokenIn, address indexed tokenOut, uint256 amountIn, uint256 netAmountOut);
    event PlatformFeeCollected(address indexed user, uint256 feeAmount);
    event FeeRateUpdated(uint256 newBps);
    event Withdrawn(address indexed token, uint256 amount, address indexed to);

    function initialize(
        address _admin,
        address _initOwner,
        address _treasury,
        address _swapRouter,
        address _quoter,
        uint24 _poolFee
    ) external initializer {
        require(_admin != address(0) && _treasury != address(0) && _swapRouter != address(0) && _quoter != address(0) && _initOwner != address(0), "zero addr");
        __AccessControl_init();
        __UUPSUpgradeable_init();
        __ReentrancyGuard_init();

        _grantRole(DEFAULT_ADMIN_ROLE, _initOwner);
        _grantRole(ADMIN_ROLE, _admin);
        _grantRole(UPGRADER_ROLE, _initOwner);

        treasury = _treasury;
        swapRouter = ISwapRouter(_swapRouter);
        quoter = IQuoter(_quoter);
        platformFeeBps = 20; //0.2%
        POOL_FEE = _poolFee;
    }

    function _authorizeUpgrade(address) internal override onlyRole(UPGRADER_ROLE) {}


    function swapExactInputSingle(
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOutMinimum,  
        uint256 deadline,
        address recipient
    ) external nonReentrant  {
        require(tokenIn != address(0) && tokenOut != address(0), "zero token");
        require(recipient != address(0), "zero recipient");
        require(amountIn > 0, "zero amountIn");
        require(deadline > block.timestamp, "invalid deadline");

        TransferHelper.safeTransferFrom(tokenIn, msg.sender, address(this), amountIn);

        TransferHelper.safeApprove(tokenIn, address(swapRouter), amountIn);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
            tokenIn: tokenIn,
            tokenOut: tokenOut,
            fee: POOL_FEE,
            recipient: address(this),
            deadline: deadline,
            amountIn: amountIn,
            amountOutMinimum: amountOutMinimum, 
            sqrtPriceLimitX96: 0
        });
        uint256 grossAmountOut = swapRouter.exactInputSingle(params);

        uint256 platformFee = (grossAmountOut * platformFeeBps) / 10000;
        if (platformFee > 0) {
            IERC20(tokenOut).safeTransfer(treasury, platformFee);
            emit PlatformFeeCollected(msg.sender, platformFee);
        }

        uint256 netAmountOut = grossAmountOut - platformFee;
        if (netAmountOut > 0) {
            IERC20(tokenOut).safeTransfer(recipient, netAmountOut);
        }

        emit SwapExecuted(msg.sender, tokenIn, tokenOut, amountIn, netAmountOut);
    }


    function swapExactOutputSingle(
        address tokenIn,
        address tokenOut,
        uint256 netAmountOut,  
        uint256 amountInMaximum,  
        uint256 deadline,
        address recipient
    ) external nonReentrant  {
        require(tokenIn != address(0) && tokenOut != address(0), "zero token");
        require(recipient != address(0), "zero recipient");
        require(netAmountOut > 0, "zero netAmountOut");
        require(deadline > block.timestamp, "invalid deadline");

        uint256 grossAmountOut = netAmountOut * 10000 / (10000 - platformFeeBps);  

        TransferHelper.safeTransferFrom(tokenIn, msg.sender, address(this), amountInMaximum);

        TransferHelper.safeApprove(tokenIn, address(swapRouter), amountInMaximum);

        ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter.ExactOutputSingleParams({
            tokenIn: tokenIn,
            tokenOut: tokenOut,
            fee: POOL_FEE,
            recipient: address(this),
            deadline: deadline,
            amountOut: grossAmountOut,
            amountInMaximum: amountInMaximum,
            sqrtPriceLimitX96: 0
        });
        uint256 amountIn = swapRouter.exactOutputSingle(params);

        if (amountIn < amountInMaximum) {
            IERC20(tokenIn).safeTransfer(msg.sender, amountInMaximum - amountIn);
        }

        uint256 platformFee = grossAmountOut - netAmountOut;
        if (platformFee > 0) {
            IERC20(tokenOut).safeTransfer(treasury, platformFee);
            emit PlatformFeeCollected(msg.sender, platformFee);
        }

        if (netAmountOut > 0) {
            IERC20(tokenOut).safeTransfer(recipient, netAmountOut);
        }

        emit SwapExecuted(msg.sender, tokenIn, tokenOut, amountIn, netAmountOut);
    }


    function quoteExactInputSingle(
        address tokenIn,
        address tokenOut,
        uint256 amountIn
    ) external view returns (uint256 grossAmountOut, uint256 netAmountOut) {
        require(tokenIn != address(0) && tokenOut != address(0), "zero token");
        require(amountIn > 0, "zero amountIn");
        grossAmountOut = quoter.quoteExactInputSingle(tokenIn, tokenOut, POOL_FEE, amountIn, 0);
        uint256 platformFee = (grossAmountOut * platformFeeBps) / 10000;
        netAmountOut = grossAmountOut - platformFee;
    }


    function quoteExactOutputSingle(
        address tokenIn,
        address tokenOut,
        uint256 netAmountOut
    ) external view returns (uint256 amountIn) {
        require(tokenIn != address(0) && tokenOut != address(0), "zero token");
        require(netAmountOut > 0, "zero netAmountOut");
        if (platformFeeBps >= 10000) revert("Fee too high");  
 
        uint256 grossAmountOut = netAmountOut * 10000 / (10000 - platformFeeBps);

        amountIn = quoter.quoteExactOutputSingle(tokenIn, tokenOut, POOL_FEE, grossAmountOut, 0);
    }


    function setPlatformFeeBps(uint256 bps) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(bps <= 100, "Fee too high (>1%)"); 
        platformFeeBps = bps;
        emit FeeRateUpdated(bps);
    }


    function withdrawToken(address token, uint256 amount, address to) external onlyRole(DEFAULT_ADMIN_ROLE) nonReentrant {
        require(to != address(0), "zero to");
        require(amount > 0, "zero amount");
        if (token == address(0)) {
            require(amount <= address(this).balance, "Insufficient BNB");
            payable(to).transfer(amount);
        } else {
            require(IERC20(token).balanceOf(address(this)) >= amount, "Insufficient token");
            IERC20(token).safeTransfer(to, amount);
        }
        emit Withdrawn(token, amount, to);
    }

    receive() external payable {}
}