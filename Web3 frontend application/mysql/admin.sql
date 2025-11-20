-- MySQL dump 10.13  Distrib 9.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: melo_db
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aux_bt`
--

DROP TABLE IF EXISTS `aux_bt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aux_bt` (
  `d` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `t` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `w` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rt` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`d`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aux_bt`
--

LOCK TABLES `aux_bt` WRITE;
/*!40000 ALTER TABLE `aux_bt` DISABLE KEYS */;
/*!40000 ALTER TABLE `aux_bt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_artist_redeem`
--

DROP TABLE IF EXISTS `t_artist_redeem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_artist_redeem` (
  `block_num` bigint NOT NULL,
  `song_id` int NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meme_token` decimal(18,8) DEFAULT '0.00000000',
  `bnb_token` decimal(18,8) DEFAULT NULL,
  `lpUnits` decimal(18,8) DEFAULT NULL,
  PRIMARY KEY (`block_num`,`song_id`,`user_address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_artist_redeem`
--

LOCK TABLES `t_artist_redeem` WRITE;
/*!40000 ALTER TABLE `t_artist_redeem` DISABLE KEYS */;
INSERT INTO `t_artist_redeem` VALUES (73099485,1,'0x90659d3ee9c954f4f540e9c21610abbee920bb81',1.26306960,0.00000013,0.00039942),(73127726,4,'0xece171841d8754118455a4fb242a28bea09a8173',10.99485019,0.00000098,0.00328534);
/*!40000 ALTER TABLE `t_artist_redeem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bnb`
--

DROP TABLE IF EXISTS `t_bnb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_bnb` (
  `bnb_amount` decimal(10,1) NOT NULL,
  PRIMARY KEY (`bnb_amount`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bnb`
--

LOCK TABLES `t_bnb` WRITE;
/*!40000 ALTER TABLE `t_bnb` DISABLE KEYS */;
INSERT INTO `t_bnb` VALUES (0.1),(0.2),(20.0),(50.0),(100.0),(200.0);
/*!40000 ALTER TABLE `t_bnb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_claim`
--

DROP TABLE IF EXISTS `t_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_claim` (
  `block_num` bigint NOT NULL,
  `song_id` int NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bnb_token` decimal(18,8) DEFAULT '0.00000000',
  `meme_token` decimal(18,8) DEFAULT '0.00000000',
  PRIMARY KEY (`block_num`,`song_id`,`user_address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_claim`
--

LOCK TABLES `t_claim` WRITE;
/*!40000 ALTER TABLE `t_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_claim_artist`
--

DROP TABLE IF EXISTS `t_claim_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_claim_artist` (
  `block_num` bigint NOT NULL,
  `song_id` int NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meme_token` decimal(18,8) DEFAULT '0.00000000',
  `bnb_token` decimal(18,8) DEFAULT NULL,
  PRIMARY KEY (`block_num`,`song_id`,`user_address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_claim_artist`
--

LOCK TABLES `t_claim_artist` WRITE;
/*!40000 ALTER TABLE `t_claim_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_claim_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_email`
--

DROP TABLE IF EXISTS `t_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_email` (
  `user_code` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_code`),
  KEY `user_email` (`user_email`),
  KEY `user_address` (`user_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_email`
--

LOCK TABLES `t_email` WRITE;
/*!40000 ALTER TABLE `t_email` DISABLE KEYS */;
INSERT INTO `t_email` VALUES ('11ikGB12',NULL,NULL),('147jD1kM',NULL,NULL),('18s1FV4w',NULL,NULL),('1b6V33rR',NULL,'garemgaremin@gmail.com'),('2532euiw',NULL,'mulyana9emuh6@gmail.com'),('29P1kYe4',NULL,NULL),('2y62qLZ5',NULL,'cym103130252@gmail.com'),('33wR69cN','0x3519cee82f4c309ee342750fde13ea5b2385ef0e',NULL),('3Hf4ZW15',NULL,'fikinfin@gmail.com'),('3s2ut9a7',NULL,'anfcryptos@gmail.com'),('49CT69nZ',NULL,'cym1031320252@gmail.com'),('4bP1Ev36',NULL,'kopetmbuh132@gmail.com'),('53XGVS85',NULL,'xehcodev@proton.me'),('5aHd49e8',NULL,NULL),('5G3kFT31',NULL,NULL),('5m37FUn5',NULL,'lihinsurvey@gmail.com'),('5T7Y5I1A',NULL,NULL),('632tW3em',NULL,'17615842680@163.com'),('6646RTEH',NULL,'2502062846@qq.com'),('6SQ4s1g9',NULL,NULL),('77HQKv23','0x20ff955ce65d1a209e5cef563bb36f523e35f084',NULL),('7EN1f1F8',NULL,NULL),('853tY7aG','0xf595e31d379c04ff357f06fc81e37281c9659de5',NULL),('86i4RjB7',NULL,'724406@qq.com'),('8DU24es9',NULL,'cym1031320252@gmail.com'),('8k1xP6H6',NULL,'ankb538@gmail.com'),('8q2XH6S1',NULL,'qwqw@qq.cc'),('93Z35dAt',NULL,NULL),('99X5aag6',NULL,NULL),('9LD325jv',NULL,NULL),('B496D1SM',NULL,'g.baitao@gmail.com'),('B5Mq16s6','0x358e42042bd7e111960bb71331724c03fa11eea0',NULL),('bx9Y671j','0xbdd6433ef36587e0b95304ed65573ef673b08346',NULL),('D36cI37D',NULL,'kartono.ak57@gmail.com'),('d5ab171L',NULL,'1031320252@qq.com'),('dCI8885k',NULL,NULL),('ds6Y89B1',NULL,'ighozayn@gmail.com'),('e75PE6E8',NULL,NULL),('EW13nd12',NULL,NULL),('f6HX966Y',NULL,'cym1031320252@gmail.com'),('fQAF9558',NULL,'uangpenghasil802@gmail.com'),('g7tTc926',NULL,NULL),('h719wZ7K',NULL,NULL),('he5w15k2',NULL,NULL),('HS457i3b',NULL,'qdwx@qq.com'),('i191Ze3J',NULL,NULL),('i2S3J5t3',NULL,NULL),('iHj91k91',NULL,'mulbdg200@gmail.com'),('j737m3xx',NULL,'111@222.333'),('k6L3gv48',NULL,NULL),('qn41SP99',NULL,NULL),('SaP8a766',NULL,'8ij@qq.com'),('sJs7187w',NULL,'c929759797@gmail.com'),('u4Wa32h9',NULL,NULL),('V43u3gg1',NULL,'sisw4361@gmail.com'),('V8V4Y5p8',NULL,'kiu@gg.kk'),('WT269Eb6',NULL,'airdropar12@gmail.com'),('wy389G4h','0xb39d48f4167519ada7a769875966907189ca13e2',NULL);
/*!40000 ALTER TABLE `t_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_music`
--

DROP TABLE IF EXISTS `t_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_music` (
  `music_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT ' 唯一',
  `song_id` int DEFAULT '0' COMMENT '歌曲ID,链上返回',
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '艺术家钱包地址',
  `music_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '音乐 URL',
  `music_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '音乐名称',
  `total_raise` decimal(10,1) DEFAULT NULL,
  `music_seconds` int DEFAULT NULL COMMENT '音乐时长 秒',
  `token_id` int DEFAULT '0' COMMENT '每个艺术家的token_id 从1 开始',
  `token_logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'logo URL',
  `token_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'token 名称',
  `token_symbol` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'token符号',
  `token_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` int DEFAULT '0' COMMENT '上链时间',
  `series_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '艺术家音乐集代理地址',
  `memetoken_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'memeToken地址',
  `is_end` tinyint DEFAULT '0' COMMENT '是否已结束',
  `confirm_time` int DEFAULT '0' COMMENT '链上确认时间戳 已包含planned_sec',
  `song_pre_id` int DEFAULT '0' COMMENT '预发布 song_id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`music_id`) USING BTREE,
  KEY `start_time` (`start_time`) USING BTREE,
  KEY `song_id` (`song_id`,`is_end`) USING BTREE,
  KEY `is_end` (`is_end`) USING BTREE,
  KEY `song_pre_id` (`song_pre_id`) USING BTREE,
  KEY `user_address` (`user_address`,`start_time`) USING BTREE,
  KEY `confirm_time` (`confirm_time` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_music`
--

LOCK TABLES `t_music` WRITE;
/*!40000 ALTER TABLE `t_music` DISABLE KEYS */;
INSERT INTO `t_music` VALUES (1,2,'0x90659d3ee9c954f4f540e9c21610abbee920bb81','https://melodylabs.io/music/2025-11-16/1763311103453-992431230.mp3','魏新雨-最美的情缘',20.0,258,2,'https://melodylabs.io/logo/2025-11-16/1763311103514-970222891.png','2121','11212','1212','','','',1763311111,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0xE95692AC8D729a3b633d281EB587832D35EB5123',1,0,0,'2025-11-16 16:38:23'),(2,3,'0x90659d3ee9c954f4f540e9c21610abbee920bb81','https://melodylabs.io/music/2025-11-16/1763311384329-584099719.mp3','刀郎-镜听(徐子尧、赵天蔚伴唱) (mp3cut.net)',20.0,273,3,'https://melodylabs.io/logo/2025-11-16/1763311384359-142881189.jpg','qwq','qq','qq','','','',1763311393,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0xfA033c72165ec20a9145E8df7d5c2E17D5cCe123',1,0,0,'2025-11-16 16:43:04'),(3,4,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-16/1763311633968-33549157.mp3','红枣树-任妙音',20.0,224,1,'https://melodylabs.io/logo/2025-11-16/1763311634013-218617333.jpg','rege','eefe','erfe','','','',1763311641,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0xfb15516afa4a7371bC89B7D69D753DF9D7Dc0123',1,0,0,'2025-11-16 16:47:14'),(4,5,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-16/1763314322528-551908544.mp3','红颜知己-安静',20.0,287,2,'https://melodylabs.io/logo/2025-11-16/1763314322610-51507907.jpg','yyt','tyty','tyt','','','',1763314330,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x470A05Fc8889d0928425bbE9E37cE8DADd417123',1,0,0,'2025-11-16 17:32:02'),(5,6,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-17/1763348880742-307695922.mp3','化风行万里-洋澜一',20.0,253,3,'https://melodylabs.io/logo/2025-11-17/1763348880821-574335681.jpg','rerer','erer','erer','','','',1763348888,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x117c5FF1b3c7b8dd364F16e308AF97e095CBa123',1,0,0,'2025-11-17 03:08:00'),(6,7,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-17/1763351824124-680432027.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,1,'https://melodylabs.io/logo/2025-11-17/1763351824186-641562106.png','d','r','e','','','',1763351827,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xd8a845093b3Eb19db79C81161b2F7A73c7C85123',1,0,0,'2025-11-17 03:57:04'),(7,1,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-17/1763351902558-273992455.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',0.2,350,1,'https://melodylabs.io/logo/2025-11-17/1763351902574-768540758.png','d','fe','fd','','','',1763300730,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0x4DeeD9386528f53A6Ff0d058c3cd878CfA21E123',1,0,0,'2025-11-17 03:58:22'),(8,11,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-17/1763351931544-687815213.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',0.2,350,4,'https://melodylabs.io/logo/2025-11-17/1763351931642-932483149.png','d','fe','fd','','','',1763375221,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0x5493634cae827AD0449BcAc501775a60B7B3d123',1,1763301035,1,'2025-11-17 03:58:51'),(11,8,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-17/1763353760439-326302485.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,2,'https://melodylabs.io/logo/2025-11-17/1763353760473-274902769.png','df','df','fd','','','',1763353764,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xb9ffaEb6cf3939f61ee283E0D0171182fc37B123',1,0,0,'2025-11-17 04:29:20'),(12,9,'0xa78f9c8d422926f523efc747101d1901a1a79639','https://melodylabs.io/music/2025-11-17/1763354423407-360976325.mp3','M500003iY6cU4YG0xi',20.0,252,1,'https://melodylabs.io/logo/2025-11-17/1763354423437-482374890.jpg','happy cat','cat','','','','',1763354429,'0x056668C52C95d33eaf2c842d4025e9fEA6E7488A','0xD9F3d8A981A3f7B5df310bE4db418D44A50eD123',1,0,0,'2025-11-17 04:40:23'),(13,10,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-17/1763374722112-500097318.mp3','白狐-陈瑞',20.0,309,4,'https://melodylabs.io/logo/2025-11-17/1763374722170-17338922.jpg','232','232','232','','','',1763374730,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x30e3C5e86E887F6c891E396489045d3Bc1934123',1,0,0,'2025-11-17 10:18:42'),(14,12,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-17/1763375336518-602827387.mp3','罗姣 - 画你 (Live)',20.0,205,5,'https://melodylabs.io/logo/2025-11-17/1763375336581-159844071.jpg','888','88','88','','','',1763375345,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0xEa2300be362939DdE86Db36790bEd8962250d123',1,0,0,'2025-11-17 10:28:56'),(15,0,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-17/1763400245957-249718017.mp3','酒醉的舞蝶',20.0,205,0,'https://melodylabs.io/logo/2025-11-17/1763400246029-504897993.jpg','kkk','kkk','','','','',0,NULL,NULL,0,1764437052,2,'2025-11-17 17:24:06'),(16,13,'0xf595e31d379c04ff357f06fc81e37281c9659de5','https://melodylabs.io/music/2025-11-19/1763531504856-978899332.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,1,'https://melodylabs.io/logo/2025-11-19/1763531504895-614895568.png','df','fd','dfd','','','',1763531513,'0x781FC90E3B1917681D145D475682a269A57cf470','0xB9D0f13CC120f2E6Be9f0F1c53226C9584205123',0,0,0,'2025-11-19 05:51:44'),(17,0,'0xf595e31d379c04ff357f06fc81e37281c9659de5','https://melodylabs.io/music/2025-11-19/1763542914243-410532958.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,0,'https://melodylabs.io/logo/2025-11-19/1763542914311-374705633.png','df','df','df','','','',0,NULL,NULL,0,0,0,'2025-11-19 09:01:54'),(18,0,'0xf595e31d379c04ff357f06fc81e37281c9659de5','https://melodylabs.io/music/2025-11-19/1763542925250-11617208.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',50.0,350,0,'https://melodylabs.io/logo/2025-11-19/1763542925296-863383710.png','df','df','df','','','',0,NULL,NULL,0,0,0,'2025-11-19 09:02:05'),(19,0,'0xf595e31d379c04ff357f06fc81e37281c9659de5','https://melodylabs.io/music/2025-11-19/1763542946300-582989489.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',0.2,350,0,'https://melodylabs.io/logo/2025-11-19/1763542946337-561326358.png','df','df','df','','','',0,NULL,NULL,0,0,0,'2025-11-19 09:02:26'),(20,0,'0xf595e31d379c04ff357f06fc81e37281c9659de5','https://melodylabs.io/music/2025-11-19/1763543208280-518034889.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,0,'https://melodylabs.io/logo/2025-11-19/1763543208337-404917887.png','df','df','df','','','',0,NULL,NULL,0,0,0,'2025-11-19 09:06:48'),(21,0,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-19/1763543259664-470639540.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,0,'https://melodylabs.io/logo/2025-11-19/1763543259725-5899443.png','df','df','df','','','',0,NULL,NULL,0,0,0,'2025-11-19 09:07:39'),(22,0,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-19/1763543346294-891156270.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,0,'https://melodylabs.io/logo/2025-11-19/1763543346322-711966673.png','df','df','df','','','',0,NULL,NULL,0,0,0,'2025-11-19 09:09:06'),(23,0,'0xdcd71eb47a743c28028acc67578e2298021fc7be','https://melodylabs.io/music/2025-11-19/1763550292985-756902329.mp3','一条小童童 - 王力宏、单依纯《爱错  》 (2025最好的地方巡回演唱会深圳站)_H',0.1,245,0,'https://melodylabs.io/logo/2025-11-19/1763550293028-217366818.png','mkton','mko','sdfsdf','','','',0,NULL,NULL,0,0,0,'2025-11-19 11:04:53'),(24,14,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-19/1763550580202-617646266.mp3','白狐-陈瑞',20.0,309,6,'https://melodylabs.io/logo/2025-11-19/1763550580259-464166507.jpg','534','343','3434','','','',1763550589,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0xdD0600DCA085DC5CE157b3f0947A918b6A216123',0,0,0,'2025-11-19 11:09:40'),(25,15,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-19/1763557361125-778490327.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',20.0,350,3,'https://melodylabs.io/logo/2025-11-19/1763557361168-615964672.png','fd','fdjk','dfdjl','','','',1763557365,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xDA5AC8183A2bc1988729F5362e30DeE6bbA1E123',1,0,0,'2025-11-19 13:02:41'),(26,16,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-19/1763557810753-489225049.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',0.2,350,4,'https://melodylabs.io/logo/2025-11-19/1763557810822-489672615.png','dfd','df','ffd','','','',1763557815,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0x33a9cbfB69249eDE7A27836377Baa3103319C123',1,0,0,'2025-11-19 13:10:10'),(27,17,'0xbdd6433ef36587e0b95304ed65573ef673b08346','https://melodylabs.io/music/2025-11-19/1763558506120-428555540.mp3','obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021',0.2,350,5,'https://melodylabs.io/logo/2025-11-19/1763558506141-139722013.png','dfd','dfd','dfd','','','',1763558510,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xF07520603797102D6a31f51E2b24f4eBCF466123',1,0,0,'2025-11-19 13:21:46'),(28,18,'0xece171841d8754118455a4fb242a28bea09a8173','https://melodylabs.io/music/2025-11-19/1763559045827-156442452.mp3','陈瑞-情罪',0.1,285,7,'https://melodylabs.io/logo/2025-11-19/1763559045936-632733663.jpg','f34r3','3rf3rf','3rf3r4','','','',1763559055,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x778D22C17D7dedC1CEFd35056fF6D53297967123',0,0,0,'2025-11-19 13:30:45'),(29,19,'0xa78f9c8d422926f523efc747101d1901a1a79639','https://melodylabs.io/music/2025-11-19/1763569084383-186157546.mp3','M500003iY6cU4YG0xi',0.1,252,2,'https://melodylabs.io/logo/2025-11-19/1763569084402-444845621.jpg','43token','43','','','','',1763569128,'0x056668C52C95d33eaf2c842d4025e9fEA6E7488A','0x185909Cb8832348E0089073fbD758E7C57D4f123',0,0,0,'2025-11-19 16:18:04');
/*!40000 ALTER TABLE `t_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_music_sub`
--

DROP TABLE IF EXISTS `t_music_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_music_sub` (
  `sub_id` int unsigned NOT NULL,
  `song_id` int NOT NULL,
  `block_num` bigint NOT NULL,
  `token_id` int NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_second` int DEFAULT '0',
  `sub_seconds` int NOT NULL DEFAULT '0',
  `sub_type` tinyint DEFAULT '0',
  `sub_amount` decimal(18,8) DEFAULT '0.00000000',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `series_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meme_token` int DEFAULT '0',
  `tx_hash` char(66) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash_time` int DEFAULT NULL,
  PRIMARY KEY (`block_num`,`sub_id`,`song_id`) USING BTREE,
  KEY `song_id` (`user_address`,`song_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_music_sub`
--

LOCK TABLES `t_music_sub` WRITE;
/*!40000 ALTER TABLE `t_music_sub` DISABLE KEYS */;
INSERT INTO `t_music_sub` VALUES (1,1,73098068,1,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,10000,0,0.10000000,'2025-11-17 10:26:21','0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1000000,'0xb1955bb847078aeac12669c4be3a141fe9c0d75f4e30aa9c46fba04177070acd',1763300866),(1,2,73121202,2,'0x90659d3eE9C954F4f540E9c21610abbeE920bB81',0,12900,0,0.10000000,'2025-11-17 10:26:25','0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1290000,'0xfe11333fcd1542a9b0273c0b086a53f8cfe7fc82c0b623ef912d9e77a1a4e645',1763311281),(2,2,73121800,2,'0xEcE171841D8754118455A4FB242a28bEa09a8173',12900,12900,0,0.10000000,'2025-11-17 10:26:25','0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1290000,'0xa64febce4928db0d5ad7c680a152a81a004faa130f751bd0d2338b1758df8432',1763311550),(1,3,73121839,3,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,13650,0,0.10000000,'2025-11-17 10:26:25','0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1365000,'0x2203b1e044590d900ddf412c309312d481201c1adaec159625cc3f9f0a1c2d78',1763311568),(1,4,73123037,1,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,11200,0,0.10000000,'2025-11-17 10:26:25','0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',1120000,'0x5c6ff33987388eeeec8c84ce8ff2b558f47c4045d719f85b712d91d35187b150',1763312107),(1,5,73128293,2,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,14350,0,0.10000000,'2025-11-17 10:26:27','0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',1435000,'0xaaad41ce526c59e60efb97fdc0f10ffbafc434d0a23166603f2f7249c2c335c7',1763314475),(1,6,73204752,3,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,12650,0,0.10000000,'2025-11-17 10:26:41','0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',1265000,'0x6b7160e4984463ec1d96f3af6e33cca5f1129c3fc09573a7cc069abedd57a5e5',1763349044),(1,12,73263060,5,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,10250,0,0.10000000,'2025-11-17 10:31:25','0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',1025000,'0x3c83b5f3775874d040ab0ac0f63dfffa8ed041422739d87781590df7b8434907',1763375484),(1,11,73263535,4,'0xEcE171841D8754118455A4FB242a28bEa09a8173',0,10000,0,0.10000000,'2025-11-17 10:34:59','0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1000000,'0x08ebccd16b040eeddf6391e04d2fe85d98fde27169c46fb42e44f1496596cf76',1763375698),(1,15,73665920,3,'0xBdd6433Ef36587E0b95304ed65573eF673B08346',0,17500,0,0.10000000,'2025-11-19 13:09:08','0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',1750000,'0x474b2c356812314b830a0fb9a0cfc471119a17c963f4fcf1f185586ee9c41e72',1763557747),(2,15,73665987,3,'0xEcE171841D8754118455A4FB242a28bEa09a8173',17500,17500,0,0.10000000,'2025-11-19 13:09:38','0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',1750000,'0xc763a22ff1258e3c611855e840cc40432f9144ec8ad64010cd491b9269d3f5b3',1763557777),(1,16,73666979,4,'0x20fF955CE65D1A209E5CEf563bb36F523e35f084',0,1750000,0,0.10000000,'2025-11-19 13:17:05','0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',175000000,'0x84099cad58361914b2529d4ece066b6e98614c7bbb9be7d51fd65e8177bfb76c',1763558225),(1,17,73668010,5,'0xBdd6433Ef36587E0b95304ed65573eF673B08346',0,1750000,0,0.10000000,'2025-11-19 13:24:52','0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',175000000,'0xdf71a7dc530aeadfae103449be7341c546afab4ea10c5c91351f23f70c0fb4ef',1763558691),(2,17,73668113,5,'0x20fF955CE65D1A209E5CEf563bb36F523e35f084',1750000,1575000,0,0.09000000,'2025-11-19 13:25:40','0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',157500000,'0xf63e2207959008c7efe00883d0094c899e9c7a16f9238724b4c70baf7629cce2',1763558738);
/*!40000 ALTER TABLE `t_music_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_nftcon`
--

DROP TABLE IF EXISTS `t_nftcon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nftcon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `block_num` bigint DEFAULT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `block_num` (`block_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_nftcon`
--

LOCK TABLES `t_nftcon` WRITE;
/*!40000 ALTER TABLE `t_nftcon` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_nftcon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_nftearly`
--

DROP TABLE IF EXISTS `t_nftearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nftearly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `block_num` bigint DEFAULT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `block_num` (`block_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_nftearly`
--

LOCK TABLES `t_nftearly` WRITE;
/*!40000 ALTER TABLE `t_nftearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_nftearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_nftog`
--

DROP TABLE IF EXISTS `t_nftog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_nftog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `block_num` bigint DEFAULT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `block_num` (`block_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_nftog`
--

LOCK TABLES `t_nftog` WRITE;
/*!40000 ALTER TABLE `t_nftog` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_nftog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_play_all`
--

DROP TABLE IF EXISTS `t_play_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_play_all` (
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music_id` int unsigned NOT NULL,
  `song_id` int DEFAULT NULL,
  `music_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music_seconds` int DEFAULT NULL,
  `token_id` int DEFAULT NULL,
  `token_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_symbol` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `artist_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist_avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`music_id`) USING BTREE,
  KEY `play_time` (`create_time` DESC),
  KEY `idx_user_address` (`user_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_play_all`
--

LOCK TABLES `t_play_all` WRITE;
/*!40000 ALTER TABLE `t_play_all` DISABLE KEYS */;
INSERT INTO `t_play_all` VALUES ('0x90659d3ee9c954f4f540e9c21610abbee920bb81','user1052','https://melodylabs.io/u2.svg',1,2,'魏新雨-最美的情缘','https://melodylabs.io/music/2025-11-16/1763311103453-992431230.mp3',258,2,'2121','11212','https://melodylabs.io/logo/2025-11-16/1763311103514-970222891.png',1763311111,'2025-11-16 17:28:04','qweq','https://melodylabs.io/avatar/2025-11-17/1763349190836-259533184.jpg'),('0x90659d3ee9c954f4f540e9c21610abbee920bb81','user1052','https://melodylabs.io/u2.svg',2,3,'刀郎-镜听(徐子尧、赵天蔚伴唱) (mp3cut.net)','https://melodylabs.io/music/2025-11-16/1763311384329-584099719.mp3',273,3,'qwq','qq','https://melodylabs.io/logo/2025-11-16/1763311384359-142881189.jpg',1763311393,'2025-11-16 17:28:02','qweq','https://melodylabs.io/avatar/2025-11-17/1763349190836-259533184.jpg'),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',3,4,'红枣树-任妙音','https://melodylabs.io/music/2025-11-16/1763311633968-33549157.mp3',224,1,'rege','eefe','https://melodylabs.io/logo/2025-11-16/1763311634013-218617333.jpg',1763311641,'2025-11-16 17:27:55','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',4,5,'红颜知己-安静','https://melodylabs.io/music/2025-11-16/1763314322528-551908544.mp3',287,2,'yyt','tyty','https://melodylabs.io/logo/2025-11-16/1763314322610-51507907.jpg',1763314330,'2025-11-17 03:01:16','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',5,6,'化风行万里-洋澜一','https://melodylabs.io/music/2025-11-17/1763348880742-307695922.mp3',253,3,'rerer','erer','https://melodylabs.io/logo/2025-11-17/1763348880821-574335681.jpg',1763348888,'2025-11-17 03:13:31','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0xbdd6433ef36587e0b95304ed65573ef673b08346','user770','https://melodylabs.io/u1.svg',7,1,'obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021','https://melodylabs.io/music/2025-11-17/1763351902558-273992455.mp3',350,1,'d','fe','https://melodylabs.io/logo/2025-11-17/1763351902574-768540758.png',1763300730,'2025-11-17 16:53:19','m','https://melodylabs.io/avatar/2025-11-17/1763351783211-56059886.png'),('0xbdd6433ef36587e0b95304ed65573ef673b08346','user770','https://melodylabs.io/u1.svg',8,11,'obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021','https://melodylabs.io/music/2025-11-17/1763351931544-687815213.mp3',350,4,'d','fe','https://melodylabs.io/logo/2025-11-17/1763351931642-932483149.png',1763375221,'2025-11-17 16:53:26','m','https://melodylabs.io/avatar/2025-11-17/1763351783211-56059886.png'),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',14,12,'罗姣 - 画你 (Live)','https://melodylabs.io/music/2025-11-17/1763375336518-602827387.mp3',205,5,'888','88','https://melodylabs.io/logo/2025-11-17/1763375336581-159844071.jpg',1763375345,'2025-11-19 02:48:38','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',15,0,'酒醉的舞蝶','https://melodylabs.io/music/2025-11-17/1763400245957-249718017.mp3',205,0,'kkk','kkk','https://melodylabs.io/logo/2025-11-17/1763400246029-504897993.jpg',0,'2025-11-19 02:48:16','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg');
/*!40000 ALTER TABLE `t_play_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_play_user`
--

DROP TABLE IF EXISTS `t_play_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_play_user` (
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music_id` int unsigned NOT NULL,
  `song_id` int DEFAULT NULL,
  `music_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `music_seconds` int DEFAULT NULL,
  `token_id` int DEFAULT NULL,
  `token_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_symbol` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `artist_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist_avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_address`,`music_id`) USING BTREE,
  KEY `play_time` (`create_time` DESC),
  KEY `idx_music_id` (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_play_user`
--

LOCK TABLES `t_play_user` WRITE;
/*!40000 ALTER TABLE `t_play_user` DISABLE KEYS */;
INSERT INTO `t_play_user` VALUES ('0x20ff955ce65d1a209e5cef563bb36f523e35f084','user820','https://melodylabs.io/u1.svg',14,12,'罗姣 - 画你 (Live)','https://melodylabs.io/music/2025-11-17/1763375336518-602827387.mp3',205,5,'888','88','https://melodylabs.io/logo/2025-11-17/1763375336581-159844071.jpg',1763375345,'2025-11-19 02:48:38','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0x20ff955ce65d1a209e5cef563bb36f523e35f084','user820','https://melodylabs.io/u1.svg',15,0,'酒醉的舞蝶','https://melodylabs.io/music/2025-11-17/1763400245957-249718017.mp3',205,0,'kkk','kkk','https://melodylabs.io/logo/2025-11-17/1763400246029-504897993.jpg',0,'2025-11-19 02:48:16','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0x90659d3ee9c954f4f540e9c21610abbee920bb81','user820','https://melodylabs.io/u1.svg',5,6,'化风行万里-洋澜一','https://melodylabs.io/music/2025-11-17/1763348880742-307695922.mp3',253,3,'rerer','erer','https://melodylabs.io/logo/2025-11-17/1763348880821-574335681.jpg',1763348888,'2025-11-17 03:13:31','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg'),('0xece171841d8754118455a4fb242a28bea09a8173','user1052','https://melodylabs.io/u2.svg',1,2,'魏新雨-最美的情缘','https://melodylabs.io/music/2025-11-16/1763311103453-992431230.mp3',258,2,'2121','11212','https://melodylabs.io/logo/2025-11-16/1763311103514-970222891.png',1763311111,'2025-11-16 17:28:04','qweq','https://melodylabs.io/avatar/2025-11-16/1763305139279-565892295.png'),('0xece171841d8754118455a4fb242a28bea09a8173','user1052','https://melodylabs.io/u2.svg',2,3,'刀郎-镜听(徐子尧、赵天蔚伴唱) (mp3cut.net)','https://melodylabs.io/music/2025-11-16/1763311384329-584099719.mp3',273,3,'qwq','qq','https://melodylabs.io/logo/2025-11-16/1763311384359-142881189.jpg',1763311393,'2025-11-16 17:28:02','qweq','https://melodylabs.io/avatar/2025-11-16/1763305139279-565892295.png'),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',3,4,'红枣树-任妙音','https://melodylabs.io/music/2025-11-16/1763311633968-33549157.mp3',224,1,'rege','eefe','https://melodylabs.io/logo/2025-11-16/1763311634013-218617333.jpg',1763311641,'2025-11-16 17:27:55',NULL,NULL),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',4,5,'红颜知己-安静','https://melodylabs.io/music/2025-11-16/1763314322528-551908544.mp3',287,2,'yyt','tyty','https://melodylabs.io/logo/2025-11-16/1763314322610-51507907.jpg',1763314330,'2025-11-17 03:01:16','43434','https://melodylabs.io/avatar/2025-11-16/1763314122310-138918318.jpg'),('0xece171841d8754118455a4fb242a28bea09a8173','user770','https://melodylabs.io/u1.svg',7,1,'obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021','https://melodylabs.io/music/2025-11-17/1763351902558-273992455.mp3',350,1,'d','fe','https://melodylabs.io/logo/2025-11-17/1763351902574-768540758.png',1763300730,'2025-11-17 16:53:19','m','https://melodylabs.io/avatar/2025-11-17/1763351783211-56059886.png'),('0xece171841d8754118455a4fb242a28bea09a8173','user770','https://melodylabs.io/u1.svg',8,11,'obj_wo3DlMOGwrbDjj7DisKw_34428189303_308e_954e_7924_e6bfe1f372aad42d05267db5c441b021','https://melodylabs.io/music/2025-11-17/1763351931544-687815213.mp3',350,4,'d','fe','https://melodylabs.io/logo/2025-11-17/1763351931642-932483149.png',1763375221,'2025-11-17 16:53:26','m','https://melodylabs.io/avatar/2025-11-17/1763351783211-56059886.png');
/*!40000 ALTER TABLE `t_play_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_slat`
--

DROP TABLE IF EXISTS `t_slat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_slat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slat` char(66) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` tinyint DEFAULT '0' COMMENT '0 no use,1 pre use,2 use',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `slat` (`slat`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_slat`
--

LOCK TABLES `t_slat` WRITE;
/*!40000 ALTER TABLE `t_slat` DISABLE KEYS */;
INSERT INTO `t_slat` VALUES (1,'0x0000000000000000000000000000000000000000000000000000000000001624',1),(2,'0x0000000000000000000000000000000000000000000000000000000000001687',1),(5,'0x0000000000000000000000000000000000000000000000000000000000001f6d',1),(6,'0x00000000000000000000000000000000000000000000000000000000000033be',1),(7,'0x0000000000000000000000000000000000000000000000000000000000003e41',1),(8,'0x0000000000000000000000000000000000000000000000000000000000004228',1),(9,'0x0000000000000000000000000000000000000000000000000000000000004a8a',1),(10,'0x0000000000000000000000000000000000000000000000000000000000004b06',1),(11,'0x0000000000000000000000000000000000000000000000000000000000005f1a',1),(12,'0x0000000000000000000000000000000000000000000000000000000000006765',1),(13,'0x0000000000000000000000000000000000000000000000000000000000006b6e',1),(14,'0x0000000000000000000000000000000000000000000000000000000000006c10',1),(15,'0x00000000000000000000000000000000000000000000000000000000000081ea',1),(16,'0x00000000000000000000000000000000000000000000000000000000000083b8',1),(17,'0x0000000000000000000000000000000000000000000000000000000000008973',1),(18,'0x00000000000000000000000000000000000000000000000000000000000091d8',1),(19,'0x0000000000000000000000000000000000000000000000000000000000009a4d',1),(20,'0x000000000000000000000000000000000000000000000000000000000000a1b6',1),(21,'0x000000000000000000000000000000000000000000000000000000000000c2f2',1),(22,'0x000000000000000000000000000000000000000000000000000000000000c58a',1),(23,'0x000000000000000000000000000000000000000000000000000000000000c842',1),(24,'0x000000000000000000000000000000000000000000000000000000000000de73',1),(25,'0x000000000000000000000000000000000000000000000000000000000000e149',1),(26,'0x000000000000000000000000000000000000000000000000000000000000e7d4',1),(27,'0x000000000000000000000000000000000000000000000000000000000000fd90',1),(28,'0x0000000000000000000000000000000000000000000000000000000000010514',1),(29,'0x000000000000000000000000000000000000000000000000000000000001382e',1),(30,'0x0000000000000000000000000000000000000000000000000000000000013b48',1),(31,'0x0000000000000000000000000000000000000000000000000000000000014b9a',1),(32,'0x0000000000000000000000000000000000000000000000000000000000016fc2',1),(33,'0x0000000000000000000000000000000000000000000000000000000000017548',1),(34,'0x000000000000000000000000000000000000000000000000000000000001804f',0),(35,'0x0000000000000000000000000000000000000000000000000000000000018072',0),(36,'0x000000000000000000000000000000000000000000000000000000000001a7ed',0),(37,'0x000000000000000000000000000000000000000000000000000000000001a8a5',0),(38,'0x000000000000000000000000000000000000000000000000000000000001ac48',0),(39,'0x000000000000000000000000000000000000000000000000000000000001bceb',0),(40,'0x000000000000000000000000000000000000000000000000000000000001c8bd',0),(41,'0x000000000000000000000000000000000000000000000000000000000001f69e',0),(42,'0x000000000000000000000000000000000000000000000000000000000001fec0',0),(43,'0x000000000000000000000000000000000000000000000000000000000002102c',0),(44,'0x0000000000000000000000000000000000000000000000000000000000022ea5',0),(45,'0x0000000000000000000000000000000000000000000000000000000000023383',0),(46,'0x0000000000000000000000000000000000000000000000000000000000025d88',0),(47,'0x0000000000000000000000000000000000000000000000000000000000029670',0),(48,'0x000000000000000000000000000000000000000000000000000000000002b939',0),(49,'0x000000000000000000000000000000000000000000000000000000000002cb7f',0),(50,'0x000000000000000000000000000000000000000000000000000000000002eb9b',0),(51,'0x000000000000000000000000000000000000000000000000000000000002ef69',0),(52,'0x000000000000000000000000000000000000000000000000000000000002f23e',0),(53,'0x00000000000000000000000000000000000000000000000000000000000315d4',0),(54,'0x0000000000000000000000000000000000000000000000000000000000033c8d',0),(107,'0x000000000000000000000000000000000000000000000000000000000003412c',0),(108,'0x0000000000000000000000000000000000000000000000000000000000034dc9',0),(109,'0x0000000000000000000000000000000000000000000000000000000000036033',0),(110,'0x0000000000000000000000000000000000000000000000000000000000036b12',0),(111,'0x00000000000000000000000000000000000000000000000000000000000371d3',0),(112,'0x00000000000000000000000000000000000000000000000000000000000378be',0),(113,'0x000000000000000000000000000000000000000000000000000000000003a8bc',0),(114,'0x000000000000000000000000000000000000000000000000000000000003b175',0),(115,'0x000000000000000000000000000000000000000000000000000000000003b1a7',0),(116,'0x000000000000000000000000000000000000000000000000000000000003c5b8',0),(117,'0x000000000000000000000000000000000000000000000000000000000003c866',0),(118,'0x000000000000000000000000000000000000000000000000000000000003cddf',0),(119,'0x000000000000000000000000000000000000000000000000000000000003d63c',0),(120,'0x0000000000000000000000000000000000000000000000000000000000040677',0),(121,'0x00000000000000000000000000000000000000000000000000000000000418b5',0),(122,'0x0000000000000000000000000000000000000000000000000000000000041d96',0),(123,'0x0000000000000000000000000000000000000000000000000000000000041f15',0),(124,'0x0000000000000000000000000000000000000000000000000000000000042450',0),(125,'0x0000000000000000000000000000000000000000000000000000000000042b02',0),(126,'0x0000000000000000000000000000000000000000000000000000000000043d66',0),(127,'0x000000000000000000000000000000000000000000000000000000000004468d',0),(128,'0x00000000000000000000000000000000000000000000000000000000000450ea',0),(129,'0x0000000000000000000000000000000000000000000000000000000000045af4',0),(130,'0x0000000000000000000000000000000000000000000000000000000000045be6',0),(131,'0x0000000000000000000000000000000000000000000000000000000000045fb5',0),(132,'0x00000000000000000000000000000000000000000000000000000000000478e6',0),(133,'0x0000000000000000000000000000000000000000000000000000000000048ae6',0),(134,'0x0000000000000000000000000000000000000000000000000000000000049121',0),(135,'0x0000000000000000000000000000000000000000000000000000000000049ac6',0),(136,'0x000000000000000000000000000000000000000000000000000000000004a99e',0),(137,'0x000000000000000000000000000000000000000000000000000000000004c002',0),(138,'0x000000000000000000000000000000000000000000000000000000000004c71e',0),(139,'0x000000000000000000000000000000000000000000000000000000000004dbba',0),(140,'0x000000000000000000000000000000000000000000000000000000000004e290',0),(141,'0x000000000000000000000000000000000000000000000000000000000004f08e',0),(142,'0x000000000000000000000000000000000000000000000000000000000004fa83',0),(143,'0x00000000000000000000000000000000000000000000000000000000000502d1',0),(144,'0x00000000000000000000000000000000000000000000000000000000000518a7',0),(145,'0x0000000000000000000000000000000000000000000000000000000000054574',0),(146,'0x0000000000000000000000000000000000000000000000000000000000054685',0),(147,'0x000000000000000000000000000000000000000000000000000000000005666d',0),(148,'0x00000000000000000000000000000000000000000000000000000000000587c7',0),(149,'0x000000000000000000000000000000000000000000000000000000000005887f',0),(150,'0x00000000000000000000000000000000000000000000000000000000000596e4',0),(151,'0x000000000000000000000000000000000000000000000000000000000005a364',0),(152,'0x000000000000000000000000000000000000000000000000000000000005c64c',0),(153,'0x000000000000000000000000000000000000000000000000000000000005d49c',0),(154,'0x000000000000000000000000000000000000000000000000000000000005efc6',0),(155,'0x000000000000000000000000000000000000000000000000000000000006072c',0),(156,'0x000000000000000000000000000000000000000000000000000000000006251a',0);
/*!40000 ALTER TABLE `t_slat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_type` tinyint DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_link` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instgram` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist_avatar` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `artist_desc` text COLLATE utf8mb4_unicode_ci,
  `artist_link` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_address`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('0x20ff955ce65d1a209e5cef563bb36f523e35f084','user778','https://melodylabs.io/u2.svg',NULL,1,'2025-11-19 02:47:14',NULL,'','','','','CZ','https://melodylabs.io/avatar/2025-11-19/1763522002329-724504178.jpg','',''),('0x358e42042bd7e111960bb71331724c03fa11eea0','user798','https://melodylabs.io/u1.svg',NULL,1,'2025-11-17 09:33:49',NULL,'','','','','rew','https://melodylabs.io/avatar/2025-11-17/1763372078598-936146337.jpg','aca','caca'),('0x611f30cbab6bf4cf0218dd422d39d058c692921b','user696','https://melodylabs.io/u1.svg',NULL,0,'2025-11-18 06:37:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('0x8ee0ece75ebf7faea586515f05ed5fec6ab34ba0','user657','https://melodylabs.io/u2.svg',NULL,0,'2025-11-17 04:01:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('0x90659d3ee9c954f4f540e9c21610abbee920bb81','user1052','https://melodylabs.io/u2.svg',NULL,1,'2025-11-16 14:58:14',NULL,'qwqw.gd','','','','qweq','https://melodylabs.io/avatar/2025-11-17/1763349190836-259533184.jpg','qwqw','qwqqw'),('0xa78f9c8d422926f523efc747101d1901a1a79639','user1120','https://melodylabs.io/u3.svg',NULL,1,'2025-11-17 04:26:09',NULL,'','','','','Melody_artist','https://melodylabs.io/avatar/2025-11-17/1763354169774-980504828.jpg','i am artist','aa'),('0xb39d48f4167519ada7a769875966907189ca13e2','user860','https://melodylabs.io/u1.svg',NULL,0,'2025-11-16 14:56:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('0xbdd6433ef36587e0b95304ed65573ef673b08346','user770','https://melodylabs.io/u1.svg',NULL,1,'2025-11-17 03:55:51',NULL,'','','','','m','https://melodylabs.io/avatar/2025-11-17/1763351783211-56059886.png','d','d'),('0xdcd71eb47a743c28028acc67578e2298021fc7be','user1468','https://melodylabs.io/u3.svg',NULL,1,'2025-11-19 10:52:21',NULL,'https://x.com/0xE66890','','','','jk','https://melodylabs.io/avatar/2025-11-19/1763549629353-942878437.jpg','jjjjj',''),('0xece171841d8754118455a4fb242a28bea09a8173','user820','https://melodylabs.io/u1.svg',NULL,1,'2025-11-16 16:35:25',NULL,'','','','','43434','https://melodylabs.io/avatar/2025-11-17/1763349146663-959373135.jpg','343','34343'),('0xf595e31d379c04ff357f06fc81e37281c9659de5','user1320','https://app.melodylabs.io/u1.svg',NULL,1,'2025-11-17 03:22:41',NULL,'','','','','h','https://melodylabs.io/avatar/2025-11-19/1763531427644-529359826.png','gjgh','fgf');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `up_user` AFTER UPDATE ON `t_user` FOR EACH ROW BEGIN
    
	update t_play_all set artist_name=new.artist_name,artist_avatar=new.artist_avatar where user_address=new.user_address;
	
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `t_user_redeem`
--

DROP TABLE IF EXISTS `t_user_redeem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_redeem` (
  `block_num` bigint NOT NULL,
  `song_id` int NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meme_token` decimal(18,8) DEFAULT '0.00000000',
  `bnb_token` decimal(18,8) DEFAULT NULL,
  `liqRemoved` decimal(18,8) DEFAULT NULL,
  PRIMARY KEY (`block_num`,`song_id`) USING BTREE,
  KEY `song_id` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_redeem`
--

LOCK TABLES `t_user_redeem` WRITE;
/*!40000 ALTER TABLE `t_user_redeem` DISABLE KEYS */;
INSERT INTO `t_user_redeem` VALUES (73099314,1,'0xece171841d8754118455a4fb242a28bea09a8173',530000.00000000,0.05300000,167.60071599),(73099485,1,'0x83f9ac4ef8d77d2fa7d765eb9697834e4d6d67cb',1.26306960,0.00000013,0.00039942),(73127650,2,'0xece171841d8754118455a4fb242a28bea09a8173',722400.00000000,0.05600000,201.13279196),(73127726,4,'0x83f9ac4ef8d77d2fa7d765eb9697834e4d6d67cb',10.99485019,0.00000098,0.00328534),(73271195,12,'0xece171841d8754118455a4fb242a28bea09a8173',543250.00000000,0.05300000,169.68279229),(73276234,11,'0xece171841d8754118455a4fb242a28bea09a8173',530000.00000000,0.05300000,167.60071599),(73313835,3,'0xece171841d8754118455a4fb242a28bea09a8173',723450.00000000,0.05300000,195.81330394),(73652158,5,'0xece171841d8754118455a4fb242a28bea09a8173',760550.00000000,0.05300000,200.77138740),(73666265,15,'0xbdd6433ef36587e0b95304ed65573ef673b08346',0.00000000,0.00000000,209.16500663),(73669165,16,'0x20ff955ce65d1a209e5cef563bb36f523e35f084',0.00000000,0.00000000,2091.65006634);
/*!40000 ALTER TABLE `t_user_redeem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_related`
--

DROP TABLE IF EXISTS `t_user_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_related` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_related`
--

LOCK TABLES `t_user_related` WRITE;
/*!40000 ALTER TABLE `t_user_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_whitelist`
--

DROP TABLE IF EXISTS `t_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_whitelist` (
  `token_id` int NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `block_num` bigint NOT NULL,
  `series_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`block_num`,`song_id`,`user_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_whitelist`
--

LOCK TABLES `t_whitelist` WRITE;
/*!40000 ALTER TABLE `t_whitelist` DISABLE KEYS */;
INSERT INTO `t_whitelist` VALUES (1,'0xece171841d8754118455a4fb242a28bea09a8173',73097829,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1),(2,'0x90659d3ee9c954f4f540e9c21610abbee920bb81',73120891,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',2),(3,'0xece171841d8754118455a4fb242a28bea09a8173',73121566,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',3),(1,'0xece171841d8754118455a4fb242a28bea09a8173',73122055,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',4),(2,'0xece171841d8754118455a4fb242a28bea09a8173',73128036,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',5),(3,'0xece171841d8754118455a4fb242a28bea09a8173',73204485,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',6),(5,'0xece171841d8754118455a4fb242a28bea09a8173',73262831,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',12),(6,'0x03b7663000f9331ba034a8d7aa7c5ef2187d65e4',73650924,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',14),(5,'0x20ff955ce65d1a209e5cef563bb36f523e35f084',73667775,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',17),(5,'0xbdd6433ef36587e0b95304ed65573ef673b08346',73667775,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',17),(7,'0x03b7663000f9331ba034a8d7aa7c5ef2187d65e4',73668997,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',18);
/*!40000 ALTER TABLE `t_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_music`
--

DROP TABLE IF EXISTS `v_music`;
/*!50001 DROP VIEW IF EXISTS `v_music`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_music` AS SELECT 
 1 AS `music_id`,
 1 AS `user_address`,
 1 AS `music_url`,
 1 AS `music_name`,
 1 AS `total_raise`,
 1 AS `music_seconds`,
 1 AS `token_id`,
 1 AS `token_logo`,
 1 AS `token_name`,
 1 AS `token_symbol`,
 1 AS `token_desc`,
 1 AS `website`,
 1 AS `twitter`,
 1 AS `confirm_time`,
 1 AS `song_id`,
 1 AS `user_avatar`,
 1 AS `user_name`,
 1 AS `artist_avatar`,
 1 AS `artist_desc`,
 1 AS `artist_name`,
 1 AS `total_sub_amount`,
 1 AS `telegram`,
 1 AS `series_address`,
 1 AS `memetoken_address`,
 1 AS `is_end`,
 1 AS `artist_link`,
 1 AS `start_time`,
 1 AS `create_time`,
 1 AS `now_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_music_sub`
--

DROP TABLE IF EXISTS `v_music_sub`;
/*!50001 DROP VIEW IF EXISTS `v_music_sub`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_music_sub` AS SELECT 
 1 AS `sub_id`,
 1 AS `song_id`,
 1 AS `token_id`,
 1 AS `user_address`,
 1 AS `sub_amount`,
 1 AS `create_time`,
 1 AS `music_id`,
 1 AS `music_name`,
 1 AS `music_url`,
 1 AS `music_seconds`,
 1 AS `token_name`,
 1 AS `token_symbol`,
 1 AS `token_logo`,
 1 AS `start_time`,
 1 AS `user_name`,
 1 AS `user_avatar`,
 1 AS `now_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_play_all`
--

DROP TABLE IF EXISTS `v_play_all`;
/*!50001 DROP VIEW IF EXISTS `v_play_all`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_play_all` AS SELECT 
 1 AS `user_address`,
 1 AS `user_name`,
 1 AS `user_avatar`,
 1 AS `music_id`,
 1 AS `song_id`,
 1 AS `music_name`,
 1 AS `music_url`,
 1 AS `music_seconds`,
 1 AS `token_id`,
 1 AS `token_name`,
 1 AS `artist_name`,
 1 AS `artist_avatar`,
 1 AS `token_symbol`,
 1 AS `token_logo`,
 1 AS `start_time`,
 1 AS `create_time`,
 1 AS `now_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_play_user`
--

DROP TABLE IF EXISTS `v_play_user`;
/*!50001 DROP VIEW IF EXISTS `v_play_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_play_user` AS SELECT 
 1 AS `user_address`,
 1 AS `user_name`,
 1 AS `user_avatar`,
 1 AS `music_id`,
 1 AS `song_id`,
 1 AS `music_name`,
 1 AS `music_url`,
 1 AS `music_seconds`,
 1 AS `token_id`,
 1 AS `artist_name`,
 1 AS `artist_avatar`,
 1 AS `token_name`,
 1 AS `token_symbol`,
 1 AS `token_logo`,
 1 AS `start_time`,
 1 AS `create_time`,
 1 AS `now_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `w_artist`
--

DROP TABLE IF EXISTS `w_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_artist` (
  `block_num` bigint NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`block_num`,`user_address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_artist`
--

LOCK TABLES `w_artist` WRITE;
/*!40000 ALTER TABLE `w_artist` DISABLE KEYS */;
INSERT INTO `w_artist` VALUES (73097235,'0x90659d3eE9C954F4f540E9c21610abbeE920bB81'),(73097244,'0xEcE171841D8754118455A4FB242a28bEa09a8173'),(73210778,'0xBdd6433Ef36587E0b95304ed65573eF673B08346'),(73216083,'0xA78f9C8D422926f523Efc747101D1901a1a79639'),(73255473,'0x358E42042bD7E111960bB71331724c03fA11eea0'),(73588449,'0x20fF955CE65D1A209E5CEf563bb36F523e35f084'),(73609058,'0xF595e31D379c04Ff357f06FC81e37281C9659dE5'),(73648681,'0xDCd71EB47a743C28028aCc67578e2298021FC7Be');
/*!40000 ALTER TABLE `w_artist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `artist_insert` AFTER INSERT ON `w_artist` FOR EACH ROW BEGIN
	update t_user set user_type=1 where user_address=new.user_address;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `w_finalized`
--

DROP TABLE IF EXISTS `w_finalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_finalized` (
  `block_num` bigint NOT NULL,
  `token_id` int NOT NULL,
  `series_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `song_id` int NOT NULL,
  `liquidity` decimal(18,8) DEFAULT NULL,
  `lp_token_id` int DEFAULT NULL,
  PRIMARY KEY (`block_num`,`song_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_finalized`
--

LOCK TABLES `w_finalized` WRITE;
/*!40000 ALTER TABLE `w_finalized` DISABLE KEYS */;
INSERT INTO `w_finalized` VALUES (73098910,1,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',1,316.22776602,26535),(73122997,3,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',3,369.45906404,26538),(73123003,2,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',2,718.33139984,26539),(73123259,1,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',4,334.66401061,26540),(73129085,2,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',5,378.81393850,26542),(73215950,3,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',6,355.66838488,26550),(73263611,4,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06',11,316.22776602,26627),(73263875,5,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef',12,320.15621187,26628),(73666149,3,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',15,836.66002653,26770),(73667147,4,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9',16,4183.30013267,26772);
/*!40000 ALTER TABLE `w_finalized` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `finalized_insert` AFTER INSERT ON `w_finalized` FOR EACH ROW BEGIN
	update t_music set is_end=1 where token_id=new.token_id;
	
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `w_musc_pre`
--

DROP TABLE IF EXISTS `w_musc_pre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_musc_pre` (
  `block_num` bigint DEFAULT NULL,
  `music_id` int unsigned NOT NULL,
  `user_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `song_pre_id` int DEFAULT NULL,
  `planned_sec` int DEFAULT NULL,
  `confirm_time` int DEFAULT NULL,
  PRIMARY KEY (`music_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_musc_pre`
--

LOCK TABLES `w_musc_pre` WRITE;
/*!40000 ALTER TABLE `w_musc_pre` DISABLE KEYS */;
INSERT INTO `w_musc_pre` VALUES (73097777,8,'0x90659d3ee9c954f4f540e9c21610abbee920bb81',1,300,1763301035),(73318033,15,'0xece171841d8754118455a4fb242a28bea09a8173',2,1036798,1764437052);
/*!40000 ALTER TABLE `w_musc_pre` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `muscpre_insert` AFTER INSERT ON `w_musc_pre` FOR EACH ROW BEGIN
    
     update t_music set confirm_time=new.confirm_time,song_pre_id=new.song_pre_id where music_id=new.music_id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `w_music`
--

DROP TABLE IF EXISTS `w_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `w_music` (
  `block_num` bigint NOT NULL,
  `music_id` int unsigned NOT NULL,
  `series_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memetoken_address` char(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_id` int DEFAULT NULL,
  `start_time` int DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  PRIMARY KEY (`block_num`,`music_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w_music`
--

LOCK TABLES `w_music` WRITE;
/*!40000 ALTER TABLE `w_music` DISABLE KEYS */;
INSERT INTO `w_music` VALUES (73097766,7,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0x4DeeD9386528f53A6Ff0d058c3cd878CfA21E123',1,1763300730,1),(73120824,1,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0xE95692AC8D729a3b633d281EB587832D35EB5123',2,1763311111,2),(73121450,2,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0xfA033c72165ec20a9145E8df7d5c2E17D5cCe123',3,1763311393,3),(73122003,3,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0xfb15516afa4a7371bC89B7D69D753DF9D7Dc0123',1,1763311641,4),(73127972,4,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x470A05Fc8889d0928425bbE9E37cE8DADd417123',2,1763314330,5),(73204407,5,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x117c5FF1b3c7b8dd364F16e308AF97e095CBa123',3,1763348888,6),(73210888,6,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xd8a845093b3Eb19db79C81161b2F7A73c7C85123',1,1763351827,7),(73215193,11,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xb9ffaEb6cf3939f61ee283E0D0171182fc37B123',2,1763353764,8),(73216672,12,'0x056668C52C95d33eaf2c842d4025e9fEA6E7488A','0xD9F3d8A981A3f7B5df310bE4db418D44A50eD123',1,1763354429,9),(73261385,13,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x30e3C5e86E887F6c891E396489045d3Bc1934123',4,1763374730,10),(73262475,8,'0x2DaCd0afBF220567766a5379F70FBb91A99E7f06','0x5493634cae827AD0449BcAc501775a60B7B3d123',4,1763375221,11),(73262751,14,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0xEa2300be362939DdE86Db36790bEd8962250d123',5,1763375345,12),(73609305,16,'0x781FC90E3B1917681D145D475682a269A57cf470','0xB9D0f13CC120f2E6Be9f0F1c53226C9584205123',1,1763531513,13),(73650842,24,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0xdD0600DCA085DC5CE157b3f0947A918b6A216123',6,1763550589,14),(73665074,25,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xDA5AC8183A2bc1988729F5362e30DeE6bbA1E123',3,1763557365,15),(73666070,26,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0x33a9cbfB69249eDE7A27836377Baa3103319C123',4,1763557815,16),(73667611,27,'0x9a55b5fc83b28e4169A7eEfd49c9807Fa058DfA9','0xF07520603797102D6a31f51E2b24f4eBCF466123',5,1763558510,17),(73668817,28,'0xa29E780Da9707Cbdf1dD2095FA06040841f983ef','0x778D22C17D7dedC1CEFd35056fF6D53297967123',7,1763559055,18),(73691137,29,'0x056668C52C95d33eaf2c842d4025e9fEA6E7488A','0x185909Cb8832348E0089073fbD758E7C57D4f123',2,1763569128,19);
/*!40000 ALTER TABLE `w_music` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `music_insert` AFTER INSERT ON `w_music` FOR EACH ROW BEGIN
	update t_music set series_address=new.series_address,memetoken_address=new.memetoken_address,token_id=new.token_id,start_time=new.start_time,song_id=new.song_id where music_id=new.music_id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'melo_db'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `day_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = latin1 */ ;;
/*!50003 SET character_set_results = latin1 */ ;;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `day_event` ON SCHEDULE EVERY 1 DAY STARTS '2025-09-29 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    --   confirm_time 
    DELETE FROM t_music WHERE  song_id=0 AND confirm_time=0 AND DATEDIFF(NOW(), create_time)>1;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'melo_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `aa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aa`()
BEGIN
TRUNCATE TABLE t_artist_redeem;
TRUNCATE TABLE t_claim;
TRUNCATE TABLE t_claim_artist;
TRUNCATE TABLE t_music;
TRUNCATE TABLE t_music_sub;
TRUNCATE TABLE t_user;
TRUNCATE TABLE t_user_related;
TRUNCATE TABLE t_user_redeem;
TRUNCATE TABLE t_whitelist;
TRUNCATE TABLE w_artist;
TRUNCATE TABLE w_finalized;
TRUNCATE TABLE w_music;
TRUNCATE TABLE w_musc_pre;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_and_use_slat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_and_use_slat`()
BEGIN
    DECLARE v_id INT;
    DECLARE v_slat CHAR(66);

    START TRANSACTION;

    SELECT id, slat INTO v_id, v_slat
    FROM t_slat
    WHERE used = 0
    LIMIT 1
    FOR UPDATE;

    UPDATE t_slat SET used = 1 WHERE id = v_id;

    COMMIT;

    SELECT v_id AS id, v_slat AS slat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_page` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_page`(_daima VARCHAR(6000),_ps INT,_i INT,_s VARCHAR(6000),_a VARCHAR(4),_w NVARCHAR(6000))
BEGIN
declare _t varchar(20);
	SELECT t INTO _t FROM aux_bt WHERE d=_daima;
	
	IF _w='' THEN 
	SELECT w INTO _w FROM aux_bt WHERE d=_daima;
	END IF;
	
	SET _w=IF(_w='','',CONCAT(' where ',_w));
	
	SET @cqw=CONCAT('SELECT * FROM ',_t,_w,' order by ',_s,' ',_a,' LIMIT ',_ps,' OFFSET ',(_i-1)*_ps);
	PREPARE stmt1 FROM @cqw;
	EXECUTE stmt1 ;
		
	 SET @cqw=CONCAT('SELECT count(*) as mcount FROM ',_t,_w);
	 PREPARE stmt1 FROM @cqw;
         EXECUTE stmt1 ;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `in_play` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `in_play`(did char(42),musicId int)
BEGIN
	if exists(select 1 from t_music where music_id=musicId) then 
		INSERT INTO t_play_user(user_address,user_name,user_avatar,music_id,song_id,music_name,music_url,music_seconds,token_id,token_name,token_symbol,token_logo,start_time,create_time,artist_name,artist_avatar) 
		SELECT did,b.user_name,b.user_avatar,a.music_id,a.song_id,a.music_name,a.music_url,a.music_seconds,a.token_id,a.token_name,a.token_symbol,a.token_logo,a.start_time,NOW(),b.artist_name,b.artist_avatar FROM t_music a JOIN t_user b ON a.user_address=b.user_address WHERE a.music_id=musicId
		ON DUPLICATE KEY UPDATE create_time = NOW();
		INSERT INTO t_play_all(user_address,user_name,user_avatar,music_id,song_id,music_name,music_url,music_seconds,token_id,token_name,token_symbol,token_logo,start_time,create_time,artist_name,artist_avatar) 
		SELECT a.user_address,b.user_name,b.user_avatar,a.music_id,a.song_id,a.music_name,a.music_url,a.music_seconds,a.token_id,a.token_name,a.token_symbol,a.token_logo,a.start_time,now(),b.artist_name,b.artist_avatar FROM t_music a JOIN t_user b ON a.user_address=b.user_address WHERE a.music_id=musicId
		 ON DUPLICATE KEY UPDATE create_time = NOW();
	end if;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_music`
--

/*!50001 DROP VIEW IF EXISTS `v_music`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_music` AS select `t_music`.`music_id` AS `music_id`,`t_music`.`user_address` AS `user_address`,`t_music`.`music_url` AS `music_url`,`t_music`.`music_name` AS `music_name`,`t_music`.`total_raise` AS `total_raise`,`t_music`.`music_seconds` AS `music_seconds`,`t_music`.`token_id` AS `token_id`,`t_music`.`token_logo` AS `token_logo`,`t_music`.`token_name` AS `token_name`,`t_music`.`token_symbol` AS `token_symbol`,`t_music`.`token_desc` AS `token_desc`,`t_music`.`website` AS `website`,`t_music`.`twitter` AS `twitter`,`t_music`.`confirm_time` AS `confirm_time`,`t_music`.`song_id` AS `song_id`,`t_user`.`user_avatar` AS `user_avatar`,`t_user`.`user_name` AS `user_name`,`t_user`.`artist_avatar` AS `artist_avatar`,`t_user`.`artist_desc` AS `artist_desc`,`t_user`.`artist_name` AS `artist_name`,ifnull(`a`.`sub_amount`,0) AS `total_sub_amount`,`t_music`.`telegram` AS `telegram`,`t_music`.`series_address` AS `series_address`,`t_music`.`memetoken_address` AS `memetoken_address`,`t_music`.`is_end` AS `is_end`,`t_user`.`artist_link` AS `artist_link`,`t_music`.`start_time` AS `start_time`,unix_timestamp(`t_music`.`create_time`) AS `create_time`,unix_timestamp() AS `now_time` from ((`t_music` join `t_user` on((`t_music`.`user_address` = `t_user`.`user_address`))) left join (select `t_music_sub`.`song_id` AS `song_id`,sum(`t_music_sub`.`sub_amount`) AS `sub_amount` from `t_music_sub` group by `t_music_sub`.`song_id`) `a` on((`t_music`.`song_id` = `a`.`song_id`))) where ((`t_music`.`start_time` > 0) or (`t_music`.`confirm_time` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_music_sub`
--

/*!50001 DROP VIEW IF EXISTS `v_music_sub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_music_sub` AS select `a`.`sub_id` AS `sub_id`,`a`.`song_id` AS `song_id`,`a`.`token_id` AS `token_id`,`a`.`user_address` AS `user_address`,`a`.`sub_amount` AS `sub_amount`,unix_timestamp(`a`.`create_time`) AS `create_time`,`b`.`music_id` AS `music_id`,`b`.`music_name` AS `music_name`,`b`.`music_url` AS `music_url`,`b`.`music_seconds` AS `music_seconds`,`b`.`token_name` AS `token_name`,`b`.`token_symbol` AS `token_symbol`,`b`.`token_logo` AS `token_logo`,`b`.`start_time` AS `start_time`,`b`.`user_name` AS `user_name`,`b`.`user_avatar` AS `user_avatar`,unix_timestamp() AS `now_time` from (`t_music_sub` `a` join (select `b1`.`song_id` AS `song_id`,`b1`.`music_id` AS `music_id`,`b1`.`music_name` AS `music_name`,`b1`.`music_url` AS `music_url`,`b1`.`music_seconds` AS `music_seconds`,`b1`.`token_name` AS `token_name`,`b1`.`token_symbol` AS `token_symbol`,`b1`.`token_logo` AS `token_logo`,`b1`.`start_time` AS `start_time`,`b2`.`user_name` AS `user_name`,`b2`.`user_avatar` AS `user_avatar` from (`t_music` `b1` join `t_user` `b2` on((`b1`.`user_address` = `b2`.`user_address`)))) `b` on((`a`.`song_id` = `b`.`song_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_play_all`
--

/*!50001 DROP VIEW IF EXISTS `v_play_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_play_all` AS select `t_play_all`.`user_address` AS `user_address`,`t_play_all`.`user_name` AS `user_name`,`t_play_all`.`user_avatar` AS `user_avatar`,`t_play_all`.`music_id` AS `music_id`,`t_play_all`.`song_id` AS `song_id`,`t_play_all`.`music_name` AS `music_name`,`t_play_all`.`music_url` AS `music_url`,`t_play_all`.`music_seconds` AS `music_seconds`,`t_play_all`.`token_id` AS `token_id`,`t_play_all`.`token_name` AS `token_name`,`t_play_all`.`artist_name` AS `artist_name`,`t_play_all`.`artist_avatar` AS `artist_avatar`,`t_play_all`.`token_symbol` AS `token_symbol`,`t_play_all`.`token_logo` AS `token_logo`,`t_play_all`.`start_time` AS `start_time`,unix_timestamp(`t_play_all`.`create_time`) AS `create_time`,unix_timestamp() AS `now_time` from `t_play_all` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_play_user`
--

/*!50001 DROP VIEW IF EXISTS `v_play_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_play_user` AS select `t_play_user`.`user_address` AS `user_address`,`t_play_user`.`user_name` AS `user_name`,`t_play_user`.`user_avatar` AS `user_avatar`,`t_play_user`.`music_id` AS `music_id`,`t_play_user`.`song_id` AS `song_id`,`t_play_user`.`music_name` AS `music_name`,`t_play_user`.`music_url` AS `music_url`,`t_play_user`.`music_seconds` AS `music_seconds`,`t_play_user`.`token_id` AS `token_id`,`t_play_user`.`artist_name` AS `artist_name`,`t_play_user`.`artist_avatar` AS `artist_avatar`,`t_play_user`.`token_name` AS `token_name`,`t_play_user`.`token_symbol` AS `token_symbol`,`t_play_user`.`token_logo` AS `token_logo`,`t_play_user`.`start_time` AS `start_time`,unix_timestamp(`t_play_user`.`create_time`) AS `create_time`,unix_timestamp() AS `now_time` from `t_play_user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20  3:32:08
