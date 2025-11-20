// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";

/// @title BoostSubscription
contract BoostSubscription is
    Initializable,
    UUPSUpgradeable,
    AccessControlUpgradeable,
    PausableUpgradeable,
    ReentrancyGuardUpgradeable
{
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    uint256 public constant MONTH_IN_SECONDS = 30 days; // 2592000 seconds
    uint8 public constant MAX_MONTHS = 120;

    struct BoostInfo {
        uint8 levelId;
        uint256 expiry;
    }

    struct BoostLevel {
        uint256 boostMultiplier; // e.g., 1000 for 10x
        uint256 monthlyPriceWei; // wei
        uint256 remainingQuota;  
        uint256 endTime;         
        bool isUnlimited;        
    }

    mapping(address => BoostInfo) public userSubscriptions;
    mapping(uint8 => BoostLevel) public boostLevels; // ID -> Level
    mapping(uint8 => bool) public allowedMonths; // month -> allowed

    uint8 public nextLevelId;

    event SubscriptionUpdated(address indexed user, uint8 levelId, uint256 expiry, uint256 totalPaid);
    event LevelAdded(uint8 indexed id, uint256 boostMultiplier, uint256 monthlyPriceWei, uint256 remainingQuota, uint256 endTime, bool isUnlimited);
    event LevelUpdated(uint8 indexed id, uint256 boostMultiplier, uint256 monthlyPriceWei, uint256 remainingQuota, uint256 endTime, bool isUnlimited);
    event LevelRemoved(uint8 indexed id);
    event MonthAllowedSet(uint8 indexed month, bool allowed);
    event Withdrawn(uint256 amount, address indexed to);

    function initialize(address _admin,address _initOwner) external initializer {
        __AccessControl_init();
        __UUPSUpgradeable_init();
        __Pausable_init();
        __ReentrancyGuard_init();

        _grantRole(DEFAULT_ADMIN_ROLE, _initOwner);
        _grantRole(ADMIN_ROLE, _admin);

        allowedMonths[1] = true;
        allowedMonths[2] = true;
        allowedMonths[3] = true;
        nextLevelId = 3;
        _addLevelInternal(1, 1000, 1e16, 100, block.timestamp + 2 days, false); // V1 10x, 0.01 BNB
        _addLevelInternal(2, 3500, 3e16, 100, block.timestamp + 2 days, false); // V2 35x, 0.03 BNB
        _addLevelInternal(3, 6500, 5e16, 100, block.timestamp + 2 days, false); // V3 65x, 0.05 BNB
    }


    function _authorizeUpgrade(address newImplementation) internal override onlyRole(DEFAULT_ADMIN_ROLE) {}


    function subscribe(uint8 levelId, uint8 months) external payable nonReentrant whenNotPaused {
        require(levelId >= 1 && levelId <= nextLevelId, "Invalid level ID");
        require(months >= 1 && months <= MAX_MONTHS, "Invalid months range");
        require(allowedMonths[months], "Months not allowed");
        require(msg.value > 0, "Must send BNB");

        BoostInfo storage userInfo = userSubscriptions[msg.sender];
        require(userInfo.expiry <= block.timestamp, "Active subscription exists");

        BoostLevel storage level = boostLevels[levelId];
        require(level.monthlyPriceWei > 0, "Level not exists");

        if (!level.isUnlimited) {
            require(level.remainingQuota > 0, "Quota exceeded");
            require(level.endTime == 0 || block.timestamp <= level.endTime, "Level expired");
            level.remainingQuota--;
        }

        uint256 totalPrice = level.monthlyPriceWei * months;
        require(msg.value >= totalPrice, "Insufficient payment");

   
        userInfo.levelId = levelId;
        userInfo.expiry = block.timestamp + (uint256(months) * MONTH_IN_SECONDS);

        if (msg.value > totalPrice) {
            payable(msg.sender).transfer(msg.value - totalPrice);
        }

        emit SubscriptionUpdated(msg.sender, levelId, userInfo.expiry, totalPrice);
    }


    function getUserBoost(address user) external view returns (uint8 levelId, uint256 boostMultiplier, uint256 expiry) {
        BoostInfo memory info = userSubscriptions[user];
        if (info.expiry > block.timestamp && info.levelId > 0) {
            BoostLevel memory level = boostLevels[info.levelId];
            return (info.levelId, level.boostMultiplier, info.expiry);
        }
        return (0, 0, 0);
    }


    function getBoostLevel(uint8 levelId) external view returns (BoostLevel memory level) {
        level = boostLevels[levelId];
    }
    function getAllAllowedMonths() external view returns (uint8[] memory months) {
        uint256 count = 0;
        for (uint8 i = 1; i <= MAX_MONTHS; i++) {
            if (allowedMonths[i]) {
                count++;
            }
        }
        months = new uint8[](count);
        uint256 index = 0;
        for (uint8 i = 1; i <= MAX_MONTHS; i++) {
            if (allowedMonths[i]) {
                months[index] = i;
                index++;
            }
        }
    }
    function getAllLevels() external view returns (uint8[] memory ids, BoostLevel[] memory levels) {
        uint256 count = 0;
        for (uint8 i = 1; i <= nextLevelId; i++) {
            if (boostLevels[i].monthlyPriceWei > 0) {
                count++;
            }
        }
        ids = new uint8[](count);
        levels = new BoostLevel[](count);
        uint256 index = 0;
        for (uint8 i = 1; i <= nextLevelId; i++) {
            if (boostLevels[i].monthlyPriceWei > 0) {
                ids[index] = i;
                levels[index] = boostLevels[i];
                index++;
            }
        }
    }

    function addLevel(uint256 boostMultiplier, uint256 monthlyPriceWei, uint256 remainingQuota, uint256 endTime, bool isUnlimited) external onlyRole(ADMIN_ROLE) {
        nextLevelId++;
        _addLevelInternal(nextLevelId, boostMultiplier, monthlyPriceWei, remainingQuota, endTime, isUnlimited);
    }

    function updateLevel(uint8 id, uint256 boostMultiplier, uint256 monthlyPriceWei, uint256 remainingQuota, uint256 endTime, bool isUnlimited) external onlyRole(ADMIN_ROLE) {
        require(id >= 1 && id < nextLevelId, "Invalid ID");
        boostLevels[id] = BoostLevel(boostMultiplier, monthlyPriceWei, remainingQuota, endTime, isUnlimited);
        emit LevelUpdated(id, boostMultiplier, monthlyPriceWei, remainingQuota, endTime, isUnlimited);
    }

    function removeLevel(uint8 id) external onlyRole(ADMIN_ROLE) {
        require(id >= 1 && id < nextLevelId, "Invalid ID");
        delete boostLevels[id];
        emit LevelRemoved(id);
    }


    function setAllowedMonth(uint8 month, bool allowed) external onlyRole(ADMIN_ROLE) {
        require(month >= 1 && month <= MAX_MONTHS, "Invalid month");
        allowedMonths[month] = allowed;
        emit MonthAllowedSet(month, allowed);
    }


    function pause() external onlyRole(ADMIN_ROLE) {
        _pause();
        emit Paused(msg.sender);
    }

    function unpause() external onlyRole(ADMIN_ROLE) {
        _unpause();
        emit Unpaused(msg.sender);
    }

    function withdraw(uint256 amount, address to) external onlyRole(DEFAULT_ADMIN_ROLE) nonReentrant {
        require(to != address(0), "Invalid to");
        require(amount <= address(this).balance, "Insufficient balance");
        payable(to).transfer(amount);
        emit Withdrawn(amount, to);
    }

    function _addLevelInternal(uint8 id, uint256 boost, uint256 price, uint256 remainingQuota, uint256 endTime, bool isUnlimited) internal {
        boostLevels[id] = BoostLevel(boost, price, remainingQuota, endTime, isUnlimited);
        emit LevelAdded(id, boost, price, remainingQuota, endTime, isUnlimited);
    }


    receive() external payable {}
}