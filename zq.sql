/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : zq

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2025-05-06 10:08:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `Username` char(25) NOT NULL DEFAULT '',
  `Password` char(16) DEFAULT '',
  `IP` char(15) DEFAULT '',
  `LastCheck` bigint(255) unsigned DEFAULT '0',
  `State` tinyint(5) unsigned DEFAULT '0',
  `EntityID` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `Email` char(100) DEFAULT '',
  `Question` char(100) DEFAULT NULL,
  `answer` char(30) DEFAULT NULL,
  `Country` char(110) DEFAULT '',
  `City` char(100) DEFAULT '',
  `secretquestion` char(45) DEFAULT '',
  `realname` char(25) DEFAULT '',
  `machine` char(50) DEFAULT '',
  `lastvote` char(50) DEFAULT '',
  `mobilenumber` bigint(18) DEFAULT '0',
  `securitycode` varchar(100) DEFAULT '',
  `date` varchar(0) DEFAULT '',
  `joined` varchar(220) DEFAULT NULL,
  `Online` bigint(20) DEFAULT NULL,
  `RecoveryToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Username`) USING BTREE,
  UNIQUE KEY `a` (`EntityID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000717 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('1', '123', '', '0', '0', '1000703', 'higorzen77@gmail.com', null, null, '', '', '', '', '', '', '0', '', '', null, null, '3e90250a-7b62-4bb9-9f8b-a1e8e647d4f1');
INSERT INTO `accounts` VALUES ('2', '123', '', '0', '0', '1000716', '', null, null, '', '', '', '', '', '', '0', '', '', null, null, null);

-- ----------------------------
-- Table structure for `alert`
-- ----------------------------
DROP TABLE IF EXISTS `alert`;
CREATE TABLE `alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  `user` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `watch` bigint(20) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `tik` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of alert
-- ----------------------------

-- ----------------------------
-- Table structure for `banned`
-- ----------------------------
DROP TABLE IF EXISTS `banned`;
CREATE TABLE `banned` (
  `UID` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL DEFAULT '',
  `Hours` bigint(18) unsigned NOT NULL DEFAULT '0',
  `StartBan` bigint(255) unsigned NOT NULL DEFAULT '0',
  `Reason` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of banned
-- ----------------------------

-- ----------------------------
-- Table structure for `bannedmac`
-- ----------------------------
DROP TABLE IF EXISTS `bannedmac`;
CREATE TABLE `bannedmac` (
  `username` varchar(16) NOT NULL,
  `MacID` varchar(16) NOT NULL DEFAULT '0000000000000000',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bannedmac
-- ----------------------------
INSERT INTO `bannedmac` VALUES ('aimbot', 'E0D55EC84476');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `post` bigint(20) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `configuration`
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `EntityID` int(11) NOT NULL,
  `LastChar` varchar(255) DEFAULT NULL,
  `Online` varchar(255) DEFAULT NULL,
  `GWWinner` varchar(255) DEFAULT NULL,
  `serveronline` int(11) DEFAULT NULL,
  PRIMARY KEY (`EntityID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of configuration
-- ----------------------------

-- ----------------------------
-- Table structure for `cpanel`
-- ----------------------------
DROP TABLE IF EXISTS `cpanel`;
CREATE TABLE `cpanel` (
  `Website_Name` varchar(18) NOT NULL,
  `Website_url` text,
  `Domain` text,
  `date` varchar(255) DEFAULT NULL,
  `Time` varchar(255) DEFAULT NULL,
  `Email` text,
  `password` text,
  `Host` text,
  `Port` text,
  `SMTPSecure` text,
  `mate` longtext,
  `sitemap` varchar(255) DEFAULT NULL,
  `GM` bigint(20) DEFAULT NULL,
  `codegm` bigint(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Transfer` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `max_execution` bigint(20) DEFAULT NULL,
  `King` bigint(20) DEFAULT NULL,
  `prince` bigint(20) DEFAULT NULL,
  `Doke` bigint(20) DEFAULT NULL,
  `limits` bigint(20) DEFAULT NULL,
  `boy` bigint(20) DEFAULT NULL,
  `girl` bigint(20) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `paypal_true` varchar(255) DEFAULT NULL,
  `email_paypal` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `card_active` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cpanel
-- ----------------------------
INSERT INTO `cpanel` VALUES ('CoGolden', 'https://lastco.net', 'https://lastco.net', '', '', 'admin@lastco.net', 'Heeter0621!!', 'smtp.gmail.com', '465', 'ssl', 'conquer v 5517', 'true', '4', '1231', '1', 'True', 'TITANIUM', '60', '3', '15', '30', '10', '7', '2', 'Einglish', 'true', '', '0', 'True');

-- ----------------------------
-- Table structure for `downloads`
-- ----------------------------
DROP TABLE IF EXISTS `downloads`;
CREATE TABLE `downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` int(11) NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of downloads
-- ----------------------------
INSERT INTO `downloads` VALUES ('1', 'Mega', '', '540', '1', 'https://mega.nz/file/zI1UFJZR#LMd15X7wNfP4Yv9Oc54nwSG-Qylsp-QVmrtUrV52p3Y');
INSERT INTO `downloads` VALUES ('2', 'MediaFire', '', '540', '1', 'https://www.mediafire.com/file/mbeb4j4xao0ct6e/CoGolden.rar/file');
INSERT INTO `downloads` VALUES ('3', 'GoogleDrive', '', '540', '1', 'https://drive.google.com/file/d/1ejVZUWtgYu_PMJqUaNXBPdgRa1Tw-QIw/view?usp=drive_link');

-- ----------------------------
-- Table structure for `email`
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `statues` bigint(20) DEFAULT '0',
  `Date` varchar(255) DEFAULT NULL,
  `kay` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of email
-- ----------------------------

-- ----------------------------
-- Table structure for `eventflags`
-- ----------------------------
DROP TABLE IF EXISTS `eventflags`;
CREATE TABLE `eventflags` (
  `SS_FBTop` int(15) NOT NULL,
  `SpeedWarTop` int(15) NOT NULL,
  `SpecialTop` int(15) NOT NULL,
  `KingTop` int(15) NOT NULL,
  `PrinceTop` int(15) NOT NULL,
  `DukeTop` int(15) NOT NULL,
  `EarlTop` int(15) NOT NULL,
  `Owner` varchar(15) NOT NULL,
  PRIMARY KEY (`Owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of eventflags
-- ----------------------------

-- ----------------------------
-- Table structure for `eventprize`
-- ----------------------------
DROP TABLE IF EXISTS `eventprize`;
CREATE TABLE `eventprize` (
  `SS_FBCps` bigint(255) NOT NULL,
  `SpeedWarCps` bigint(255) NOT NULL,
  `Top_SpecialCps` bigint(255) NOT NULL,
  `KingCps` bigint(255) NOT NULL,
  `PrinceCps` bigint(255) NOT NULL,
  `DukeCps` bigint(255) NOT NULL,
  `EarlCps` bigint(255) NOT NULL,
  `Owner` varchar(15) NOT NULL,
  PRIMARY KEY (`Owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of eventprize
-- ----------------------------

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `days` bigint(255) DEFAULT NULL,
  `Hours` varchar(20) DEFAULT NULL,
  `type_event` bigint(20) DEFAULT '0',
  `Prize` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for `guildwar`
-- ----------------------------
DROP TABLE IF EXISTS `guildwar`;
CREATE TABLE `guildwar` (
  `HourOff` tinyint(4) DEFAULT NULL,
  `FlameActive` tinyint(4) DEFAULT NULL,
  `Owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of guildwar
-- ----------------------------

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `item_order` varchar(255) DEFAULT NULL,
  `staute` int(11) DEFAULT '0',
  `id_store` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for `likes`
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `postid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of likes
-- ----------------------------

-- ----------------------------
-- Table structure for `log_payments`
-- ----------------------------
DROP TABLE IF EXISTS `log_payments`;
CREATE TABLE `log_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `username` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of log_payments
-- ----------------------------
INSERT INTO `log_payments` VALUES ('1', '', 'Guard', null, null, '1 30DayVIP.', 'derektro');
INSERT INTO `log_payments` VALUES ('2', '', 'ReckedUm', null, null, '1 30DayVIP.', 'WreckedUm1');
INSERT INTO `log_payments` VALUES ('3', '', 'Elaina', null, null, '1 30DayVIP.', 'taddperry1');
INSERT INTO `log_payments` VALUES ('4', '', 'Emma', null, null, '1 30DayVIP.', 'taddperry2');
INSERT INTO `log_payments` VALUES ('5', '', 'NewGuy', null, null, '1 30DayVIP.', 'WreckedUm');
INSERT INTO `log_payments` VALUES ('6', '', 'Puff', null, null, '1 30DayVIP.', 'staypuffcbw');
INSERT INTO `log_payments` VALUES ('7', '', 'MeatMaMa', null, null, '1 30DayVIP.', 'joshyjk3');
INSERT INTO `log_payments` VALUES ('8', '', 'Ruby.Da.Cherry', null, null, '1 30DayVIP.', 'slooshie2');
INSERT INTO `log_payments` VALUES ('9', '', 'Heracles', null, null, '1 30DayVIP.', 'erikdaniel2');
INSERT INTO `log_payments` VALUES ('10', '', 'Guard', null, null, '1 30DayVIP.', 'derektro');
INSERT INTO `log_payments` VALUES ('11', '', 'Cupidette', null, null, '1 30DayVIP.', 'erikdaniel6');
INSERT INTO `log_payments` VALUES ('12', '', 'Rhys', null, null, '1 30DayVIP.', 'TyDaddy');
INSERT INTO `log_payments` VALUES ('13', '', 'Rhys', null, null, '1 30DayVIP.', 'TyDaddy');
INSERT INTO `log_payments` VALUES ('14', '', 'Rhys', null, null, '1 30DayVIP.', 'TyDaddy');
INSERT INTO `log_payments` VALUES ('15', '', 'Guard', null, null, '1 30DayVIP.', 'derektro');
INSERT INTO `log_payments` VALUES ('16', '', 'SoyUnaChopa', null, null, '1 30DayVIP.', 'robaloxhunt');
INSERT INTO `log_payments` VALUES ('17', '', 'Guard', null, null, '1 30DayVIP.', 'derektro');
INSERT INTO `log_payments` VALUES ('18', '', 'LuBu', null, null, '1 30DayVIP.', 'Rioshima');
INSERT INTO `log_payments` VALUES ('19', '', 'Mi7even', null, null, '1 30DayVIP.', 'mamoelafdal');
INSERT INTO `log_payments` VALUES ('20', '', 'Noob', null, null, '1 30DayVIP.', '0000');
INSERT INTO `log_payments` VALUES ('21', '', '1000', null, null, '1 30DayVIP.', '0101');
INSERT INTO `log_payments` VALUES ('22', '', 'TheHauss', null, null, '1 30DayVIP.', 'joshyjk2');
INSERT INTO `log_payments` VALUES ('23', '', 'Guard', null, null, '1 30DayVIP.', 'derektro');
INSERT INTO `log_payments` VALUES ('24', '', 'Guard', null, null, '1 30DayVIP.', 'derektro');
INSERT INTO `log_payments` VALUES ('25', '', 'xLagan32', null, null, '1 30DayVIP.', 'xLagan');
INSERT INTO `log_payments` VALUES ('26', '', 'Bwner', null, null, '1 30DayVIP.', 'cfarch');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `marketitems`
-- ----------------------------
DROP TABLE IF EXISTS `marketitems`;
CREATE TABLE `marketitems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerName` varchar(50) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Price` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Avatar` smallint(6) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marketitems
-- ----------------------------
INSERT INTO `marketitems` VALUES ('66', '21xz3[PM]', '(+1)Stone', '123', '2025-02-22 19:53:53', '0');
INSERT INTO `marketitems` VALUES ('67', '21xz3[PM]', '(+1)Stone', '22', '2025-02-22 19:53:55', '0');
INSERT INTO `marketitems` VALUES ('68', '21xz3[PM]', 'ProfToken', '221313', '2025-02-22 19:53:57', '0');
INSERT INTO `marketitems` VALUES ('69', '21xz3[PM]', '99Lilies', '123123', '2025-02-26 13:12:55', '0');
INSERT INTO `marketitems` VALUES ('70', '21xz3[PM]', 'DragonGem', '21312', '2025-02-28 02:26:52', '0');
INSERT INTO `marketitems` VALUES ('71', '21xz3[PM]', 'LunarBacksword', '312321', '2025-02-28 02:26:53', '0');
INSERT INTO `marketitems` VALUES ('72', '21xz3[PM]', 'ShortClub', '1231', '2025-02-28 02:26:55', '0');
INSERT INTO `marketitems` VALUES ('73', '21xz3[PM]', 'ShortClub', '31231', '2025-02-28 02:26:57', '0');
INSERT INTO `marketitems` VALUES ('74', '21xz3[PM]', 'LunarBacksword', '12312', '2025-02-28 02:30:27', '0');
INSERT INTO `marketitems` VALUES ('75', '21xz3[PM]', 'ShortClub', '12313', '2025-02-28 02:30:29', '0');
INSERT INTO `marketitems` VALUES ('76', '21xz3[PM]', 'ShortClub', '12312', '2025-02-28 02:30:31', '0');
INSERT INTO `marketitems` VALUES ('77', '21xz3[PM]', 'Rate2IronOre', '123213', '2025-02-28 02:30:32', '0');
INSERT INTO `marketitems` VALUES ('78', '21xz3[PM]', 'DragonGem', '22222222', '2025-02-28 02:30:35', '0');
INSERT INTO `marketitems` VALUES ('79', '21xz3[PM]', 'ShortClub', '111', '2025-02-28 02:30:41', '0');
INSERT INTO `marketitems` VALUES ('80', '21xz3[PM]', 'PeachBacksword', '1111111', '2025-02-28 02:30:46', '0');
INSERT INTO `marketitems` VALUES ('81', '21xz3[PM]', 'DragonBall', '1231', '2025-03-29 19:25:34', '0');
INSERT INTO `marketitems` VALUES ('82', '21xz3[PM]', 'DragonBall', '1231', '2025-03-29 19:25:36', '0');
INSERT INTO `marketitems` VALUES ('83', '21xz3[PM]', 'DragonBall', '3123123', '2025-03-29 19:25:38', '0');
INSERT INTO `marketitems` VALUES ('84', '21xz3[PM]', 'DragonBall', '123', '2025-03-29 19:25:40', '0');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for `mined_items`
-- ----------------------------
DROP TABLE IF EXISTS `mined_items`;
CREATE TABLE `mined_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `mined_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mined_items
-- ----------------------------
INSERT INTO `mined_items` VALUES ('31', 'CNTT[PM]', 'FuryGem', '2025-02-12 14:54:01');
INSERT INTO `mined_items` VALUES ('32', 'CNTT[PM]', 'FuryGem', '2025-02-12 14:54:47');
INSERT INTO `mined_items` VALUES ('33', 'CNTT[PM]', 'PhoenixGem', '2025-02-12 14:54:59');
INSERT INTO `mined_items` VALUES ('34', 'CNTT[PM]', 'DragonGem', '2025-02-12 14:56:43');
INSERT INTO `mined_items` VALUES ('35', 'CNTT[PM]', 'PhoenixGem', '2025-02-12 14:58:12');
INSERT INTO `mined_items` VALUES ('36', 'CNTT[PM]', 'PhoenixGem', '2025-02-12 14:59:53');
INSERT INTO `mined_items` VALUES ('37', 'CNTT[PM]', 'TortoiseGem', '2025-02-12 14:59:56');
INSERT INTO `mined_items` VALUES ('38', 'CNTT[PM]', 'PhoenixGem', '2025-02-12 15:04:06');
INSERT INTO `mined_items` VALUES ('39', 'CNTT[PM]', 'FuryGem', '2025-02-12 15:04:49');
INSERT INTO `mined_items` VALUES ('40', 'CNTT[PM]', 'PhoenixGem', '2025-02-12 15:06:05');
INSERT INTO `mined_items` VALUES ('41', '21xz3[PM]', 'DragonGem', '2025-02-27 03:53:27');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `byGM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `onlineplayers`
-- ----------------------------
DROP TABLE IF EXISTS `onlineplayers`;
CREATE TABLE `onlineplayers` (
  `Online` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Online`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onlineplayers
-- ----------------------------
INSERT INTO `onlineplayers` VALUES ('0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `statue` varchar(255) DEFAULT '0',
  `IP` varchar(255) DEFAULT NULL,
  `methed` varchar(255) DEFAULT NULL,
  `price` float(10,0) DEFAULT NULL,
  `mount` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `patches`
-- ----------------------------
DROP TABLE IF EXISTS `patches`;
CREATE TABLE `patches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `Issuance` varchar(255) DEFAULT NULL,
  `link` text,
  `size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of patches
-- ----------------------------

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `founds` int(11) DEFAULT NULL,
  `claimed` int(11) NOT NULL DEFAULT '0',
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_gross` double(8,2) NOT NULL,
  `mc_gross` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('pay_44egv5bv7jdic0fz', '1', '', '877', '0', '', '0.00', '', '', 'Aproved', '0', '', '2025-02-27 19:32:50');

-- ----------------------------
-- Table structure for `phone`
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `methed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of phone
-- ----------------------------

-- ----------------------------
-- Table structure for `playerdata`
-- ----------------------------
DROP TABLE IF EXISTS `playerdata`;
CREATE TABLE `playerdata` (
  `UID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Class` tinyint(4) DEFAULT NULL,
  `Avatar` smallint(6) DEFAULT NULL,
  `Map` int(11) DEFAULT NULL,
  `X` smallint(6) DEFAULT NULL,
  `Y` smallint(6) DEFAULT NULL,
  `CountVote` int(11) DEFAULT NULL,
  `Agility` smallint(6) DEFAULT NULL,
  `Strength` smallint(6) DEFAULT NULL,
  `Spirit` smallint(6) DEFAULT NULL,
  `Vitality` smallint(6) DEFAULT NULL,
  `Atributes` smallint(6) DEFAULT NULL,
  `ConquerPoints` int(11) DEFAULT NULL,
  `Money` int(11) DEFAULT NULL,
  `ExpireVip` datetime DEFAULT NULL,
  `VotePoints` int(11) DEFAULT NULL,
  `HeavenBlessing` int(11) DEFAULT NULL,
  `DbKilled` int(11) DEFAULT NULL,
  `Drop_Meteors` int(11) DEFAULT NULL,
  `Drop_Stone` int(11) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playerdata
-- ----------------------------

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `body` text,
  `date` datetime DEFAULT NULL,
  `img` text,
  `view` bigint(20) DEFAULT '0',
  `likes` bigint(20) DEFAULT '0',
  `background` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for `reply_tickets`
-- ----------------------------
DROP TABLE IF EXISTS `reply_tickets`;
CREATE TABLE `reply_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_tik` bigint(20) DEFAULT NULL,
  `body` text,
  `Date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reply_tickets
-- ----------------------------

-- ----------------------------
-- Table structure for `resgates`
-- ----------------------------
DROP TABLE IF EXISTS `resgates`;
CREATE TABLE `resgates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL,
  `IP` varchar(45) NOT NULL,
  `ActionType` varchar(20) NOT NULL,
  `ClaimDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IP` (`IP`,`ActionType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resgates
-- ----------------------------

-- ----------------------------
-- Table structure for `send_mail`
-- ----------------------------
DROP TABLE IF EXISTS `send_mail`;
CREATE TABLE `send_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of send_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `servercontrol`
-- ----------------------------
DROP TABLE IF EXISTS `servercontrol`;
CREATE TABLE `servercontrol` (
  `NormalDb_Drop` bigint(8) NOT NULL,
  `VipDb_Drop` bigint(8) NOT NULL,
  `Vip_Drop_Meteors` bigint(8) NOT NULL,
  `Normal_Drop_Meteors` bigint(8) NOT NULL,
  `Vip_Drop_Stone` bigint(8) NOT NULL,
  `Normal_Drop_Stone` bigint(8) NOT NULL,
  `Owner` varchar(15) NOT NULL,
  `Max_DragonBall_Normal` tinyint(5) NOT NULL,
  `Max_Meteors_Normal` tinyint(5) NOT NULL,
  `Max_Stone_Normal` tinyint(5) NOT NULL,
  `Max_DragonBall_Vip` tinyint(5) NOT NULL,
  `Max_Meteors_Vip` tinyint(5) NOT NULL,
  `Max_Stone_Vip` tinyint(5) NOT NULL,
  PRIMARY KEY (`Owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of servercontrol
-- ----------------------------
INSERT INTO `servercontrol` VALUES ('12000', '10000', '1000', '1200', '15000', '15000', '', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `servers`
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers` (
  `Name` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `IP` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `Port` int(16) unsigned DEFAULT NULL,
  `TransferKey` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `TransferSalt` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of servers
-- ----------------------------
INSERT INTO `servers` VALUES ('CoPrivate', '192.168.200.107', '5816', 'EypKhLvYJ3zdLCTyz9Ak8RAgM78tY5F32b7CUXDuLDJDFBH8H67BWy9QThmaN5VS', 'MyqVgBf3ytALHWLXbJxSUX4uFEu3Xmz2UAY9sTTm8AScB7Kk2uwqDSnuNJske4BJ');

-- ----------------------------
-- Table structure for `sitemap`
-- ----------------------------
DROP TABLE IF EXISTS `sitemap`;
CREATE TABLE `sitemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sitemap
-- ----------------------------

-- ----------------------------
-- Table structure for `social`
-- ----------------------------
DROP TABLE IF EXISTS `social`;
CREATE TABLE `social` (
  `facebook` varchar(255) NOT NULL,
  `Youtube` varchar(255) DEFAULT NULL,
  `chat` text,
  `DISCORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of social
-- ----------------------------

-- ----------------------------
-- Table structure for `socket_attempts`
-- ----------------------------
DROP TABLE IF EXISTS `socket_attempts`;
CREATE TABLE `socket_attempts` (
  `player_id` int(11) NOT NULL,
  `item_uid` int(11) NOT NULL,
  `meteor_attempts` int(11) DEFAULT '0',
  PRIMARY KEY (`player_id`,`item_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socket_attempts
-- ----------------------------

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `price` float(10,0) DEFAULT NULL,
  `mount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for `tickets`
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `Department` varchar(255) DEFAULT NULL,
  `case_ti` int(11) DEFAULT '0',
  `reply` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tickets
-- ----------------------------

-- ----------------------------
-- Table structure for `vip_claims`
-- ----------------------------
DROP TABLE IF EXISTS `vip_claims`;
CREATE TABLE `vip_claims` (
  `player_id` int(10) unsigned NOT NULL,
  `ip` varchar(45) NOT NULL,
  `claim_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip_claims
-- ----------------------------
INSERT INTO `vip_claims` VALUES ('1000703', '192.168.200.107', '2025-03-14 07:24:01');

-- ----------------------------
-- Table structure for `vodacard`
-- ----------------------------
DROP TABLE IF EXISTS `vodacard`;
CREATE TABLE `vodacard` (
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `fbID` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cardNum` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `hmCash` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phNum` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of vodacard
-- ----------------------------

-- ----------------------------
-- Table structure for `votesystem`
-- ----------------------------
DROP TABLE IF EXISTS `votesystem`;
CREATE TABLE `votesystem` (
  `Id` int(11) NOT NULL,
  `Ip` varchar(45) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `VotePoints` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of votesystem
-- ----------------------------
INSERT INTO `votesystem` VALUES ('-1034112559', '192.168.200.107', '2025-03-14 07:16:04', '3');

-- ----------------------------
-- Table structure for `vtm_comments`
-- ----------------------------
DROP TABLE IF EXISTS `vtm_comments`;
CREATE TABLE `vtm_comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` text CHARACTER SET utf8,
  `Date` time DEFAULT NULL,
  `link_news` int(11) DEFAULT NULL,
  `link_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `UserNews` (`link_news`) USING BTREE,
  KEY `UserComment` (`link_user`) USING BTREE,
  CONSTRAINT `vtm_comments_ibfk_1` FOREIGN KEY (`link_user`) REFERENCES `accounts` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vtm_comments_ibfk_2` FOREIGN KEY (`link_news`) REFERENCES `vtm_newshome` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vtm_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `vtm_newshome`
-- ----------------------------
DROP TABLE IF EXISTS `vtm_newshome`;
CREATE TABLE `vtm_newshome` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(255) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_views` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vtm_newshome
-- ----------------------------
INSERT INTO `vtm_newshome` VALUES ('1', 'Patch 1016', 'CoGolden - (September 4, 2025)\n\n\n', 'no-image.png', '2022-09-04 02:16:29', '1');
