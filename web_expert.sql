-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 04, 2024 at 03:20 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_expert`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shpqyewynsgolzuusgawkwnnwjbusvszxpdh` (`primaryOwnerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dletedyvqogysihznjptosoehyhrmknndkkj` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_rumvzmlbbqoebxkqghecxfgvmowkspltasfp` (`dateRead`),
  KEY `fk_lqhjqtbkubfghhqhqskzyqomuiqjkzrxlkkd` (`pluginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE IF NOT EXISTS `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hiqxnwizqdkissyjhhvsfcbndxyddacsbgrf` (`sessionId`,`volumeId`),
  KEY `idx_agjbzrmjufkvqiqvimgufhomibaryojrxcuz` (`volumeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
CREATE TABLE IF NOT EXISTS `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `size` bigint UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_knxgsqlehypzclnewjgnatewbgokpjnohmbo` (`filename`,`folderId`),
  KEY `idx_vomwunbypjucgiqtsblpkqrcgdiwqewskukx` (`folderId`),
  KEY `idx_utvwqzrbshrueksrcylpecinxqpasxkbkuix` (`volumeId`),
  KEY `fk_aihskvyfsmoxwdauvjwcudfivgvpdaykdnyx` (`uploaderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`) VALUES
(18, 1, 1, 1, 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', 'image', NULL, 683, 1024, 76302, NULL, 0, 0, '2024-04-29 08:32:18', '2024-04-29 08:32:18', '2024-04-29 08:32:18'),
(19, 1, 1, 1, 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', 'image', NULL, 683, 1024, 76302, NULL, 0, 0, '2024-04-29 08:34:28', '2024-04-29 08:34:28', '2024-04-29 08:34:28'),
(20, 1, 1, 1, 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', 'image', NULL, 683, 1024, 76302, NULL, 0, 0, '2024-04-29 08:36:47', '2024-04-29 08:36:47', '2024-04-29 08:36:47'),
(21, 1, 1, 1, '7db.png', 'image', NULL, 420, 294, 53616, NULL, 0, 0, '2024-04-29 08:41:17', '2024-04-29 08:41:17', '2024-04-29 08:41:17'),
(22, 1, 1, 1, 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', 'image', NULL, 683, 1024, 76302, NULL, 0, 0, '2024-04-29 08:41:58', '2024-04-29 08:41:58', '2024-04-29 08:41:58'),
(33, 2, 4, 1, 'andre-tan-humXycOzC00-unsplash-683x1024.jpg', 'image', NULL, 683, 1024, 76302, '0.6913;0.6686', 1, 1, '2024-04-29 13:10:42', '2024-04-29 13:10:42', '2024-04-29 13:11:46'),
(45, 3, 5, 1, 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', 'image', NULL, 683, 1024, 76302, '0.7229;0.6888', NULL, NULL, '2024-04-29 14:54:03', '2024-04-29 14:54:03', '2024-04-29 14:55:09'),
(52, 3, 5, 1, 'bg.jpg', 'image', NULL, 2808, 1872, 203839, NULL, NULL, NULL, '2024-05-06 07:23:05', '2024-05-06 07:23:05', '2024-05-06 07:23:05'),
(53, 3, 5, 1, 'gallery_1.jpg', 'image', NULL, 750, 535, 45077, NULL, NULL, NULL, '2024-05-06 07:23:05', '2024-05-06 07:23:05', '2024-05-06 07:23:05'),
(54, 3, 5, 1, 'gallery_2.jpg', 'image', NULL, 750, 534, 42458, NULL, NULL, NULL, '2024-05-06 07:23:06', '2024-05-06 07:23:06', '2024-05-06 07:23:06'),
(55, 3, 5, 1, 'gallery_3.jpg', 'image', NULL, 750, 534, 29133, NULL, NULL, NULL, '2024-05-06 07:23:06', '2024-05-06 07:23:06', '2024-05-06 07:23:06'),
(56, 3, 5, 1, 'gallery_4.jpg', 'image', NULL, 750, 536, 27363, NULL, NULL, NULL, '2024-05-06 07:23:06', '2024-05-06 07:23:06', '2024-05-06 07:23:06'),
(57, 3, 5, 1, 'gallery_5.jpg', 'image', NULL, 750, 535, 44470, NULL, NULL, NULL, '2024-05-06 07:23:07', '2024-05-06 07:23:07', '2024-05-06 07:23:07'),
(58, 3, 5, 1, 'gallery_6.jpg', 'image', NULL, 750, 534, 44593, NULL, NULL, NULL, '2024-05-06 07:23:07', '2024-05-06 07:23:07', '2024-05-06 07:23:07'),
(59, 3, 5, 1, 'nav-img-1.jpg', 'image', NULL, 3994, 3995, 515269, NULL, NULL, NULL, '2024-05-06 07:23:08', '2024-05-06 07:23:09', '2024-05-06 07:23:09'),
(60, 3, 5, 1, 'nav-img-2.jpg', 'image', NULL, 4905, 4906, 454577, NULL, NULL, NULL, '2024-05-06 07:23:10', '2024-05-06 07:23:10', '2024-05-06 07:23:10'),
(61, 3, 5, 1, 'nav-img-3.jpg', 'image', NULL, 3024, 3024, 501070, NULL, NULL, NULL, '2024-05-06 07:23:11', '2024-05-06 07:23:11', '2024-05-06 07:23:11'),
(62, 3, 5, 1, 'team.jpg', 'image', NULL, 3264, 2176, 1001309, NULL, NULL, NULL, '2024-05-06 07:23:12', '2024-05-06 07:23:12', '2024-05-06 07:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
CREATE TABLE IF NOT EXISTS `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_ikyrfskebrfycqqdqtkaaovdfsphrgpfdxuq` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assets_sites`
--

INSERT INTO `assets_sites` (`assetId`, `siteId`, `alt`) VALUES
(18, 1, NULL),
(19, 1, NULL),
(20, 1, NULL),
(21, 1, NULL),
(22, 1, NULL),
(33, 1, NULL),
(45, 1, NULL),
(45, 2, NULL),
(45, 3, NULL),
(52, 1, NULL),
(52, 2, NULL),
(52, 3, NULL),
(53, 1, NULL),
(53, 2, NULL),
(53, 3, NULL),
(54, 1, NULL),
(54, 2, NULL),
(54, 3, NULL),
(55, 1, NULL),
(55, 2, NULL),
(55, 3, NULL),
(56, 1, NULL),
(56, 2, NULL),
(56, 3, NULL),
(57, 1, NULL),
(57, 2, NULL),
(57, 3, NULL),
(58, 1, NULL),
(58, 2, NULL),
(58, 3, NULL),
(59, 1, NULL),
(59, 2, NULL),
(59, 3, NULL),
(60, 1, NULL),
(60, 2, NULL),
(60, 3, NULL),
(61, 1, NULL),
(61, 2, NULL),
(61, 3, NULL),
(62, 1, NULL),
(62, 2, NULL),
(62, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
CREATE TABLE IF NOT EXISTS `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_xjicfsusdwkubffpavberbudwdjkpohxobrq` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gipmqhqjnsvusavcvlvtteymgqaistfwsbrp` (`groupId`),
  KEY `fk_ratdknoierylodtpvhglxinpbnqkqpmoxmoc` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE IF NOT EXISTS `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vsgfsmiowcgmogfbymbdwxmpxpphxwlfjaeb` (`name`),
  KEY `idx_tezdqfjfoklzfedyyqnbhuciovjwtfdioblx` (`handle`),
  KEY `idx_wlnggetsulzztpchexhkodzhsohlbydhozwi` (`structureId`),
  KEY `idx_ydjsjcgqlnpwiqgvrovouvtlwdmzjnhiycnw` (`fieldLayoutId`),
  KEY `idx_uapyajlpizheobnwfuclikcvgistmfpudqlc` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE IF NOT EXISTS `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlrorgjoydqdcedguhvngntqwypygmkpcafi` (`groupId`,`siteId`),
  KEY `idx_yfxppewklouoxdhheuinvkxtflnpnnfbtzlk` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
CREATE TABLE IF NOT EXISTS `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_avmhbniguyqjfxpwdwzlzfwaxgvfcvmkokxq` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_gntjccmiivzswvzbjebqdfqsvnwqukkkyvse` (`siteId`),
  KEY `fk_bjxxqritpytxuoimooqyjjoilkfhlfsarfod` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(1, 1, 'lastPasswordChangeDate', '2024-04-30 09:51:50', 0, NULL),
(1, 1, 'password', '2024-04-30 09:51:50', 0, NULL),
(2, 1, 'postDate', '2024-04-16 07:08:51', 0, 1),
(2, 1, 'slug', '2024-04-16 07:08:45', 0, 1),
(2, 1, 'title', '2024-04-16 07:08:45', 0, 1),
(2, 1, 'uri', '2024-04-16 07:08:45', 0, 1),
(6, 1, 'title', '2024-04-22 12:06:58', 0, 1),
(12, 1, 'title', '2024-04-29 14:05:37', 0, 1),
(51, 1, 'postDate', '2024-05-06 07:24:11', 0, 1),
(51, 1, 'slug', '2024-05-06 07:22:06', 0, 1),
(51, 1, 'title', '2024-05-06 07:22:04', 0, 1),
(51, 1, 'uri', '2024-05-06 07:22:06', 0, 1),
(64, 1, 'postDate', '2024-05-06 07:24:34', 0, 1),
(64, 1, 'slug', '2024-05-06 07:24:24', 0, 1),
(64, 1, 'title', '2024-05-06 07:24:24', 0, 1),
(64, 1, 'uri', '2024-05-06 07:24:24', 0, 1),
(66, 1, 'postDate', '2024-05-06 07:24:58', 0, 1),
(66, 1, 'slug', '2024-05-06 07:24:46', 0, 1),
(66, 1, 'title', '2024-05-06 07:24:46', 0, 1),
(66, 1, 'uri', '2024-05-06 07:24:46', 0, 1),
(68, 1, 'postDate', '2024-05-06 07:25:26', 0, 1),
(68, 1, 'slug', '2024-05-06 07:25:13', 0, 1),
(68, 1, 'title', '2024-05-06 07:25:11', 0, 1),
(68, 1, 'uri', '2024-05-06 07:25:13', 0, 1),
(70, 1, 'postDate', '2024-05-06 07:25:50', 0, 1),
(70, 1, 'slug', '2024-05-06 07:25:40', 0, 1),
(70, 1, 'title', '2024-05-06 07:25:40', 0, 1),
(70, 1, 'uri', '2024-05-06 07:25:40', 0, 1),
(72, 1, 'postDate', '2024-05-06 07:26:09', 0, 1),
(72, 1, 'slug', '2024-05-06 07:26:01', 0, 1),
(72, 1, 'title', '2024-05-06 07:26:01', 0, 1),
(72, 1, 'uri', '2024-05-06 07:26:01', 0, 1),
(80, 1, 'postDate', '2024-05-13 06:17:24', 0, 1),
(80, 1, 'slug', '2024-05-13 06:17:24', 0, 1),
(80, 1, 'title', '2024-05-13 06:17:23', 0, 1),
(84, 1, 'postDate', '2024-05-13 06:17:50', 0, 1),
(84, 1, 'slug', '2024-05-13 06:17:50', 0, 1),
(84, 1, 'title', '2024-05-13 06:17:50', 0, 1),
(88, 1, 'postDate', '2024-05-13 06:18:11', 0, 1),
(88, 1, 'slug', '2024-05-13 06:18:10', 0, 1),
(88, 1, 'title', '2024-05-13 06:18:10', 0, 1),
(92, 1, 'postDate', '2024-05-13 06:18:39', 0, 1),
(92, 1, 'slug', '2024-05-13 06:18:39', 0, 1),
(92, 1, 'title', '2024-05-13 06:18:39', 0, 1),
(96, 1, 'postDate', '2024-05-13 06:19:13', 0, 1),
(96, 1, 'slug', '2024-05-13 06:19:13', 0, 1),
(96, 1, 'title', '2024-05-13 06:19:12', 0, 1),
(113, 1, 'postDate', '2024-05-13 12:11:17', 0, 1),
(113, 1, 'slug', '2024-05-13 12:11:17', 0, 1),
(113, 1, 'title', '2024-05-13 12:11:17', 0, 1),
(115, 1, 'postDate', '2024-05-13 12:11:22', 0, 1),
(115, 1, 'slug', '2024-05-13 12:11:21', 0, 1),
(115, 1, 'title', '2024-05-13 12:11:21', 0, 1),
(117, 1, 'postDate', '2024-05-13 12:11:26', 0, 1),
(117, 1, 'slug', '2024-05-13 12:11:26', 0, 1),
(117, 1, 'title', '2024-05-13 12:11:26', 0, 1),
(119, 1, 'postDate', '2024-05-13 12:11:32', 0, 1),
(119, 1, 'slug', '2024-05-13 12:11:32', 0, 1),
(119, 1, 'title', '2024-05-13 12:11:32', 0, 1),
(123, 1, 'postDate', '2024-05-13 12:12:10', 0, 1),
(123, 1, 'slug', '2024-05-13 12:12:10', 0, 1),
(123, 1, 'title', '2024-05-13 12:12:09', 0, 1),
(145, 1, 'postDate', '2024-05-13 14:43:45', 0, 1),
(145, 1, 'slug', '2024-05-13 14:43:33', 0, 1),
(145, 1, 'title', '2024-05-13 14:43:33', 0, 1),
(159, 1, 'admin', '2024-06-04 14:49:32', 0, 1),
(159, 1, 'email', '2024-06-04 14:53:34', 0, 159),
(159, 1, 'firstName', '2024-05-28 07:04:15', 0, 1),
(159, 1, 'fullName', '2024-05-28 07:04:15', 0, 1),
(159, 1, 'lastPasswordChangeDate', '2024-06-04 14:53:18', 0, 159),
(159, 1, 'password', '2024-06-04 14:53:18', 0, 159),
(159, 1, 'username', '2024-06-04 14:49:18', 0, 1),
(159, 1, 'verificationCode', '2024-05-28 07:07:04', 0, NULL),
(159, 1, 'verificationCodeIssuedDate', '2024-05-28 07:07:04', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
CREATE TABLE IF NOT EXISTS `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_mvjnqqqcihiofbvmqvmavaerqkmfriscrolt` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ejfdogimnophxempqrrxpkriiyhtgcknkcpb` (`siteId`),
  KEY `fk_qmejamltwyopzvmmbejgdrnesadrjifcqchi` (`fieldId`),
  KEY `fk_vqzkkyyrlwxxzargyezpbpbuddeghkgjtkmh` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `layoutElementUid`, `dateUpdated`, `propagated`, `userId`) VALUES
(12, 1, 6, '4e11705e-3e24-48cc-a796-30b6730d034a', '2024-04-29 14:15:31', 0, 1),
(12, 1, 6, 'a0eaa605-7549-4b6f-85a5-6387131a3c52', '2024-04-29 14:59:53', 0, 1),
(12, 1, 7, 'c588d941-2b45-40c1-917e-8160ff829285', '2024-04-29 15:13:27', 0, 1),
(12, 1, 11, 'd51ac987-38e2-4d55-85e6-f575b5af4fb5', '2024-05-27 14:07:56', 0, 1),
(12, 1, 17, '19bd82cb-9c2e-41eb-838f-087a2d144ff3', '2024-05-27 14:07:55', 0, 1),
(12, 3, 6, 'a0eaa605-7549-4b6f-85a5-6387131a3c52', '2024-05-27 14:07:55', 0, 1),
(51, 1, 8, '64baa63c-9dad-4b86-b384-fc9e3e53fab6', '2024-05-06 07:24:11', 0, 1),
(51, 1, 9, '3c156b75-7eae-46c3-a9a3-092f4782f697', '2024-05-06 07:24:11', 0, 1),
(51, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 12:12:27', 0, 1),
(64, 1, 8, '64baa63c-9dad-4b86-b384-fc9e3e53fab6', '2024-05-06 07:24:34', 0, 1),
(64, 1, 9, '3c156b75-7eae-46c3-a9a3-092f4782f697', '2024-05-06 07:24:34', 0, 1),
(64, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 12:12:50', 0, 1),
(66, 1, 8, '64baa63c-9dad-4b86-b384-fc9e3e53fab6', '2024-05-06 07:24:58', 0, 1),
(66, 1, 9, '3c156b75-7eae-46c3-a9a3-092f4782f697', '2024-05-06 07:24:58', 0, 1),
(66, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 12:12:59', 0, 1),
(68, 1, 8, '64baa63c-9dad-4b86-b384-fc9e3e53fab6', '2024-05-06 07:25:26', 0, 1),
(68, 1, 9, '3c156b75-7eae-46c3-a9a3-092f4782f697', '2024-05-06 07:25:26', 0, 1),
(68, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 12:11:59', 0, 1),
(70, 1, 8, '64baa63c-9dad-4b86-b384-fc9e3e53fab6', '2024-05-06 07:25:50', 0, 1),
(70, 1, 9, '3c156b75-7eae-46c3-a9a3-092f4782f697', '2024-05-06 07:25:50', 0, 1),
(70, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 15:30:09', 0, 1),
(72, 1, 8, '64baa63c-9dad-4b86-b384-fc9e3e53fab6', '2024-05-06 07:26:09', 0, 1),
(72, 1, 9, '3c156b75-7eae-46c3-a9a3-092f4782f697', '2024-05-06 07:26:09', 0, 1),
(72, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 12:12:40', 0, 1),
(136, 1, 16, 'cd4d4642-d8f2-4d23-b38f-c23df3512f01', '2024-05-13 14:42:11', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE IF NOT EXISTS `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_hzpickfnkqtsusutbwufhmfkzygbopoiqjnj` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE IF NOT EXISTS `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_votykuxiggisviourpqovpwsqrtmaqrzrgvr` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
CREATE TABLE IF NOT EXISTS `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_apwlczqqvbktyfoqxphvmxmtncsigebvqivg` (`creatorId`,`provisional`),
  KEY `idx_vlfiueryccjeelaevxxerpghcoepfagdlack` (`saved`),
  KEY `fk_bpakiygstowpjecnkeozydfabgbbvvubazpy` (`canonicalId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `canonicalId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(49, 68, 159, 1, 'Draft 1', '', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
CREATE TABLE IF NOT EXISTS `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_izkfkjasdheykhdgemagvwjymygsxywdztvf` (`elementId`,`timestamp`,`userId`),
  KEY `fk_wmsvodgjdxepaxoqzqmhvdtyrwyuqtuoekyb` (`userId`),
  KEY `fk_jjrhevivywvflwafycfohccgstmfcspadvwp` (`siteId`),
  KEY `fk_dzdgdjeawrtdwypahjpqukuhuacwjijhzxes` (`draftId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `elementactivity`
--

INSERT INTO `elementactivity` (`elementId`, `userId`, `siteId`, `draftId`, `type`, `timestamp`) VALUES
(1, 1, 1, NULL, 'view', '2024-05-13 14:06:41'),
(2, 1, 1, NULL, 'save', '2024-04-16 07:08:51'),
(2, 1, 1, NULL, 'view', '2024-04-16 07:08:42'),
(4, 1, 1, NULL, 'view', '2024-04-22 07:39:45'),
(6, 1, 1, NULL, 'edit', '2024-04-22 12:06:57'),
(6, 1, 1, NULL, 'save', '2024-04-22 12:15:11'),
(6, 1, 1, NULL, 'view', '2024-04-22 12:15:12'),
(12, 1, 3, NULL, 'edit', '2024-05-27 14:07:54'),
(12, 1, 3, NULL, 'save', '2024-05-27 14:07:56'),
(12, 1, 1, NULL, 'view', '2024-05-27 14:08:18'),
(18, 1, 1, NULL, 'save', '2024-04-29 08:33:35'),
(18, 1, 1, NULL, 'view', '2024-04-29 08:33:32'),
(19, 1, 1, NULL, 'view', '2024-04-29 08:35:54'),
(20, 1, 1, NULL, 'save', '2024-04-29 08:37:05'),
(20, 1, 1, NULL, 'view', '2024-04-29 08:36:51'),
(33, 1, 1, NULL, 'view', '2024-04-29 13:12:20'),
(45, 1, 1, NULL, 'view', '2024-05-13 14:20:32'),
(51, 1, 1, NULL, 'edit', '2024-05-13 12:12:17'),
(51, 1, 1, NULL, 'save', '2024-05-13 12:12:29'),
(51, 1, 1, NULL, 'view', '2024-05-13 12:12:28'),
(64, 1, 1, NULL, 'edit', '2024-05-13 12:12:48'),
(64, 1, 1, NULL, 'save', '2024-05-13 12:12:50'),
(64, 1, 1, NULL, 'view', '2024-05-13 12:12:44'),
(66, 1, 1, NULL, 'edit', '2024-05-13 12:12:58'),
(66, 1, 1, NULL, 'save', '2024-05-13 12:12:59'),
(66, 1, 1, NULL, 'view', '2024-05-13 12:12:53'),
(68, 1, 1, NULL, 'edit', '2024-05-13 14:42:11'),
(68, 1, 1, NULL, 'save', '2024-05-13 12:11:59'),
(68, 1, 1, NULL, 'view', '2024-06-04 14:42:25'),
(70, 1, 1, NULL, 'edit', '2024-05-13 15:30:08'),
(70, 1, 1, NULL, 'save', '2024-05-13 15:30:09'),
(70, 1, 1, NULL, 'view', '2024-05-13 15:30:00'),
(72, 1, 1, NULL, 'edit', '2024-05-13 12:12:38'),
(72, 1, 1, NULL, 'save', '2024-05-13 12:12:40'),
(72, 1, 1, NULL, 'view', '2024-05-13 12:12:33'),
(80, 1, 1, NULL, 'save', '2024-05-13 06:17:24'),
(84, 1, 1, NULL, 'save', '2024-05-13 06:17:50'),
(88, 1, 1, NULL, 'save', '2024-05-13 06:18:11'),
(92, 1, 1, NULL, 'save', '2024-05-13 06:18:40'),
(96, 1, 1, NULL, 'save', '2024-05-13 06:19:13'),
(102, 1, 1, NULL, 'view', '2024-05-13 07:52:53'),
(113, 1, 1, NULL, 'save', '2024-05-13 12:11:17'),
(113, 1, 1, NULL, 'view', '2024-05-13 14:40:59'),
(115, 1, 1, NULL, 'save', '2024-05-13 12:11:22'),
(115, 1, 1, NULL, 'view', '2024-05-13 12:11:20'),
(117, 1, 1, NULL, 'save', '2024-05-13 12:11:26'),
(117, 1, 1, NULL, 'view', '2024-05-13 12:37:26'),
(119, 1, 1, NULL, 'save', '2024-05-13 12:11:32'),
(119, 1, 1, NULL, 'view', '2024-05-13 12:11:30'),
(123, 1, 1, NULL, 'save', '2024-05-13 12:12:10'),
(137, 1, 1, NULL, 'view', '2024-05-27 14:07:16'),
(145, 1, 1, NULL, 'save', '2024-05-13 14:43:45'),
(145, 1, 1, NULL, 'view', '2024-05-13 14:43:44'),
(159, 1, 1, NULL, 'save', '2024-06-04 14:49:18'),
(159, 1, 1, NULL, 'view', '2024-06-04 14:49:38'),
(159, 159, 1, NULL, 'save', '2024-06-04 14:53:34'),
(159, 159, 1, NULL, 'view', '2024-06-04 14:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE IF NOT EXISTS `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tttnuuxclsfxuzhrwdsujahmzovcgucznfej` (`dateDeleted`),
  KEY `idx_fwymerecrrbmaxfclmqrczndnabmbkqrtlgt` (`fieldLayoutId`),
  KEY `idx_msygxtrhcxqyyixymkbbfygqlmqdansolvep` (`type`),
  KEY `idx_laxletolmfecepsikonkwklopocggtrdfyim` (`enabled`),
  KEY `idx_zrnxujiyvijnloyggcgbyzxqipjepcmqkxmx` (`canonicalId`),
  KEY `idx_cfohobglrgospuktsqxkuxtqnlpkyomzyrga` (`archived`,`dateCreated`),
  KEY `idx_vvstykelzqgmggjriqqayunxlawkcaceqylo` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ywmxwdlvrwoobeydkldeswvmozjklbdzuwde` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_mwbhovabatybgxifvhhwoborjvzszfrnscqd` (`draftId`),
  KEY `fk_qaoyneysibujxhyqdaadppuoaxrimutoltvc` (`revisionId`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `deletedWithOwner`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2024-04-16 07:00:11', '2024-06-04 14:52:05', NULL, '2024-06-04 14:52:05', NULL, 'baa2a1d1-685b-4c7d-b892-27c82e32c8cd'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2024-04-16 07:08:41', '2024-04-16 07:08:51', NULL, '2024-04-22 07:33:58', NULL, '07368e2f-719d-4808-a7c8-48429ffada93'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2024-04-16 07:08:51', '2024-04-16 07:08:51', NULL, NULL, NULL, 'c18d057a-1086-4bcc-9aa3-1467db452121'),
(4, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2024-04-22 07:38:07', '2024-04-22 07:38:07', NULL, '2024-04-22 09:23:57', NULL, '06edf555-67cf-499a-b265-3ebf77a1844c'),
(5, 4, NULL, 2, 2, 'craft\\elements\\Entry', 1, 0, '2024-04-22 07:38:07', '2024-04-22 07:38:07', NULL, NULL, NULL, '144967e9-e2ba-4dd0-a792-084d7d19ec74'),
(6, NULL, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2024-04-22 12:05:02', '2024-04-22 12:15:11', NULL, '2024-04-22 13:45:41', NULL, 'f64b2698-62b9-45c6-ab83-83d53710886d'),
(7, 6, NULL, 3, 3, 'craft\\elements\\Entry', 1, 0, '2024-04-22 12:05:02', '2024-04-22 12:05:02', NULL, NULL, NULL, '49319cd4-4857-49e8-85de-a0d7c4035003'),
(8, 6, NULL, 4, 3, 'craft\\elements\\Entry', 1, 0, '2024-04-22 12:06:34', '2024-04-22 12:06:34', NULL, NULL, NULL, '7b9ebb8e-7d30-4fc6-85db-e5e069eb06f9'),
(10, 6, NULL, 5, 3, 'craft\\elements\\Entry', 1, 0, '2024-04-22 12:06:58', '2024-04-22 12:06:58', NULL, NULL, NULL, '7c1e00ea-1e8f-4f8c-b8af-5a183aef9c96'),
(11, 6, NULL, 6, 3, 'craft\\elements\\Entry', 1, 0, '2024-04-22 12:15:11', '2024-04-22 12:15:11', NULL, NULL, NULL, '8c0ca68d-6dec-4b9a-a53d-f464d96fe61d'),
(12, NULL, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-22 14:45:20', '2024-05-27 14:07:55', NULL, NULL, NULL, '6b6c1360-0324-45c2-82c0-a283ada665aa'),
(13, 12, NULL, 7, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-22 14:45:20', '2024-04-22 14:45:20', NULL, NULL, NULL, '89863ed5-c459-452b-bb67-bd8dd1dfa5e3'),
(15, 12, NULL, 8, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-22 14:57:22', '2024-04-22 14:57:22', NULL, NULL, NULL, 'b4621849-48a2-4b47-b914-a5a66cc27f05'),
(17, 12, NULL, 9, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-22 15:05:41', '2024-04-22 15:05:41', NULL, NULL, NULL, 'd0a909de-eaad-4608-be98-d2b636ee1aff'),
(18, NULL, NULL, NULL, 6, 'craft\\elements\\Asset', 1, 0, '2024-04-29 08:32:18', '2024-04-29 08:34:21', NULL, '2024-04-29 08:34:21', NULL, '1bff8106-6f92-4514-b740-cb10c00217c4'),
(19, NULL, NULL, NULL, 6, 'craft\\elements\\Asset', 1, 0, '2024-04-29 08:34:28', '2024-04-29 08:36:41', NULL, '2024-04-29 08:36:41', NULL, 'f5e37d4e-fc2e-4915-b3b1-3c544306e99e'),
(20, NULL, NULL, NULL, 6, 'craft\\elements\\Asset', 1, 0, '2024-04-29 08:36:47', '2024-04-29 08:41:30', NULL, '2024-04-29 08:41:30', NULL, 'ecf75e3f-5ed9-46b6-afb0-da1fc96c1cb8'),
(21, NULL, NULL, NULL, 6, 'craft\\elements\\Asset', 1, 0, '2024-04-29 08:41:16', '2024-04-29 08:41:30', NULL, '2024-04-29 08:41:30', NULL, 'fd434c0b-090c-4174-8102-4f0a278b9a46'),
(22, NULL, NULL, NULL, 6, 'craft\\elements\\Asset', 1, 0, '2024-04-29 08:41:58', '2024-04-29 08:43:12', NULL, '2024-04-29 08:43:12', NULL, '71f3c090-1272-4881-b87b-c85aac44bd88'),
(23, 12, NULL, 10, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 12:27:19', '2024-04-29 12:27:19', NULL, NULL, NULL, '884dabd0-04f8-4f74-9a14-a6079e155ae4'),
(24, 12, NULL, 11, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 12:27:24', '2024-04-29 12:27:24', NULL, NULL, NULL, '238b6e1e-c7e0-4d97-b2e8-1897387ea24e'),
(26, 12, NULL, 12, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 12:36:09', '2024-04-29 12:36:09', NULL, NULL, NULL, '734ab4c1-2c1d-41db-b9ee-5b6cf9605e80'),
(28, 12, NULL, 13, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 12:38:24', '2024-04-29 12:38:24', NULL, NULL, NULL, 'e57b933f-b440-469c-a970-46d960204a64'),
(30, 12, NULL, 14, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 12:39:59', '2024-04-29 12:39:59', NULL, NULL, NULL, '5a3719cf-ac62-4bae-8a34-e61bd335cb65'),
(32, 12, NULL, 15, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 12:42:29', '2024-04-29 12:42:29', NULL, NULL, NULL, '5277a324-2849-43ec-9ac8-0be6afa8ea2a'),
(33, NULL, NULL, NULL, 7, 'craft\\elements\\Asset', 1, 0, '2024-04-29 13:10:42', '2024-04-29 13:46:34', NULL, '2024-04-29 13:46:34', NULL, '3b6bf62c-b62d-4777-8d7c-7721d98848b5'),
(35, 12, NULL, 16, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 13:18:16', '2024-04-29 13:18:16', NULL, NULL, NULL, 'c48402aa-e702-4fb1-9269-3d2e3223162a'),
(37, 12, NULL, 17, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 14:05:21', '2024-04-29 14:05:21', NULL, NULL, NULL, '262e89a2-c8ae-4419-8eaf-6da9aff3f901'),
(39, 12, NULL, 18, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 14:05:37', '2024-04-29 14:05:37', NULL, NULL, NULL, '69f46491-a414-49f4-92b1-118bde1229bf'),
(41, 12, NULL, 19, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 14:15:31', '2024-04-29 14:15:31', NULL, NULL, NULL, '70a93794-4888-43c8-94ee-99a29147e4ea'),
(42, 12, NULL, 20, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 14:19:55', '2024-04-29 14:19:55', NULL, NULL, NULL, 'c3b65fa5-2c4a-4681-a3a3-50c1fd986dee'),
(43, 12, NULL, 21, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 14:20:58', '2024-04-29 14:20:58', NULL, NULL, NULL, '75475315-37b8-4b31-9a3d-da08c0de7d3b'),
(45, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-04-29 14:54:03', '2024-04-29 14:55:09', NULL, NULL, NULL, '99fa7ae8-3140-4f56-a9e3-55053724391e'),
(46, 12, NULL, 22, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 14:59:53', '2024-04-29 14:59:53', NULL, NULL, NULL, '184bf289-5bd0-4420-a20d-f6fd8c413504'),
(48, 12, NULL, 23, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 15:11:19', '2024-04-29 15:11:19', NULL, NULL, NULL, 'f9ff652f-8f35-4272-86d4-a7fbec5a5f5c'),
(50, 12, NULL, 24, 4, 'craft\\elements\\Entry', 1, 0, '2024-04-29 15:13:27', '2024-04-29 15:13:27', NULL, NULL, NULL, 'cd264962-48fd-48fc-8891-5b24bc58c4cb'),
(51, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:21:38', '2024-05-13 12:12:29', NULL, NULL, NULL, 'da67dd08-8a89-4a7c-859d-885dbc4e5692'),
(52, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:04', '2024-05-06 07:23:04', NULL, NULL, NULL, '68114fdc-9f91-4446-8fb0-002c2766439e'),
(53, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:05', '2024-05-06 07:23:05', NULL, NULL, NULL, 'd1e185f6-c316-4029-b760-c69068200a03'),
(54, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:06', '2024-05-06 07:23:06', NULL, NULL, NULL, '2fc0431f-911a-4296-89ab-8ac37ec440ab'),
(55, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:06', '2024-05-06 07:23:06', NULL, NULL, NULL, 'e133dfda-8710-4e67-81d2-081bead58a81'),
(56, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:06', '2024-05-06 07:23:06', NULL, NULL, NULL, '85ba6176-e0fe-4fa3-bb3b-c2edbfea0535'),
(57, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:07', '2024-05-06 07:23:07', NULL, NULL, NULL, '4307c608-6ffd-4fff-bc8e-6df919b9bbc4'),
(58, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:07', '2024-05-06 07:23:07', NULL, NULL, NULL, '0111a2b0-44ed-4422-8b43-c095dfd5e158'),
(59, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:08', '2024-05-06 07:23:08', NULL, NULL, NULL, '942bcce7-da50-43e8-bbb3-6cdc371c9bb5'),
(60, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:09', '2024-05-06 07:23:09', NULL, NULL, NULL, '00610f01-d088-439f-94de-6fbb01f5e29a'),
(61, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:11', '2024-05-06 07:23:11', NULL, NULL, NULL, '9cfc0ebc-8c31-4293-af76-e6a7a41c5d3f'),
(62, NULL, NULL, NULL, 8, 'craft\\elements\\Asset', 1, 0, '2024-05-06 07:23:12', '2024-05-06 07:23:12', NULL, NULL, NULL, 'bab9f290-5ed7-43d3-89db-7f77214ac0da'),
(63, 51, NULL, 25, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:24:11', '2024-05-06 07:24:11', NULL, NULL, NULL, 'bba7df81-c17b-4e24-8e90-f2f486a5e802'),
(64, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:24:14', '2024-05-13 12:12:50', NULL, NULL, NULL, 'be70f869-8640-439b-a5b6-8c6b74e30063'),
(65, 64, NULL, 26, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:24:34', '2024-05-06 07:24:34', NULL, NULL, NULL, '3a23cabd-ad21-485d-a6bf-d1c40a159ca7'),
(66, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:24:37', '2024-05-13 12:12:59', NULL, NULL, NULL, '361e73d8-b16b-4a2a-982f-4e62ce6c79fb'),
(67, 66, NULL, 27, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:24:58', '2024-05-06 07:24:58', NULL, NULL, NULL, 'cb795ede-3788-4c62-bf5c-2c573db302d2'),
(68, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:25:02', '2024-05-13 12:11:59', NULL, NULL, NULL, '5aa19f11-740a-4f7b-af4f-aba2652c8798'),
(69, 68, NULL, 28, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:25:26', '2024-05-06 07:25:26', NULL, NULL, NULL, '6eebca99-6ad2-4fcf-8236-37bcc01b4aa3'),
(70, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:25:28', '2024-05-13 15:30:09', NULL, NULL, NULL, '05af43f0-7eb6-4514-ac5e-6a48c33f4b34'),
(71, 70, NULL, 29, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:25:50', '2024-05-06 07:25:50', NULL, NULL, NULL, '496cf58a-648e-441c-af10-ed859a212c29'),
(72, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:25:53', '2024-05-13 12:12:40', NULL, NULL, NULL, '65c16f86-9fbe-487a-a19b-96d6a1c674e1'),
(73, 72, NULL, 30, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:26:09', '2024-05-06 07:26:09', NULL, NULL, NULL, '6c11c16c-3d79-4a44-9b6b-7ebed11b04b1'),
(74, 72, NULL, 31, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-06 07:26:11', '2024-05-06 07:26:11', NULL, NULL, NULL, '8e194736-cbfe-4d95-a2eb-094ce2833a1a'),
(76, 12, NULL, 32, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-06 13:01:02', '2024-05-06 13:01:02', NULL, NULL, NULL, '3445401a-8986-4362-b2fe-4218910ac0e8'),
(78, 12, NULL, 33, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-06 13:03:39', '2024-05-06 13:03:39', NULL, NULL, NULL, 'd6c1b778-6073-472d-a9af-c41f85bbf7c9'),
(79, NULL, NULL, NULL, 10, 'craft\\elements\\GlobalSet', 1, 0, '2024-05-13 06:02:53', '2024-05-13 06:13:01', NULL, '2024-05-13 06:13:01', NULL, 'ab327619-72c0-47dd-96e8-d7d757da809e'),
(80, NULL, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:17:14', '2024-05-13 06:17:24', NULL, '2024-05-13 08:25:46', NULL, '258b8866-bc9e-442a-8ad6-511657655c15'),
(81, 80, NULL, 34, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:17:24', '2024-05-13 06:17:24', NULL, NULL, NULL, 'c711e75e-1489-4470-8d7e-08b10e3ced51'),
(83, 68, NULL, 35, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:17:29', '2024-05-13 06:17:29', NULL, NULL, NULL, 'c26aaf73-16b3-4cca-999e-758e29e865f0'),
(84, NULL, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:17:39', '2024-05-13 06:17:50', NULL, '2024-05-13 08:25:46', NULL, '29b883a1-b212-405a-82e4-4a377f465044'),
(85, 84, NULL, 36, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:17:50', '2024-05-13 06:17:50', NULL, NULL, NULL, 'ffda730c-5102-4f1c-962d-8ad6560bc16f'),
(87, 51, NULL, 37, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:17:56', '2024-05-13 06:17:56', NULL, NULL, NULL, 'cf87aa36-0823-499d-bdd5-182b11825e6c'),
(88, NULL, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:18:05', '2024-05-13 06:18:11', NULL, '2024-05-13 08:25:46', NULL, '6c73dfc1-471a-4a9c-8cb3-76ea6430df1b'),
(89, 88, NULL, 38, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:18:11', '2024-05-13 06:18:11', NULL, NULL, NULL, 'a705fe52-86d0-4c5d-801c-0c31dee11f96'),
(91, 72, NULL, 39, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:18:16', '2024-05-13 06:18:16', NULL, NULL, NULL, '2a3176c9-7410-4e2b-8646-190ce5b6f816'),
(92, NULL, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:18:33', '2024-05-13 06:18:39', NULL, '2024-05-13 08:25:46', NULL, '8a92a620-b43d-4dff-9e9f-2c52de853341'),
(93, 92, NULL, 40, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:18:39', '2024-05-13 06:18:40', NULL, NULL, NULL, '1bcb4e9e-6bce-4ca6-8509-119446111182'),
(95, 64, NULL, 41, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:18:45', '2024-05-13 06:18:45', NULL, NULL, NULL, 'f4074704-9dd5-468e-8c00-2a4d2ae7fb6f'),
(96, NULL, NULL, NULL, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:19:01', '2024-05-13 06:19:13', NULL, '2024-05-13 08:25:46', NULL, '72f5e022-2750-4e99-b0ff-ed5054ccc6d0'),
(97, 96, NULL, 42, 11, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:19:13', '2024-05-13 06:19:13', NULL, NULL, NULL, 'c4a8906f-df6b-4dbb-a5d5-c9fb69a6d4e9'),
(99, 66, NULL, 43, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:19:22', '2024-05-13 06:19:23', NULL, NULL, NULL, 'eea28e66-6ede-4958-bc75-e286a65c17c2'),
(101, 70, NULL, 44, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:19:42', '2024-05-13 06:19:42', NULL, NULL, NULL, '485d1554-1718-4f4f-9b31-fad9b3e6468a'),
(102, NULL, NULL, NULL, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:25:59', '2024-05-13 06:25:59', NULL, '2024-05-13 08:25:58', NULL, '8d5f2e50-9fff-4771-88ec-a28c967710d3'),
(103, 102, NULL, 45, 12, 'craft\\elements\\Entry', 1, 0, '2024-05-13 06:25:59', '2024-05-13 06:25:59', NULL, NULL, NULL, '82797c5d-07a3-4dbc-b53d-b0c79dfef80d'),
(107, NULL, NULL, NULL, 13, 'craft\\elements\\Entry', 1, 0, '2024-05-13 07:59:56', '2024-05-13 07:59:56', NULL, NULL, NULL, '06f07684-9bae-44bc-92b8-a3a739a9ccd8'),
(108, NULL, NULL, NULL, 14, 'craft\\elements\\Entry', 1, 0, '2024-05-13 07:59:56', '2024-05-13 07:59:56', NULL, NULL, NULL, 'e627e3a8-52fe-4445-a66f-f5cf51476d47'),
(109, 68, NULL, 46, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 07:59:56', '2024-05-13 07:59:56', NULL, NULL, NULL, '214d2681-cb83-4150-a16f-2347590e1231'),
(110, 107, NULL, 47, 13, 'craft\\elements\\Entry', 1, 0, '2024-05-13 07:59:56', '2024-05-13 07:59:56', NULL, NULL, NULL, 'b2adcaa4-0e59-46af-be4e-4678bfabd738'),
(111, 108, NULL, 48, 14, 'craft\\elements\\Entry', 1, 0, '2024-05-13 07:59:56', '2024-05-13 07:59:56', NULL, NULL, NULL, 'c427bb45-ef5c-4dcc-a902-fecc6dfb7ead'),
(112, NULL, NULL, NULL, 15, 'craft\\elements\\GlobalSet', 1, 0, '2024-05-13 11:52:54', '2024-05-13 13:58:14', NULL, '2024-05-13 13:58:14', NULL, 'aa979011-b63c-4090-9b8e-4a9514c60428'),
(113, NULL, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:12', '2024-05-13 12:11:17', NULL, NULL, NULL, '7491f9c2-425a-4375-be90-663a75225a9b'),
(114, 113, NULL, 49, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:17', '2024-05-13 12:11:17', NULL, NULL, NULL, 'c41b476f-4083-4757-9584-8697006f9028'),
(115, NULL, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:19', '2024-05-13 12:11:22', NULL, NULL, NULL, '3eb7c629-b365-4b1e-a70d-9d5cc89d75f7'),
(116, 115, NULL, 50, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:22', '2024-05-13 12:11:22', NULL, NULL, NULL, 'e1655e18-a654-4b3e-aee7-9a19544d3c21'),
(117, NULL, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:23', '2024-05-13 12:11:26', NULL, NULL, NULL, 'bf9ef1db-6b57-4f59-b5c2-bc87a5a59bed'),
(118, 117, NULL, 51, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:26', '2024-05-13 12:11:26', NULL, NULL, NULL, '47ecf713-b9c8-4965-b9e1-0b9d7a808037'),
(119, NULL, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:28', '2024-05-13 12:11:32', NULL, NULL, NULL, '161e7f91-a9df-4088-971c-fe38995205b3'),
(120, 119, NULL, 52, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:32', '2024-05-13 12:11:32', NULL, NULL, NULL, 'f91dab90-e6de-4379-b615-fb38eb6a8dc0'),
(122, 68, NULL, 53, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:11:59', '2024-05-13 12:11:59', NULL, NULL, NULL, 'e532e86f-0dba-4bda-b969-e0c006a41341'),
(123, NULL, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:05', '2024-05-13 12:12:10', NULL, NULL, NULL, '21dae67c-0086-4bc6-b6c6-9757c95289e4'),
(124, 123, NULL, 54, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:10', '2024-05-13 12:12:10', NULL, NULL, NULL, 'd4275b27-6047-4a33-97c6-5c02d25907aa'),
(126, 51, NULL, 55, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:27', '2024-05-13 12:12:27', NULL, NULL, NULL, '423afd8a-bf17-4b79-bb7e-3d96594e3f51'),
(127, 51, NULL, 56, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:29', '2024-05-13 12:12:29', NULL, NULL, NULL, '28c7c74e-b3e6-4701-866f-803e1a154b67'),
(129, 72, NULL, 57, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:40', '2024-05-13 12:12:40', NULL, NULL, NULL, '253144d7-f627-4a20-9feb-6737cb1051af'),
(131, 64, NULL, 58, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:50', '2024-05-13 12:12:50', NULL, NULL, NULL, '81143f59-89e1-4da0-8597-0cda10ca85fd'),
(133, 66, NULL, 59, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:12:59', '2024-05-13 12:12:59', NULL, NULL, NULL, 'acb35cee-e4da-4522-af6b-2b4220a3d290'),
(135, 70, NULL, 60, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:13:09', '2024-05-13 12:13:09', NULL, NULL, NULL, 'f55314a0-7f85-4a11-8777-c784eb6cf29d'),
(136, 68, 49, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:35:57', '2024-05-13 14:42:11', NULL, NULL, NULL, '4ec12d50-2c7d-4566-9f29-f16fa632a778'),
(137, NULL, NULL, NULL, 17, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:45:57', '2024-05-13 12:45:57', NULL, NULL, NULL, '684a6b66-ae87-42ab-9c78-2c9c3474df3f'),
(138, 137, NULL, 61, 17, 'craft\\elements\\Entry', 1, 0, '2024-05-13 12:45:57', '2024-05-13 12:45:58', NULL, NULL, NULL, '26b1b2e9-159d-4d3d-9530-333573b5d335'),
(144, NULL, NULL, NULL, 20, 'craft\\elements\\GlobalSet', 1, 0, '2024-05-13 14:01:07', '2024-05-13 14:01:43', NULL, NULL, NULL, 'c145b76d-f1b8-4a06-8c95-70cb973425e5'),
(145, NULL, NULL, NULL, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 14:43:25', '2024-05-13 14:43:45', NULL, NULL, NULL, 'da3559a2-7849-4740-b21b-b6836ef9029e'),
(146, 145, NULL, 62, 16, 'craft\\elements\\Entry', 1, 0, '2024-05-13 14:43:45', '2024-05-13 14:43:45', NULL, NULL, NULL, '4f0e7139-6c4f-4beb-9ab6-b4ff8fe18516'),
(148, 70, NULL, 63, 9, 'craft\\elements\\Entry', 1, 0, '2024-05-13 15:30:09', '2024-05-13 15:30:09', NULL, NULL, NULL, '0aab6008-cb97-4d4a-bb93-a76b0e16fd77'),
(149, 12, NULL, 64, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:03:45', '2024-05-27 14:03:45', NULL, NULL, NULL, '1c1f8659-b5b5-4c69-8951-de9182743d88'),
(150, NULL, NULL, NULL, 18, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:55', NULL, NULL, NULL, 'b6a317bd-bd1f-4bfe-804d-b3f13fc21f0b'),
(151, NULL, NULL, NULL, 19, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:55', NULL, NULL, NULL, '59f66ddb-6e99-4457-8064-61bcf972887b'),
(152, NULL, NULL, NULL, 18, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:55', NULL, NULL, NULL, 'b85c6329-79e2-4117-ab01-a1b5fd45e76d'),
(153, NULL, NULL, NULL, 18, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:55', NULL, NULL, NULL, '8d7ff997-45ca-43b7-a986-2358ed359517'),
(154, 12, NULL, 65, 4, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:56', NULL, NULL, NULL, '2c376681-6872-4cc4-8561-a0e44a6ecd9b'),
(155, 150, NULL, 66, 18, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:56', NULL, NULL, NULL, '619e0dc7-d81a-483c-ad32-6b916a3be9d4'),
(156, 151, NULL, 67, 19, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:56', NULL, NULL, NULL, '69c33b49-2c92-45cf-a84b-6425f8023717'),
(157, 152, NULL, 68, 18, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:56', NULL, NULL, NULL, '3e1321f3-9e76-40ba-8064-bb9ab6a7e3dc'),
(158, 153, NULL, 69, 18, 'craft\\elements\\Entry', 1, 0, '2024-05-27 14:07:55', '2024-05-27 14:07:56', NULL, NULL, NULL, '5d8b9d14-6fd5-4003-a9ff-cda9662d2faa'),
(159, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2024-05-28 07:03:45', '2024-06-04 14:53:34', NULL, NULL, NULL, '0a67948c-157e-461d-a1d8-62ce159098f0'),
(160, NULL, NULL, NULL, 21, 'craft\\elements\\Entry', 1, 0, '2024-05-28 07:08:28', '2024-05-28 07:08:28', NULL, '2024-06-04 14:52:39', NULL, 'cfeecf46-a96b-4140-a52d-47bcee6da972'),
(161, 160, NULL, 70, 21, 'craft\\elements\\Entry', 1, 0, '2024-05-28 07:08:28', '2024-05-28 07:08:28', NULL, NULL, NULL, 'ccca883b-0f3c-4648-a34a-5f971b4c2fb8');

-- --------------------------------------------------------

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
CREATE TABLE IF NOT EXISTS `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_luarbdkbhseganldzcmftwwbiofkquladcmi` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
CREATE TABLE IF NOT EXISTS `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_ggudnutvngngpbzlofqfwrkkfjihktomtrcd` (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `elements_owners`
--

INSERT INTO `elements_owners` (`elementId`, `ownerId`, `sortOrder`) VALUES
(107, 68, 1),
(107, 136, 1),
(108, 68, 2),
(108, 136, 2),
(110, 109, 1),
(111, 109, 2),
(150, 12, 1),
(151, 12, 2),
(152, 12, 3),
(153, 12, 4),
(155, 154, 1),
(156, 154, 2),
(157, 154, 3),
(158, 154, 4);

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE IF NOT EXISTS `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fvqtejfetnzfkvkbudprrhnnbvmolnfrlcwm` (`elementId`,`siteId`),
  KEY `idx_mqryvaffcbtruudolycszqbitxnavpqmeerr` (`siteId`),
  KEY `idx_gqenowrahympkkcssclaxbetkjqfdjzzmjmo` (`title`,`siteId`),
  KEY `idx_puijfkiukhistmxldfpjqzuxdxisqmgwhbue` (`slug`,`siteId`),
  KEY `idx_vqloqxphpcvnrggcvsphmbykrbktlogruuxb` (`enabled`),
  KEY `idx_vxwppnsibzznuwbnongobjaifchhznypuqwy` (`uri`,`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `title`, `slug`, `uri`, `content`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 1, '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'a939b88c-9d15-40f2-98f0-5d4986e42488'),
(2, 2, 1, 'Test', 'test', 'nieuws/test', NULL, 1, '2024-04-16 07:08:41', '2024-04-16 07:08:45', '61df3794-ae69-40fa-aa2c-8c933c7e9eb7'),
(3, 3, 1, 'Test', 'test', 'nieuws/test', NULL, 1, '2024-04-16 07:08:51', '2024-04-16 07:08:51', '2beee82c-abbd-4815-947d-bc11c74139c3'),
(4, 4, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 07:38:07', '2024-04-22 07:38:07', 'c4d8285f-19b0-46d8-8ac9-00587760a867'),
(5, 5, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 07:38:07', '2024-04-22 07:38:07', 'e498e06b-8458-40a6-83b1-605d04a39e7f'),
(6, 6, 1, 'Startpagina vanuit backend', 'startpagina', '__home__', '{\"bac770cb-880b-4bb0-9d92-7e81c3d85e06\": \"Dit is de intro van de pagina.\"}', 1, '2024-04-22 12:05:02', '2024-04-22 12:15:11', '2d38bf53-e3d3-4a38-8f6a-de777f183842'),
(7, 7, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 12:05:02', '2024-04-22 12:05:02', '0cb5e0b9-641d-4c48-aeea-a84104b356f2'),
(8, 8, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 12:06:34', '2024-04-22 12:06:34', '008f0753-a097-49bc-bf4e-47213d96c472'),
(10, 10, 1, 'Startpagina vanuit backend', 'startpagina', '__home__', NULL, 1, '2024-04-22 12:06:58', '2024-04-22 12:06:58', '7fdc7488-0d96-401c-ae64-4800192f7685'),
(11, 11, 1, 'Startpagina vanuit backend', 'startpagina', '__home__', '{\"bac770cb-880b-4bb0-9d92-7e81c3d85e06\": \"Dit is de intro van de pagina.\"}', 1, '2024-04-22 12:15:11', '2024-04-22 12:15:11', 'b2b385e4-2954-4924-90df-fae5d152be50'),
(12, 12, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-04-22 14:45:20', '2024-05-27 14:07:55', '3b59bd81-e2f7-442e-8dad-1a7ec2f3ce1e'),
(13, 13, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 14:45:20', '2024-04-22 14:45:20', 'db278387-78e4-4fce-b6e9-4869d1d2d17d'),
(15, 15, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 14:57:22', '2024-05-27 14:03:46', 'd839102e-0808-4334-9c15-7ca76ce53d85'),
(17, 17, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-22 15:05:41', '2024-05-27 14:03:47', '50a0e943-3982-4054-bd4f-f39491c139a2'),
(18, 18, 1, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-04-29 08:32:18', '2024-04-29 08:32:18', '993d2033-3d0f-4421-9da3-6d725b4abac4'),
(19, 19, 1, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-04-29 08:34:28', '2024-04-29 08:34:28', '8805bf30-c234-4cbb-a879-7be9a8b439f5'),
(20, 20, 1, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-04-29 08:36:47', '2024-04-29 08:36:47', '2ab7c071-2589-4446-b7c0-3c8142dbdf43'),
(21, 21, 1, '7db', NULL, NULL, NULL, 1, '2024-04-29 08:41:16', '2024-04-29 08:41:16', '4a85781c-cc4c-4f23-9682-114cbe64a9a1'),
(22, 22, 1, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-04-29 08:41:58', '2024-04-29 08:41:58', 'fd36df65-4d06-4247-a097-456c2f56dc23'),
(23, 23, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 12:27:19', '2024-05-27 14:03:47', '1cbbbe66-d7a8-4b64-86b1-dfb491634c2c'),
(24, 24, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 12:27:24', '2024-05-27 14:03:47', 'ee7da74a-3b81-485a-ab9d-e0a661809373'),
(26, 26, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 12:36:09', '2024-05-27 14:03:47', '216d9bf3-5497-455e-85b5-d82de4bfbd7c'),
(28, 28, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 12:38:24', '2024-05-27 14:03:47', 'd0b9b26b-ef38-427f-b99d-2ef8c28da96b'),
(30, 30, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 12:39:59', '2024-05-27 14:03:47', 'c7e91ddd-7eb6-4e16-a4fb-5a5c5c7f01d7'),
(32, 32, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 12:42:29', '2024-05-27 14:03:47', '00e65999-3685-4284-9955-9d9ff68c38ae'),
(33, 33, 1, 'Andre tan hum Xyc Oz C00 unsplash 683x1024', NULL, NULL, NULL, 1, '2024-04-29 13:10:42', '2024-04-29 13:10:42', '12512a0d-312c-4b61-8708-96099a8a85cf'),
(35, 35, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 13:18:16', '2024-05-27 14:03:47', '9d6e48c2-f1d7-4cb8-88ce-f07c9316d8ae'),
(37, 37, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 14:05:21', '2024-05-27 14:03:47', '38966fac-4b57-4ebd-bd82-f94a88a510e5'),
(39, 39, 1, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-04-29 14:05:37', '2024-04-29 14:05:37', 'a1a30430-4059-4d2f-b79a-47c58e9af5c8'),
(41, 41, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-04-29 14:15:31', '2024-05-27 14:03:47', '0218f210-8e48-437a-afca-a32a58bf6f6a'),
(42, 42, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-04-29 14:19:55', '2024-05-27 14:03:47', '9c4188e9-1362-4d56-8e4b-b8aebe07c000'),
(43, 43, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-04-29 14:20:58', '2024-05-27 14:03:47', 'e5f5029b-2ea2-4b15-8207-d2de043c58df'),
(45, 45, 1, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-04-29 14:54:03', '2024-04-29 14:54:03', 'e98ff20d-4ada-4a35-807c-63d8d7b56c6d'),
(46, 46, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-04-29 14:59:53', '2024-05-27 14:03:47', '66ef79dd-cf4c-4d82-a695-acc16bf22a21'),
(48, 48, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-04-29 15:11:19', '2024-05-27 14:03:48', 'c2c6859f-a67d-4b12-b49a-1cc24c595e24'),
(50, 50, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-04-29 15:13:27', '2024-05-27 14:03:48', '2a002885-e736-4dc0-8f6b-4a370d3c4e1e'),
(51, 51, 1, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-06 07:21:38', '2024-05-06 07:24:10', '7bea62ef-e0ac-4276-a5f3-dc53ef2fa169'),
(52, 52, 1, 'Bg', NULL, NULL, NULL, 1, '2024-05-06 07:23:04', '2024-05-06 07:23:04', '08523583-1e5d-4064-b66a-3db05c77e5c8'),
(53, 53, 1, 'Gallery 1', NULL, NULL, NULL, 1, '2024-05-06 07:23:05', '2024-05-06 07:23:05', 'dbbb8386-074e-4c8a-8973-cd9d844be376'),
(54, 54, 1, 'Gallery 2', NULL, NULL, NULL, 1, '2024-05-06 07:23:06', '2024-05-06 07:23:06', '9c2bc092-8b23-432d-ae10-c8bd18056d03'),
(55, 55, 1, 'Gallery 3', NULL, NULL, NULL, 1, '2024-05-06 07:23:06', '2024-05-06 07:23:06', '6050df51-a159-47b8-9c04-43be8c5a1426'),
(56, 56, 1, 'Gallery 4', NULL, NULL, NULL, 1, '2024-05-06 07:23:06', '2024-05-06 07:23:06', 'cae9316f-64a3-4107-a111-f98a07bca275'),
(57, 57, 1, 'Gallery 5', NULL, NULL, NULL, 1, '2024-05-06 07:23:07', '2024-05-06 07:23:07', 'f7785ba1-8cb2-40ae-847e-6e317e50be4e'),
(58, 58, 1, 'Gallery 6', NULL, NULL, NULL, 1, '2024-05-06 07:23:07', '2024-05-06 07:23:07', 'ae6b988d-df7d-4daa-a20a-07dc4f31a682'),
(59, 59, 1, 'Nav img 1', NULL, NULL, NULL, 1, '2024-05-06 07:23:08', '2024-05-06 07:23:08', 'ff9559ab-3b65-4f32-bfd5-ae0fbc276a63'),
(60, 60, 1, 'Nav img 2', NULL, NULL, NULL, 1, '2024-05-06 07:23:09', '2024-05-06 07:23:09', 'f5a58745-e48d-402e-8671-b1e680faf808'),
(61, 61, 1, 'Nav img 3', NULL, NULL, NULL, 1, '2024-05-06 07:23:11', '2024-05-06 07:23:11', 'e10be10c-a00b-4746-b5fe-c8ceed0f69ef'),
(62, 62, 1, 'Team', NULL, NULL, NULL, 1, '2024-05-06 07:23:12', '2024-05-06 07:23:12', '0d098de5-5bc4-4620-9847-e9ded92e1cff'),
(63, 63, 1, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-06 07:24:11', '2024-05-06 07:24:11', '6171141e-2d74-4b38-81f0-a6132050872e'),
(64, 64, 1, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-06 07:24:14', '2024-05-06 07:24:33', '30466f5e-c074-44a4-9281-d8db06dceeba'),
(65, 65, 1, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-06 07:24:34', '2024-05-06 07:24:34', '96bb06e5-412c-4fe8-bbb7-30684b284ef2'),
(66, 66, 1, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-06 07:24:37', '2024-05-06 07:24:57', '8f348c36-9def-47f2-80bd-77adc8a05b1a'),
(67, 67, 1, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-06 07:24:58', '2024-05-06 07:24:58', '4f28d947-19dd-461b-a04e-885a0c34b18b'),
(68, 68, 1, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-06 07:25:02', '2024-05-06 15:05:27', '6bea1486-94b8-4979-8185-bdde42197560'),
(69, 69, 1, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-06 07:25:26', '2024-05-06 07:25:26', '4ac43a47-0c19-43cf-a6ec-4eb4b3efe0c5'),
(70, 70, 1, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-06 07:25:28', '2024-05-06 07:25:49', 'c15a3532-c79a-43f2-a8aa-a2f0716e6d9d'),
(71, 71, 1, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-06 07:25:50', '2024-05-06 07:25:50', '9a6451ea-772b-44ea-99e0-1bf9a0317725'),
(72, 72, 1, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-06 07:25:53', '2024-05-06 12:43:39', 'aabfe096-5811-42ba-9125-ca399c8b53cf'),
(73, 73, 1, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-06 07:26:09', '2024-05-06 07:26:09', '986577d1-04f9-447e-94a7-cb1e1993a5ca'),
(74, 74, 1, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-06 07:26:11', '2024-05-06 07:26:11', '055da859-7a07-4361-9f58-405e4a89214a'),
(76, 76, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-06 13:01:02', '2024-05-27 14:03:48', '87e4e430-5263-47f1-b64a-e07882710ad0'),
(78, 78, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-06 13:03:39', '2024-05-27 14:03:48', '69191f38-ca22-45f4-8ae4-8fee9fdb8dba'),
(79, 79, 1, NULL, NULL, NULL, '{\"7e5129a3-08c6-4491-98bd-5ae8e65c5004\": \"https://www.instagram.com\"}', 1, '2024-05-13 06:02:53', '2024-05-13 06:03:11', 'd83d7b4b-129d-4be8-b0cf-7074efcf4cd9'),
(80, 80, 1, 'Wit', 'wit', NULL, NULL, 1, '2024-05-13 06:17:14', '2024-05-13 06:17:31', '9c33f697-2012-4dd1-969e-dc06f0e27cbd'),
(81, 81, 1, 'Wit', 'wit', NULL, NULL, 1, '2024-05-13 06:17:24', '2024-05-13 06:17:24', '5679b5b3-4848-46b5-b89f-f2747d84c2c6'),
(83, 83, 1, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-13 06:17:29', '2024-05-13 06:17:29', '3fb6e98f-6802-4157-927c-6ad23758fd91'),
(84, 84, 1, 'Blauw', 'blauw', NULL, NULL, 1, '2024-05-13 06:17:39', '2024-05-13 06:17:58', '50b2b63e-3c1e-447e-a843-1494c32a2d8f'),
(85, 85, 1, 'Blauw', 'blauw', NULL, NULL, 1, '2024-05-13 06:17:50', '2024-05-13 06:17:50', 'edb56121-c596-4364-b8e7-a20eb8245ef1'),
(87, 87, 1, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-13 06:17:56', '2024-05-13 06:17:56', '500aca70-6f4a-4c27-aaa7-a0c8253edfbd'),
(88, 88, 1, 'Groen', 'groen', NULL, NULL, 1, '2024-05-13 06:18:05', '2024-05-13 06:18:19', '1443516b-6636-4db5-b7ea-51c412f8376c'),
(89, 89, 1, 'Groen', 'groen', NULL, NULL, 1, '2024-05-13 06:18:11', '2024-05-13 06:18:11', '53595ff9-0cca-4c30-bc7d-91d0453e0bf4'),
(91, 91, 1, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-13 06:18:16', '2024-05-13 06:18:16', 'a153271d-4559-471c-b0f1-93ebd718e2b6'),
(92, 92, 1, 'Zwart', 'zwart', NULL, NULL, 1, '2024-05-13 06:18:33', '2024-05-13 06:18:47', '9b97bf81-be8a-49b4-a35e-6e6393e29fb9'),
(93, 93, 1, 'Zwart', 'zwart', NULL, NULL, 1, '2024-05-13 06:18:40', '2024-05-13 06:18:40', '67b9115a-91fe-4993-b8fb-071658cfb6a0'),
(95, 95, 1, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-13 06:18:45', '2024-05-13 06:18:45', '24acd897-2af1-43bc-bfb8-bf9728004d3c'),
(96, 96, 1, 'Geel', 'geel', NULL, NULL, 1, '2024-05-13 06:19:01', '2024-05-13 06:19:25', '0b3c84e2-d433-4595-b038-68fd7b7af006'),
(97, 97, 1, 'Geel', 'geel', NULL, NULL, 1, '2024-05-13 06:19:13', '2024-05-13 06:19:13', '74ef2538-59b6-4723-b3cf-086ee3e86b93'),
(99, 99, 1, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-13 06:19:23', '2024-05-13 06:19:23', 'f02480bd-74e8-4800-8084-74f7a5da9c75'),
(101, 101, 1, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-13 06:19:42', '2024-05-13 06:19:42', '08308522-52b4-4521-bc16-6ad28b232317'),
(102, 102, 1, 'Sneakers Overzicht', 'sneakers-overzicht', 'our-sneakers', NULL, 1, '2024-05-13 06:25:59', '2024-05-13 06:25:59', '4ebd266b-5ff6-4531-b221-014a3c84d0a5'),
(103, 103, 1, 'Sneakers Overzicht', 'sneakers-overzicht', 'our-sneakers', NULL, 1, '2024-05-13 06:25:59', '2024-05-13 06:25:59', 'f23148ce-7531-4844-ab57-6c0c3e2f044f'),
(107, 107, 1, 'Tekst blok', 'tekst-blok', NULL, '{\"6eb78967-2c59-4736-b63f-620956657214\": \"<p>Dit is een voorbeeldtekst</p>\"}', 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', 'c1e63e1a-8bb7-4f1e-9019-181883e0a57a'),
(108, 108, 1, 'Afbeelding blok', 'afbeelding-blok', NULL, NULL, 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', 'b63fca06-a32e-40af-8673-6afd96853cec'),
(109, 109, 1, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', '2a404b4a-1b5c-4fa6-abbd-3fb4ae4519f7'),
(110, 110, 1, 'Tekst blok', 'tekst-blok', NULL, '{\"6eb78967-2c59-4736-b63f-620956657214\": \"<p>Dit is een voorbeeldtekst</p>\"}', 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', '8d16ed05-daee-47d2-938d-2974d24d3de5'),
(111, 111, 1, 'Afbeelding blok', 'afbeelding-blok', NULL, NULL, 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', '809f59a2-3205-4878-87ff-e9ed57405148'),
(112, 112, 1, NULL, NULL, NULL, '{\"4872269a-6992-4dea-849b-7837b1b12ab8\": \"https://www.instagram.com\"}', 1, '2024-05-13 11:52:54', '2024-05-13 11:53:54', '970a86e4-ec0c-4d46-8ddd-4bd75bd2173b'),
(113, 113, 1, 'Zwart', 'zwart', NULL, NULL, 1, '2024-05-13 12:11:12', '2024-05-13 15:17:19', '14e64fd3-8998-4b64-ac26-eda211cb12dc'),
(114, 114, 1, 'Zwart', 'zwart', NULL, NULL, 1, '2024-05-13 12:11:17', '2024-05-13 12:11:17', '7afb5cd9-dc92-4030-a01b-4a76636e4b21'),
(115, 115, 1, 'Geel', 'geel', NULL, NULL, 1, '2024-05-13 12:11:19', '2024-05-13 14:56:53', '397e960f-6ee6-4b96-8f4d-f7538453555f'),
(116, 116, 1, 'Geel', 'geel', NULL, NULL, 1, '2024-05-13 12:11:22', '2024-05-13 12:11:22', '7d78624f-ef13-48e7-87c0-b526001c48aa'),
(117, 117, 1, 'Wit', 'wit', NULL, NULL, 1, '2024-05-13 12:11:23', '2024-05-13 14:40:49', '57231f81-2aef-4db1-9bb7-8c1840571a6a'),
(118, 118, 1, 'Wit', 'wit', NULL, NULL, 1, '2024-05-13 12:11:26', '2024-05-13 12:11:26', '42c090c4-7fe8-49e0-aa9d-0adb56b72394'),
(119, 119, 1, 'Groen', 'groen', NULL, NULL, 1, '2024-05-13 12:11:28', '2024-05-13 12:11:32', '912af2db-6e84-4b93-8684-862fa8d0179b'),
(120, 120, 1, 'Groen', 'groen', NULL, NULL, 1, '2024-05-13 12:11:32', '2024-05-13 12:11:32', 'be008546-7c3a-4fba-accc-bc795f96ea34'),
(122, 122, 1, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-13 12:11:59', '2024-05-13 12:11:59', '9022092c-89d7-442b-b333-7488e1a5d9d3'),
(123, 123, 1, 'Blauw', 'blauw', NULL, NULL, 1, '2024-05-13 12:12:05', '2024-05-13 12:34:04', '54c1ae68-adc3-4f25-9f0e-79af6a52e126'),
(124, 124, 1, 'Blauw', 'blauw', NULL, NULL, 1, '2024-05-13 12:12:10', '2024-05-13 12:12:10', 'bd8d0191-fa4f-4b5f-a230-4b243e359e60'),
(126, 126, 1, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-13 12:12:27', '2024-05-13 12:12:27', 'da499ffd-3562-4f42-82d6-5ee626c21730'),
(127, 127, 1, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-13 12:12:29', '2024-05-13 12:12:29', 'e02586cd-90e0-497b-8166-d926ff30abfd'),
(129, 129, 1, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-13 12:12:40', '2024-05-13 12:12:40', 'ffac6600-0d2d-438f-8220-def1f4e688b6'),
(131, 131, 1, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-13 12:12:50', '2024-05-13 12:12:50', '7c06f032-92c9-49c6-838c-15c075183355'),
(133, 133, 1, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-13 12:12:59', '2024-05-13 12:12:59', '994257cc-1885-4993-973a-e318d575294e'),
(135, 135, 1, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-13 12:13:09', '2024-05-13 12:13:09', 'e99975b8-f432-40aa-9d60-017cc425a590'),
(136, 136, 1, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-13 12:35:57', '2024-05-13 12:35:57', 'a3d5f014-bb02-4b9d-94a1-aeda5b9182f8'),
(137, 137, 1, 'Sneakers Overzicht', 'sneakers-overzicht', 'our-sneakers', NULL, 1, '2024-05-13 12:45:58', '2024-05-13 12:45:58', '8caa956d-38af-4ee4-9946-a1c5d9a0e1b5'),
(138, 138, 1, 'Sneakers Overzicht', 'sneakers-overzicht', 'our-sneakers', NULL, 1, '2024-05-13 12:45:58', '2024-05-13 12:45:58', 'bc3fb0c8-f594-4d91-be6e-9d78a5f5e51d'),
(144, 144, 1, NULL, NULL, NULL, '{\"1a096a33-e60d-4dbc-8492-8ab6cd075d24\": \"https://www.facebook.com\"}', 1, '2024-05-13 14:01:07', '2024-05-13 14:01:43', '23ec39d2-fdda-403a-8979-3e6469eb3501'),
(145, 145, 1, 'Rood', 'rood', NULL, NULL, 1, '2024-05-13 14:43:25', '2024-05-13 14:43:33', 'c3186e6c-ec2b-4638-bcdb-0ef711d21b30'),
(146, 146, 1, 'Rood', 'rood', NULL, NULL, 1, '2024-05-13 14:43:45', '2024-05-13 14:43:45', 'a6ab2cd0-280e-4bde-92a4-5fe70cd51dfa'),
(148, 148, 1, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-13 15:30:09', '2024-05-13 15:30:09', 'a876b0ab-e832-43b0-a93c-83b19714063e'),
(149, 144, 2, NULL, NULL, NULL, '{\"1a096a33-e60d-4dbc-8492-8ab6cd075d24\": \"https://www.facebook.com\"}', 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', '5ca65e94-5508-4f0b-aa9f-208f011a1215'),
(150, 45, 2, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', '621c5f40-4155-409a-9496-d703f9c2aeaa'),
(151, 52, 2, 'Bg', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'a3488421-ce2b-4620-b40c-3c5a15fa7e56'),
(152, 53, 2, 'Gallery 1', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'db5d9ab5-cbd4-4251-93f3-4902a44f1bb3'),
(153, 54, 2, 'Gallery 2', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'a508227c-3ea4-42c1-a858-85f7549d443b'),
(154, 55, 2, 'Gallery 3', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', '3487534a-4827-4666-b28d-7a129273b9b8'),
(155, 56, 2, 'Gallery 4', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'a33f7c68-72f3-4e9e-b934-421458e425d3'),
(156, 57, 2, 'Gallery 5', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', '944fa62f-c938-40d8-b4fb-dfa9fc1047a7'),
(157, 58, 2, 'Gallery 6', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'd3ce2fe8-5f45-4775-a11e-33bb39b53353'),
(158, 59, 2, 'Nav img 1', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', '6a2ae53f-4720-450c-bf5b-a93c8a830381'),
(159, 60, 2, 'Nav img 2', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'f2bde815-fb44-49b2-920f-40f85032170a'),
(160, 61, 2, 'Nav img 3', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'dfbf6e05-8c66-4dc9-ac01-9a4fa8f1fc19'),
(161, 62, 2, 'Team', NULL, NULL, NULL, 1, '2024-05-27 10:55:17', '2024-05-27 10:55:17', 'c5c1aa5a-993e-4901-a95b-42e822761557'),
(162, 144, 3, NULL, NULL, NULL, '{\"1a096a33-e60d-4dbc-8492-8ab6cd075d24\": \"https://www.facebook.com\"}', 1, '2024-05-27 13:59:24', '2024-05-27 13:59:24', '83a563c1-1753-4ae7-89bd-cc8c3071bfc6'),
(163, 45, 3, 'Andre tan hum Xyc Oz C00 unsplash 1 683x1024', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', 'b7222485-32a7-4b04-9682-bb96ec10d9c5'),
(164, 52, 3, 'Bg', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '6f36046a-e4f4-40af-a5f7-0758e5e8c2e2'),
(165, 53, 3, 'Gallery 1', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '399ad240-7f17-4fcb-980e-e0f67509501f'),
(166, 54, 3, 'Gallery 2', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '8ab5d084-7eee-46a0-8a79-92e21f951046'),
(167, 55, 3, 'Gallery 3', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '1d13cdf3-496d-4e86-a917-9b03c64580f0'),
(168, 56, 3, 'Gallery 4', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '7d14478b-f026-40e8-8e04-59bc12c57a0b'),
(169, 57, 3, 'Gallery 5', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '5dd72f6a-f7b9-4b99-be1f-aa7d994eab33'),
(170, 58, 3, 'Gallery 6', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '46bb7754-3348-4b30-92fe-59b9adaee5f2'),
(171, 59, 3, 'Nav img 1', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', 'c9ca2060-0f3f-430a-a4da-4a2d2cf1152c'),
(172, 60, 3, 'Nav img 2', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '23d811e7-c53e-4c28-8959-7ea24f49f2af'),
(173, 61, 3, 'Nav img 3', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', '432e5f63-c243-4a30-a818-3728ff4aaf92'),
(174, 62, 3, 'Team', NULL, NULL, NULL, 1, '2024-05-27 13:59:25', '2024-05-27 13:59:25', 'd64c3bc8-059b-4fed-9805-f887f0eac495'),
(175, 12, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-05-27 14:03:45', '2024-05-27 14:07:55', 'd59285bd-6f2d-46b4-97f9-659b98ff2455'),
(176, 149, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:45', '2024-05-27 14:03:48', 'fcc9fc5e-80d6-4e1a-883c-b67bfb70ef91'),
(177, 149, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:45', '2024-05-27 14:03:49', '01eb899b-55b3-4ebf-931e-27988bef1d3b'),
(178, 13, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:46', '2024-05-27 14:03:46', '7048ccc5-f1e9-4a43-9d82-5446468bcb71'),
(179, 15, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '907be74b-4bf6-4d7a-92dd-d07b4196e49b'),
(180, 17, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '0d7e3d78-c20f-48ec-a010-03826b56a852'),
(181, 23, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '45fdabb9-23d2-41d4-a3be-57d8b3e77860'),
(182, 24, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '67d6f655-48ea-49f5-b14c-1561a008f956'),
(183, 26, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '152a5be1-d75e-42d0-9a07-3a9deeffeda2'),
(184, 28, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', 'd82e24b4-f4cc-4b6f-ba7e-087a4ec9bd97'),
(185, 30, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', 'b119daee-40b9-4289-a2eb-a98e507bbe3a'),
(186, 32, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '5fa741a5-2ec6-449c-b8fd-544e0183c8ed'),
(187, 35, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', 'fa1371bb-e84b-497e-ba4c-eb974fae5f4b'),
(188, 37, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', 'a4ae1980-dffa-4e18-aa13-92b4ca6804bf'),
(189, 39, 3, 'Startpagina', 'startpagina', '__home__', NULL, 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '2606fa2e-569a-457e-bc85-42f7fa9137c9'),
(190, 41, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', 'e007d04f-aaf7-4479-8a7c-316b3ee5e5ae'),
(191, 42, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', '92b518c9-918c-4901-9655-9e44b6c86a0c'),
(192, 43, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-05-27 14:03:47', '2024-05-27 14:03:47', 'c6b5cf7f-254e-4469-94d9-ee64cadf1fb8'),
(193, 46, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:48', '2024-05-27 14:03:48', 'e34e255b-5fca-461f-b1af-52da7e18da0d'),
(194, 48, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:48', '2024-05-27 14:03:48', '59a60311-4968-432f-b631-963b85b6e4cf'),
(195, 50, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:48', '2024-05-27 14:03:48', '76db407b-e34a-4f55-93d2-de94995a912b'),
(196, 76, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:48', '2024-05-27 14:03:48', '43151b07-202b-4144-a15e-62f0609ba830'),
(197, 78, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:03:48', '2024-05-27 14:03:48', '0e299c15-4049-4f23-9ffa-33c4ba970688'),
(203, 51, 3, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '03d72877-49a0-4a86-8f0a-4ba016f8ed5b'),
(204, 63, 3, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '17711013-5a43-4eec-81be-6f39fa8c4352'),
(205, 64, 3, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '13acc62e-e6d8-498b-9b09-6524e22f376c'),
(206, 65, 3, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '7e2550db-9954-4a39-b2a4-4b1d1e596f0d'),
(207, 66, 3, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', 'ce6118c9-9a02-4bac-b1cc-26847fa698a2'),
(208, 67, 3, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '3dcc8f62-e376-426a-9bc0-582f63964d85'),
(209, 68, 3, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '118e3190-cf73-4609-8c86-9adfc00f02ed'),
(210, 69, 3, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', 'aa024172-da75-4dee-a396-ae63ea169a29'),
(211, 70, 3, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', '607eb424-3e9b-4903-89ce-ba073ca269c4'),
(212, 71, 3, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-27 14:05:47', '2024-05-27 14:05:47', 'e88aa33e-9782-4dc8-85eb-6b82b4e2c5f7'),
(213, 72, 3, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '297611c8-55b1-45b2-a820-6c096fd31fd7'),
(214, 73, 3, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'd7862818-1269-436d-939a-a183158cb591'),
(215, 74, 3, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '702c0bbb-433f-4cef-98f0-ea08dc860c8b'),
(216, 83, 3, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'e4a27d48-bc61-47e2-873f-ad14b0e97618'),
(217, 87, 3, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'b7824f9d-f8c8-4ac2-bbc7-2f5e5a7b98f7'),
(218, 91, 3, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '3ba2471b-98b9-4d86-8a12-49e74e05c28b'),
(219, 95, 3, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'b1512674-c494-4a2b-9c87-bb7609af6de7'),
(220, 99, 3, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '840462d5-03f7-4bb7-b6e8-ec14f9a6159d'),
(221, 101, 3, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '34be08e5-f276-4d0f-aea5-7a54567ef58e'),
(222, 109, 3, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'a3c787a9-03f0-4668-90f3-e758b415ac9c'),
(223, 122, 3, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '5c2af591-6de9-4bd7-8b91-9c78fe6a5470'),
(224, 126, 3, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'f54c8f51-c58d-4500-852c-3073237f6759'),
(225, 127, 3, 'Yeezy Boost 700 - Hi-Res Blue', 'yeezy-boost-700-hi-res-blue', 'our-sneakers/yeezy-boost-700-hi-res-blue', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"30000\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '0a97841b-838d-4fa1-bfdb-cdc533e694fa'),
(226, 129, 3, 'Off-White X Air Force 1 Low - Brooklyn', 'off-white-x-air-force-1-low-brooklyn', 'our-sneakers/off-white-x-air-force-1-low-brooklyn', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"132500\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', 'e1a929d3-00ea-4b5a-8037-2b255c5e8746'),
(227, 131, 3, 'Air Jordan 4 Retro SE - Black Canvas', 'air-jordan-4-retro-se-black-canvas', 'our-sneakers/air-jordan-4-retro-se-black-canvas', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"28000\"}', 1, '2024-05-27 14:05:48', '2024-05-27 14:05:48', '588fdb2c-89ff-4be1-a149-8e4148c262df'),
(228, 133, 3, 'Wtaps X Authentic Syndicate - Wings', 'wtaps-x-authentic-syndicate-wings', 'our-sneakers/wtaps-x-authentic-syndicate-wings', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"12500\"}', 1, '2024-05-27 14:05:49', '2024-05-27 14:05:49', '2fbc17bd-756f-44c8-be89-160f0286931a'),
(229, 135, 3, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-27 14:05:49', '2024-05-27 14:05:49', 'ced7f57d-912a-40e2-83ff-74f3bdd3b2e1'),
(230, 136, 3, 'Undefeated X Zoom Kobe 1 ProTro - White Gum', 'undefeated-x-zoom-kobe-1-protro-white-gum', 'our-sneakers/undefeated-x-zoom-kobe-1-protro-white-gum', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"62500\"}', 1, '2024-05-27 14:05:49', '2024-05-27 14:05:49', '5c01665c-99a1-479c-b866-de4f2b75ded3'),
(231, 148, 3, 'Air Jordan 4 Retro - Red Thunder', 'air-jordan-4-retro-red-thunder', 'our-sneakers/air-jordan-4-retro-red-thunder', '{\"3c156b75-7eae-46c3-a9a3-092f4782f697\": \"36000\"}', 1, '2024-05-27 14:05:49', '2024-05-27 14:05:49', 'a1c5bd3d-e942-4ec4-be4b-54704ec40e1f'),
(232, 150, 3, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is voorbeeld tekst</p>\"}', 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', '71df15f1-ca8e-497b-9df3-ddc67fd8377e'),
(233, 150, 1, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is voorbeeld tekst</p>\"}', 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', 'eb198c51-f99d-44ba-b2f5-8c4569b40d48'),
(234, 151, 3, 'Afbeelding', 'afbeelding', NULL, NULL, 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', '56ec1d0b-930f-409c-abed-1226d6da5042'),
(235, 151, 1, 'Afbeelding', 'afbeelding', NULL, NULL, 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', '0e029e46-84aa-41f4-b8b0-1b2604b9263c'),
(236, 152, 3, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is uitleg over de afbeelding</p>\"}', 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', '7b9fdb08-41b1-4d8a-a2dd-7d23a944500e'),
(237, 152, 1, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is uitleg over de afbeelding</p>\"}', 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', 'af592164-682d-4fec-9afe-fff141964053'),
(238, 153, 3, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is tweede voorbeeldtekst</p>\"}', 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', '7b0da787-be1f-457b-8e24-b4c4d1b98e1b'),
(239, 153, 1, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is tweede voorbeeldtekst</p>\"}', 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', '1987b83d-e273-4a7b-95dd-26210e90bbd2'),
(240, 154, 3, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welcome\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', '6618fbe6-6fcd-4cd5-b89c-158765975580'),
(241, 154, 1, 'Startpagina', 'startpagina', '__home__', '{\"4e11705e-3e24-48cc-a796-30b6730d034a\": \"Find your preferred sneakers now\", \"a0eaa605-7549-4b6f-85a5-6387131a3c52\": \"Welkom\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'a50677c0-41aa-4e99-a764-1bf32cd96640'),
(242, 155, 3, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is voorbeeld tekst</p>\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'dbd30265-118b-4cce-a9b5-044c69f0cd45'),
(243, 155, 1, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is voorbeeld tekst</p>\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', '7aed0ceb-d444-4dac-b08d-a040a3217fc9'),
(244, 156, 3, 'Afbeelding', 'afbeelding', NULL, NULL, 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'b2d7c167-47db-4980-a788-093979f230de'),
(245, 156, 1, 'Afbeelding', 'afbeelding', NULL, NULL, 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'dfdcb708-9d54-46c5-a546-163de1b7c0d9'),
(246, 157, 3, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is uitleg over de afbeelding</p>\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'f72ccfea-826e-4f1e-a072-3bb352d3b397'),
(247, 157, 1, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is uitleg over de afbeelding</p>\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'daf6165d-c3bf-435e-b299-c6fa3f90dbf7'),
(248, 158, 3, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is tweede voorbeeldtekst</p>\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', '5c97284e-1721-4e9c-8010-9a48c447ae0c'),
(249, 158, 1, 'Tekst', 'tekst', NULL, '{\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\": \"<p>Dit is tweede voorbeeldtekst</p>\"}', 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'b6417e70-bde2-4564-a49c-a9b9a93c6bcc'),
(250, 159, 1, NULL, NULL, NULL, NULL, 1, '2024-05-28 07:03:45', '2024-05-28 07:03:45', 'e1a6a29f-71d3-49b2-985f-0664cfd85bed'),
(251, 160, 1, 'Login', 'login', 'login', NULL, 1, '2024-05-28 07:08:28', '2024-05-28 07:08:28', '5f5b617d-e641-47e4-aba2-84ea2577f001'),
(252, 160, 3, 'Login', 'login', 'login', NULL, 1, '2024-05-28 07:08:28', '2024-05-28 07:08:28', '81671578-a26a-4151-b1fd-bd75a2d998a5'),
(253, 161, 1, 'Login', 'login', 'login', NULL, 1, '2024-05-28 07:08:28', '2024-05-28 07:08:28', 'e8227e38-73c3-492e-8dd4-6912623af97a'),
(254, 161, 3, 'Login', 'login', 'login', NULL, 1, '2024-05-28 07:08:28', '2024-05-28 07:08:28', '4b1cf24b-d278-40e9-8ac5-a20c0dd3812e');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
CREATE TABLE IF NOT EXISTS `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bfnmhuzvmyedurcftoaubiwigydrkqypylkv` (`postDate`),
  KEY `idx_joettyyddltptvdybzprcpsxdzioqskkhirx` (`expiryDate`),
  KEY `idx_dodtbsmzqhhobuithynzggrkopafwcnzllhh` (`sectionId`),
  KEY `idx_prtovwsskvnjbpdsgerhmnswvamuczepwtrl` (`typeId`),
  KEY `idx_pojdpypcescspfjfjkzhxkeefhuejwgzyjew` (`primaryOwnerId`),
  KEY `idx_ewnbhszdrneoifghjomrbgithotyyjiyagza` (`fieldId`),
  KEY `fk_ofsqmnpsnsaunwuxruajazkazygscywasfen` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `primaryOwnerId`, `fieldId`, `typeId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`) VALUES
(2, 1, NULL, NULL, NULL, 1, '2024-04-16 07:08:00', NULL, NULL, '2024-04-16 07:08:41', '2024-04-16 07:08:51'),
(3, 1, NULL, NULL, NULL, 1, '2024-04-16 07:08:00', NULL, NULL, '2024-04-16 07:08:51', '2024-04-16 07:08:51'),
(4, 2, NULL, NULL, NULL, 2, '2024-04-22 07:38:00', NULL, NULL, '2024-04-22 07:38:07', '2024-04-22 07:38:07'),
(5, 2, NULL, NULL, NULL, 2, '2024-04-22 07:38:00', NULL, NULL, '2024-04-22 07:38:07', '2024-04-22 07:38:07'),
(6, 3, NULL, NULL, NULL, 3, '2024-04-22 12:05:00', NULL, 1, '2024-04-22 12:05:02', '2024-04-22 12:05:02'),
(7, 3, NULL, NULL, NULL, 3, '2024-04-22 12:05:00', NULL, NULL, '2024-04-22 12:05:02', '2024-04-22 12:05:02'),
(8, 3, NULL, NULL, NULL, 3, '2024-04-22 12:05:00', NULL, NULL, '2024-04-22 12:06:34', '2024-04-22 12:06:34'),
(10, 3, NULL, NULL, NULL, 3, '2024-04-22 12:05:00', NULL, NULL, '2024-04-22 12:06:58', '2024-04-22 12:06:58'),
(11, 3, NULL, NULL, NULL, 3, '2024-04-22 12:05:00', NULL, NULL, '2024-04-22 12:15:11', '2024-04-22 12:15:11'),
(12, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-22 14:45:20', '2024-04-22 14:45:20'),
(13, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-22 14:45:20', '2024-04-22 14:45:20'),
(15, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-22 14:57:22', '2024-04-22 14:57:22'),
(17, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-22 15:05:41', '2024-04-22 15:05:41'),
(23, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 12:27:19', '2024-04-29 12:27:19'),
(24, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 12:27:24', '2024-04-29 12:27:24'),
(26, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 12:36:09', '2024-04-29 12:36:09'),
(28, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 12:38:24', '2024-04-29 12:38:24'),
(30, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 12:39:59', '2024-04-29 12:39:59'),
(32, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 12:42:29', '2024-04-29 12:42:29'),
(35, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 13:18:16', '2024-04-29 13:18:16'),
(37, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 14:05:21', '2024-04-29 14:05:21'),
(39, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 14:05:37', '2024-04-29 14:05:37'),
(41, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 14:15:31', '2024-04-29 14:15:31'),
(42, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 14:19:55', '2024-04-29 14:19:55'),
(43, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 14:20:58', '2024-04-29 14:20:58'),
(46, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 14:59:53', '2024-04-29 14:59:53'),
(48, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 15:11:19', '2024-04-29 15:11:19'),
(50, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-04-29 15:13:27', '2024-04-29 15:13:27'),
(51, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-06 07:21:38', '2024-05-06 07:24:11'),
(63, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-06 07:24:11', '2024-05-06 07:24:11'),
(64, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-06 07:24:14', '2024-05-06 07:24:34'),
(65, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-06 07:24:34', '2024-05-06 07:24:34'),
(66, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-06 07:24:37', '2024-05-06 07:24:58'),
(67, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-06 07:24:58', '2024-05-06 07:24:58'),
(68, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-06 07:25:02', '2024-05-06 07:25:26'),
(69, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-06 07:25:26', '2024-05-06 07:25:26'),
(70, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-06 07:25:28', '2024-05-06 07:25:50'),
(71, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-06 07:25:50', '2024-05-06 07:25:50'),
(72, 6, NULL, NULL, NULL, 6, '2024-05-06 07:26:00', NULL, NULL, '2024-05-06 07:25:53', '2024-05-06 07:26:09'),
(73, 6, NULL, NULL, NULL, 6, '2024-05-06 07:26:00', NULL, NULL, '2024-05-06 07:26:09', '2024-05-06 07:26:09'),
(74, 6, NULL, NULL, NULL, 6, '2024-05-06 07:26:00', NULL, NULL, '2024-05-06 07:26:11', '2024-05-06 07:26:11'),
(76, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-05-06 13:01:02', '2024-05-06 13:01:02'),
(78, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-05-06 13:03:39', '2024-05-06 13:03:39'),
(80, 7, NULL, NULL, NULL, 7, '2024-05-13 06:17:00', NULL, 1, '2024-05-13 06:17:14', '2024-05-13 06:17:24'),
(81, 7, NULL, NULL, NULL, 7, '2024-05-13 06:17:00', NULL, NULL, '2024-05-13 06:17:24', '2024-05-13 06:17:24'),
(83, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 06:17:29', '2024-05-13 06:17:29'),
(84, 7, NULL, NULL, NULL, 7, '2024-05-13 06:17:00', NULL, 1, '2024-05-13 06:17:39', '2024-05-13 06:17:50'),
(85, 7, NULL, NULL, NULL, 7, '2024-05-13 06:17:00', NULL, NULL, '2024-05-13 06:17:50', '2024-05-13 06:17:50'),
(87, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 06:17:56', '2024-05-13 06:17:56'),
(88, 7, NULL, NULL, NULL, 7, '2024-05-13 06:18:00', NULL, 1, '2024-05-13 06:18:05', '2024-05-13 06:18:11'),
(89, 7, NULL, NULL, NULL, 7, '2024-05-13 06:18:00', NULL, NULL, '2024-05-13 06:18:11', '2024-05-13 06:18:11'),
(91, 6, NULL, NULL, NULL, 6, '2024-05-06 07:26:00', NULL, NULL, '2024-05-13 06:18:16', '2024-05-13 06:18:16'),
(92, 7, NULL, NULL, NULL, 7, '2024-05-13 06:18:00', NULL, 1, '2024-05-13 06:18:33', '2024-05-13 06:18:39'),
(93, 7, NULL, NULL, NULL, 7, '2024-05-13 06:18:00', NULL, NULL, '2024-05-13 06:18:40', '2024-05-13 06:18:40'),
(95, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 06:18:45', '2024-05-13 06:18:45'),
(96, 7, NULL, NULL, NULL, 7, '2024-05-13 06:19:00', NULL, 1, '2024-05-13 06:19:01', '2024-05-13 06:19:13'),
(97, 7, NULL, NULL, NULL, 7, '2024-05-13 06:19:00', NULL, NULL, '2024-05-13 06:19:13', '2024-05-13 06:19:13'),
(99, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 06:19:23', '2024-05-13 06:19:23'),
(101, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 06:19:42', '2024-05-13 06:19:42'),
(102, 8, NULL, NULL, NULL, 8, '2024-05-13 06:25:00', NULL, 1, '2024-05-13 06:25:59', '2024-05-13 06:25:59'),
(103, 8, NULL, NULL, NULL, 8, '2024-05-13 06:25:00', NULL, NULL, '2024-05-13 06:25:59', '2024-05-13 06:25:59'),
(109, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 07:59:56', '2024-05-13 07:59:56'),
(113, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:12', '2024-05-13 12:11:17'),
(114, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:17', '2024-05-13 12:11:17'),
(115, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:19', '2024-05-13 12:11:22'),
(116, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:22', '2024-05-13 12:11:22'),
(117, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:23', '2024-05-13 12:11:26'),
(118, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:26', '2024-05-13 12:11:26'),
(119, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:28', '2024-05-13 12:11:32'),
(120, 9, NULL, NULL, NULL, 11, '2024-05-13 12:11:00', NULL, NULL, '2024-05-13 12:11:32', '2024-05-13 12:11:32'),
(122, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 12:11:59', '2024-05-13 12:11:59'),
(123, 9, NULL, NULL, NULL, 11, '2024-05-13 12:12:00', NULL, NULL, '2024-05-13 12:12:05', '2024-05-13 12:12:10'),
(124, 9, NULL, NULL, NULL, 11, '2024-05-13 12:12:00', NULL, NULL, '2024-05-13 12:12:10', '2024-05-13 12:12:10'),
(126, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 12:12:27', '2024-05-13 12:12:27'),
(127, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 12:12:29', '2024-05-13 12:12:29'),
(129, 6, NULL, NULL, NULL, 6, '2024-05-06 07:26:00', NULL, NULL, '2024-05-13 12:12:40', '2024-05-13 12:12:40'),
(131, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 12:12:50', '2024-05-13 12:12:50'),
(133, 6, NULL, NULL, NULL, 6, '2024-05-06 07:24:00', NULL, NULL, '2024-05-13 12:12:59', '2024-05-13 12:12:59'),
(135, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 12:13:09', '2024-05-13 12:13:09'),
(136, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 12:35:57', '2024-05-13 12:35:57'),
(137, 10, NULL, NULL, NULL, 12, '2024-05-13 12:45:00', NULL, NULL, '2024-05-13 12:45:58', '2024-05-13 12:45:58'),
(138, 10, NULL, NULL, NULL, 12, '2024-05-13 12:45:00', NULL, NULL, '2024-05-13 12:45:58', '2024-05-13 12:45:58'),
(145, 9, NULL, NULL, NULL, 11, '2024-05-13 14:43:00', NULL, NULL, '2024-05-13 14:43:25', '2024-05-13 14:43:45'),
(146, 9, NULL, NULL, NULL, 11, '2024-05-13 14:43:00', NULL, NULL, '2024-05-13 14:43:45', '2024-05-13 14:43:45'),
(148, 6, NULL, NULL, NULL, 6, '2024-05-06 07:25:00', NULL, NULL, '2024-05-13 15:30:09', '2024-05-13 15:30:09'),
(149, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-05-27 14:03:45', '2024-05-27 14:03:45'),
(150, NULL, NULL, 12, 17, 13, '2024-05-13 13:23:00', NULL, NULL, '2024-05-27 14:07:55', '2024-05-27 14:07:55'),
(151, NULL, NULL, 12, 17, 14, '2024-05-13 13:24:00', NULL, NULL, '2024-05-27 14:07:55', '2024-05-27 14:07:55'),
(152, NULL, NULL, 12, 17, 13, '2024-05-13 13:24:00', NULL, NULL, '2024-05-27 14:07:55', '2024-05-27 14:07:55'),
(153, NULL, NULL, 12, 17, 13, '2024-05-13 13:23:00', NULL, NULL, '2024-05-27 14:07:55', '2024-05-27 14:07:55'),
(154, 4, NULL, NULL, NULL, 4, '2024-04-22 14:45:00', NULL, NULL, '2024-05-27 14:07:56', '2024-05-27 14:07:56'),
(155, NULL, NULL, 154, 17, 13, '2024-05-13 13:23:00', NULL, NULL, '2024-05-27 14:07:56', '2024-05-27 14:07:56'),
(156, NULL, NULL, 154, 17, 14, '2024-05-13 13:24:00', NULL, NULL, '2024-05-27 14:07:56', '2024-05-27 14:07:56'),
(157, NULL, NULL, 154, 17, 13, '2024-05-13 13:24:00', NULL, NULL, '2024-05-27 14:07:56', '2024-05-27 14:07:56'),
(158, NULL, NULL, 154, 17, 13, '2024-05-13 13:23:00', NULL, NULL, '2024-05-27 14:07:56', '2024-05-27 14:07:56'),
(160, 11, NULL, NULL, NULL, 15, '2024-05-28 07:08:00', NULL, NULL, '2024-05-28 07:08:28', '2024-05-28 07:08:28'),
(161, 11, NULL, NULL, NULL, 15, '2024-05-28 07:08:00', NULL, NULL, '2024-05-28 07:08:28', '2024-05-28 07:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
CREATE TABLE IF NOT EXISTS `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_uaygsbbejqasmktpuwaxfgiaxuyrixwojnjo` (`authorId`),
  KEY `idx_ictawuzzjxeqadbvccfympucybsdwivlqarb` (`entryId`,`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `entries_authors`
--

INSERT INTO `entries_authors` (`entryId`, `authorId`, `sortOrder`) VALUES
(2, 159, 1),
(3, 159, 1),
(51, 159, 1),
(63, 159, 1),
(64, 159, 1),
(65, 159, 1),
(66, 159, 1),
(67, 159, 1),
(68, 159, 1),
(69, 159, 1),
(70, 159, 1),
(71, 159, 1),
(72, 159, 1),
(73, 159, 1),
(74, 159, 1),
(80, 159, 1),
(81, 159, 1),
(83, 159, 1),
(84, 159, 1),
(85, 159, 1),
(87, 159, 1),
(88, 159, 1),
(89, 159, 1),
(91, 159, 1),
(92, 159, 1),
(93, 159, 1),
(95, 159, 1),
(96, 159, 1),
(97, 159, 1),
(99, 159, 1),
(101, 159, 1),
(109, 159, 1),
(113, 159, 1),
(114, 159, 1),
(115, 159, 1),
(116, 159, 1),
(117, 159, 1),
(118, 159, 1),
(119, 159, 1),
(120, 159, 1),
(122, 159, 1),
(123, 159, 1),
(124, 159, 1),
(126, 159, 1),
(127, 159, 1),
(129, 159, 1),
(131, 159, 1),
(133, 159, 1),
(135, 159, 1),
(136, 159, 1),
(145, 159, 1),
(146, 159, 1),
(148, 159, 1);

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE IF NOT EXISTS `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jfbyhlrbilbzxiahymiqdtiucovkzofzbeyf` (`fieldLayoutId`),
  KEY `idx_wpqgkyevzdbamxclsqodmmsqqwkauhtxyqxv` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `fieldLayoutId`, `name`, `handle`, `icon`, `color`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `showSlugField`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'Nieuws', 'news', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-04-16 07:08:28', '2024-04-16 07:08:28', '2024-04-22 07:43:16', '84261a35-32d8-4bb3-bc38-b9a2e60303b1'),
(2, 2, 'Startpagina', 'home', 'house', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-04-22 07:38:01', '2024-04-22 07:38:01', '2024-04-22 09:24:04', '677d5d65-c932-4474-a87f-9cbdcc093755'),
(3, 3, 'Startpagina', 'home', 'house', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-04-22 12:04:55', '2024-04-22 12:04:55', '2024-04-22 13:45:41', '3f8f9937-07d3-4eae-99a1-f17822c310e2'),
(4, 4, 'Startpagina', 'home', 'house', 'pink', 0, 'site', NULL, '{{\"Startpagina\"}}', 0, 'site', NULL, 1, '2024-04-22 14:45:09', '2024-04-29 14:14:53', NULL, '572daa2f-bca0-46ac-8c9f-8eb5a784b77b'),
(5, 5, 'Nieuws', 'news', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-04-23 10:10:49', '2024-04-23 10:10:49', '2024-04-29 12:30:19', 'fb133677-bc4b-4788-ba00-57466d63b8bc'),
(6, 9, 'Sneakers', 'sneakers', '', NULL, 1, 'site', '', '', 1, 'site', '', 1, '2024-05-06 07:20:40', '2024-06-04 14:42:46', NULL, '0b825ca4-12cd-464d-a5f3-dd500a0c4723'),
(7, 11, 'Kleuren', 'colors', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-05-13 06:14:43', '2024-05-13 06:14:43', '2024-05-13 08:25:46', '4947970e-acc8-4502-a8c6-21794ab7ad44'),
(8, 12, 'Sneakers Overzicht', 'sneakersOverview', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-05-13 06:25:53', '2024-05-13 06:25:53', '2024-05-13 08:25:58', 'db2f0536-7953-4242-945c-e0a21cc3cb31'),
(9, 13, 'Tekst', 'text', '', NULL, 0, 'site', NULL, 'Tekst blok', 1, 'site', NULL, 1, '2024-05-13 07:47:56', '2024-05-13 07:47:56', '2024-05-13 08:25:54', 'a5b5e0be-dd5e-499a-9433-f561b687333f'),
(10, 14, 'Afbeelding', 'image', '', NULL, 0, 'site', NULL, 'Afbeelding blok', 1, 'site', NULL, 1, '2024-05-13 07:48:24', '2024-05-13 07:48:24', '2024-05-13 08:25:50', '3ae3ec24-489f-4a65-aced-926464db5391'),
(11, 16, 'Kleuren', 'colors', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-05-13 12:10:35', '2024-05-13 12:10:35', NULL, '0a8db0da-994f-4d07-9d6d-2df01713c777'),
(12, 17, 'Sneakers Overzicht', 'SneakersOverview', '', NULL, 1, 'site', NULL, '', 1, 'site', NULL, 1, '2024-05-13 12:44:13', '2024-05-13 12:44:13', NULL, '30517588-522b-4a74-8ca8-4a2b121d31dc'),
(13, 18, 'Tekst', 'tekst', '', NULL, 0, 'site', NULL, 'Tekst', 1, 'site', NULL, 1, '2024-05-13 13:22:26', '2024-05-13 13:22:26', NULL, 'b1ef33e9-9a2c-4970-a081-ca08f9c28190'),
(14, 19, 'Afbeelding', 'afbeelding', '', NULL, 0, 'site', NULL, 'Afbeelding', 1, 'site', NULL, 1, '2024-05-13 13:22:43', '2024-05-13 13:22:43', NULL, 'd1432e2e-47d7-4e76-aeec-da4fec2d3742'),
(15, 21, 'Login', 'login', '', NULL, 1, 'site', '', '', 0, 'site', '', 1, '2024-05-28 07:08:26', '2024-05-28 07:08:26', NULL, 'a3e889f2-5ec0-4d28-879e-e83f828dab2f');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE IF NOT EXISTS `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gzbunyuwkcaxzyoqutsetrkhobjpvnajmwrj` (`dateDeleted`),
  KEY `idx_pbmppsmfymricfszdebtjxufsymyegypexxi` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `config`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"f2f65c74-0860-49bf-ad07-73dcfddc0a47\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"97064c50-5cce-4c90-9485-7b3306d8ebe0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-16 07:08:28', '2024-04-16 07:08:28', '2024-04-22 07:43:16', '17ac25c2-a7a8-40e6-98d4-2d0d861bfc63'),
(2, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"cc3dd6e1-d2c2-402c-8931-636bbb11e0cb\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"2dc45b6f-812b-47d9-903c-f675fbfbde4c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"daec41d5-2192-43a3-b231-fa6673ac522b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"f44aa71a-6ed4-4e23-957b-7057ce3b7e58\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-22 07:38:01', '2024-04-22 07:43:11', '2024-04-22 09:24:04', '1996bd6b-db1a-4499-92c6-a28ca44e40e8'),
(3, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"4d89c786-b38f-48f3-93e6-e5aa021deb38\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4cd0d780-f86d-4551-997e-1fd32ea59964\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"bac770cb-880b-4bb0-9d92-7e81c3d85e06\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"010e369f-dc86-4b83-8403-b429459f17c6\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-22 12:04:55', '2024-04-22 12:14:21', '2024-04-22 13:45:41', 'a1039bd3-6b0d-4251-b70a-d6b66518adfb'),
(4, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"39f09732-54ea-46ae-b7e9-74ae28b004fe\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"8714394b-b8f8-45be-8d5f-4cb9d4fa9018\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"13c3d1b1-41f0-4dbb-b1b0-5f796ef8f49b\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Hero \", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a0eaa605-7549-4b6f-85a5-6387131a3c52\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"c37718a4-2455-456a-a28a-4ab755d1ddb3\", \"required\": true, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"4e11705e-3e24-48cc-a796-30b6730d034a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Ondertitel\", \"width\": 50, \"handle\": \"subTitle\", \"warning\": null, \"fieldUid\": \"c37718a4-2455-456a-a28a-4ab755d1ddb3\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"c588d941-2b45-40c1-917e-8160ff829285\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"9835d417-75ec-4190-a8a2-fb5eeabb0ec4\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"51686f2b-6bc3-4a0b-8dbd-7c3a6a445a0c\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"d51ac987-38e2-4d55-85e6-f575b5af4fb5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"19bd82cb-9c2e-41eb-838f-087a2d144ff3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3d056b00-f42d-47e4-bc30-e14f28ac55da\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-22 14:45:09', '2024-05-13 13:23:07', NULL, 'd5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53'),
(5, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"c3aaa894-19ed-475c-9693-96c5f952e7ff\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"96ee23c6-c5c4-414f-82e0-9aea7addda23\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"ee91ab86-cb8d-4b85-a07e-61806042e2b8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"70603117-869a-42d8-9fb4-32fce3f4ce3e\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-23 10:10:49', '2024-04-23 10:10:49', '2024-04-29 12:30:19', 'd3f74ae4-a7b1-4e83-9777-54d0ceffada0'),
(6, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"cce7a526-4883-44fa-8973-eb84d9339c49\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"e6bef74f-aad3-4e87-9dd1-fea15810f3ae\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-29 08:32:01', '2024-04-29 08:41:02', '2024-04-29 08:43:27', 'e99827d3-1d1f-4836-9b8c-c12048fa49a4'),
(7, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"b4585cb2-e207-4498-a8c9-d0d49bbb9e7d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"008e9067-73a1-4fc3-86ef-6edc478a9924\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-29 13:10:07', '2024-04-29 13:10:07', '2024-04-29 13:46:34', '6248f154-35bd-4f64-bdb4-029160d5dc54'),
(8, 'craft\\elements\\Asset', '{\"tabs\": [{\"uid\": \"3d0c6ec7-d326-4b2e-9bc6-57892d9db266\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"46b86a5e-2a4e-4d68-ad07-e678d16f71b9\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-04-29 14:40:11', '2024-04-29 14:40:11', NULL, 'a874318a-641b-4157-af21-9659c00843a4'),
(9, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"bde21532-8ac5-44fa-812a-e10b75cb5416\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"1632b3d3-75ba-42d0-bd7a-c8514ace73ba\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"3c156b75-7eae-46c3-a9a3-092f4782f697\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"fd445757-8cfd-45f7-9b1a-65a583956b73\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"64baa63c-9dad-4b86-b384-fc9e3e53fab6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"770ce4a3-7ca8-4558-b014-479fcb4ddb5e\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"cd4d4642-d8f2-4d23-b38f-c23df3512f01\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"b1818203-9eff-4584-9ea3-c39aab4fb3f0\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"158e547b-6539-4723-be1a-e52c94bc680e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"519de1f8-b162-4b04-8923-fb072747ba56\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"318bda92-6b2c-4675-9096-2bbb51334787\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3d056b00-f42d-47e4-bc30-e14f28ac55da\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-06 07:20:40', '2024-06-04 14:42:46', NULL, 'c356ccf0-cd66-4b82-84dc-6501f751879c'),
(10, 'craft\\elements\\GlobalSet', '{\"tabs\": [{\"uid\": \"5a762927-9b2d-4ab4-8b48-c4611e0d88d0\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"7e5129a3-08c6-4491-98bd-5ae8e65c5004\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"3c7134eb-3d90-4e09-a1a5-bae1b3329ddb\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 06:02:53', '2024-05-13 06:02:53', '2024-05-13 06:13:01', 'fa6025d3-aa03-406b-bdd6-04927c236b7b'),
(11, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"1e51af03-e676-40d7-9b0b-8be8fd36cf5d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"658f0271-1efa-4583-9bef-018b0f506cae\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Naam kleur\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 06:14:43', '2024-05-13 06:14:43', '2024-05-13 08:25:46', 'e1a4e66a-0483-47ce-9c21-384992cfa63f'),
(12, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"496907f7-ba8c-44ca-a8b7-31bf6b89dabe\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"1b836144-91cd-4672-9fb1-24d9fbddce08\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 06:25:53', '2024-05-13 06:25:53', '2024-05-13 08:25:58', '92d5c1c6-2b28-47d1-91f9-758cc51e8035'),
(13, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"110258ac-eb8b-4399-ac8e-796bd3fc3585\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"16187da4-3696-429a-87a4-4270bf7fbb6c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"6eb78967-2c59-4736-b63f-620956657214\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"519de1f8-b162-4b04-8923-fb072747ba56\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 07:47:56', '2024-05-13 07:47:56', '2024-05-13 08:25:54', 'b7769839-8d6a-4123-9d63-0cc828dd0c12'),
(14, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"83ffcee3-2b21-41ec-a102-d88adecc0b4c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"829b41cf-7398-4d7d-8151-4763c81291e3\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4ac68250-f46b-470f-9fc0-d62cdd9f9c87\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"770ce4a3-7ca8-4558-b014-479fcb4ddb5e\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 07:48:24', '2024-05-13 07:48:24', '2024-05-13 08:25:50', '0cec85b7-338c-46b3-806c-35314a06c821'),
(15, 'craft\\elements\\GlobalSet', '{\"tabs\": [{\"uid\": \"d9882811-c52e-4c02-975f-bde6de37aeea\", \"name\": \"Sociale Media URL\'s\", \"elements\": [{\"tip\": null, \"uid\": \"4872269a-6992-4dea-849b-7837b1b12ab8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"67765763-385a-42f9-a6d9-e39876a64542\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 11:52:54', '2024-05-13 11:52:54', '2024-05-13 13:58:14', '88277faa-953c-4ce5-95ac-b69bca0d1b03'),
(16, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"fb702384-aba6-4214-9985-dec493dd9881\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"6cb19993-4b8e-47fc-8a89-4d4863f7e388\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Kleur\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 12:10:35', '2024-05-13 12:10:35', NULL, '0d665ce8-9a01-4798-bacb-f95c2a2c3280'),
(17, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"5ddc1267-afd2-4195-8064-3477371ac127\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0823564a-bfcd-40d7-88b7-f21902e8f333\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 12:44:13', '2024-05-13 12:44:13', NULL, '594463ef-a986-46ed-870b-22251a062491'),
(18, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"d30cea72-cb3a-4799-a414-ff024be9b6b7\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"328e9e1d-c93c-4c76-ba80-031723be8e02\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"519de1f8-b162-4b04-8923-fb072747ba56\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 13:22:26', '2024-05-13 13:22:26', NULL, '9218b2db-8dd2-4e2f-a916-1b2ffd841433'),
(19, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"e6d5d557-a4cd-4eac-b30e-ba9ded9842a9\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"6db31b95-4ab3-4056-a847-766eef74e095\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"b964b4bb-64a0-4b2d-8c7e-e8ccc0513eae\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"770ce4a3-7ca8-4558-b014-479fcb4ddb5e\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 13:22:43', '2024-05-13 13:22:43', NULL, 'babe92de-3989-4220-8357-f7d89d3ba60d'),
(20, 'craft\\elements\\GlobalSet', '{\"tabs\": [{\"uid\": \"52344357-f5c2-4cee-84e5-16af9209f291\", \"name\": \"Sociale Media URL\'s\", \"elements\": [{\"tip\": null, \"uid\": \"1a096a33-e60d-4dbc-8492-8ab6cd075d24\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"609b50fe-0974-43e3-b42c-929fd1574e5f\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-13 14:01:07', '2024-05-13 14:01:07', NULL, 'ab3eddae-cf8f-40e5-af8f-178bfd172372'),
(21, 'craft\\elements\\Entry', '{\"tabs\": [{\"uid\": \"9ebabb2f-4878-42bf-a313-961d3962e1cf\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"9eeb3a88-f54f-4e4a-8770-99130e6ba7b9\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}', '2024-05-28 07:08:26', '2024-05-28 07:08:26', NULL, 'b94e87ea-0f6e-48a5-8521-14a0330d9a54');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qzflywhxctgcbpnrlkwrpokqvvcltplzbska` (`handle`,`context`),
  KEY `idx_xtnamlhysiqrbssujdamodmgyvnwthfiwfjj` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 'Titel', 'pageTitle', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}', '2024-04-29 14:06:52', '2024-05-27 14:07:05', 'c37718a4-2455-456a-a28a-4ab755d1ddb3'),
(7, 'Hero Afbeelding', 'heroImage', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Voeg een afbeelding toe\",\"showCardsInGrid\":false,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-04-29 14:58:49', '2024-04-29 15:11:13', '9835d417-75ec-4190-a8a2-fb5eeabb0ec4'),
(8, 'Afbeelding', 'image', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Selecteer een afbeelding\",\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-05-06 07:19:51', '2024-05-06 07:19:51', '770ce4a3-7ca8-4558-b014-479fcb4ddb5e'),
(9, 'Prijs', 'price', 'global', NULL, NULL, 0, 'none', NULL, 'craft\\fields\\Money', '{\"currency\":\"EUR\",\"defaultValue\":null,\"max\":null,\"min\":0,\"showCurrency\":true,\"size\":null}', '2024-05-06 07:20:31', '2024-05-06 07:20:31', 'fd445757-8cfd-45f7-9b1a-65a583956b73'),
(10, 'Text', 'text', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\ckeditor\\Field', '{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"21d73c87-fea9-45c4-bcd7-c7bcbbc36914\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}', '2024-05-06 08:21:22', '2024-05-06 08:21:22', '519de1f8-b162-4b04-8923-fb072747ba56'),
(11, 'Sneakers', 'sneakers', 'global', NULL, NULL, 0, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":\"Selecteer een sneaker\",\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"section:dea38989-2ed2-4db7-bc89-0bd073d6c182\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}', '2024-05-06 13:00:28', '2024-05-06 13:00:28', 'fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6'),
(15, 'Instagram', 'instagram', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":255,\"types\":[\"url\"]}', '2024-05-13 11:52:45', '2024-05-13 11:52:45', '67765763-385a-42f9-a6d9-e39876a64542'),
(16, 'Kleur', 'color', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"sources\":[\"section:cdb3ab49-66fb-4582-ad6d-51195eb25204\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\",\"showCardsInGrid\":false,\"maintainHierarchy\":false,\"branchLimit\":null}', '2024-05-13 12:10:53', '2024-05-13 12:35:45', 'b1818203-9eff-4584-9ea3-c39aab4fb3f0'),
(17, 'blokken', 'blocks', 'global', NULL, NULL, 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"createButtonLabel\":null,\"entryTypes\":[\"b1ef33e9-9a2c-4970-a081-ca08f9c28190\",\"d1432e2e-47d7-4e76-aeec-da4fec2d3742\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}', '2024-05-13 13:22:48', '2024-05-13 13:22:48', '3d056b00-f42d-47e4-bc30-e14f28ac55da'),
(18, 'Facebook URL', 'facebookUrl', 'global', NULL, NULL, 1, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":255,\"types\":[\"url\"]}', '2024-05-13 14:00:43', '2024-05-13 14:00:43', '609b50fe-0974-43e3-b42c-929fd1574e5f');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE IF NOT EXISTS `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_azchjhmtsdwvgiuxljymnuskgknfqpfkhsjs` (`name`),
  KEY `idx_cvpaauhsrcudeprvypmqtpexzowvcyaixbdb` (`handle`),
  KEY `idx_kgympvjovutuvdrbipsenofqtcjcfibydgcq` (`fieldLayoutId`),
  KEY `idx_bzfgcrnmxvztczfzlaflxcsiyspuuhnuctpf` (`sortOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `globalsets`
--

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(79, 'Sociale Media', 'socialMedia', 10, 1, '2024-05-13 06:02:53', '2024-05-13 06:02:53', 'ab327619-72c0-47dd-96e8-d7d757da809e'),
(112, 'Sociale Media', 'socialeMedia', 15, 2, '2024-05-13 11:52:54', '2024-05-13 11:52:54', 'aa979011-b63c-4090-9b8e-4a9514c60428'),
(144, 'Sociale Media', 'socialeMedia', 20, 3, '2024-05-13 14:01:07', '2024-05-13 14:01:07', 'c145b76d-f1b8-4a06-8c95-70cb973425e5');

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
CREATE TABLE IF NOT EXISTS `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
CREATE TABLE IF NOT EXISTS `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ovvaqenxllrhkefosftolybsjmzvauwhdnzl` (`accessToken`),
  UNIQUE KEY `idx_gavaypkoutcyfudlfzouxgccahazpzvesrat` (`name`),
  KEY `fk_ttbqqnuqaytgclohrieasuumpywlysadmlek` (`schemaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
CREATE TABLE IF NOT EXISTS `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zmgeyokedoiywwpdmypewmtynqkljqcdzqnn` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `imagetransformindex`
--

INSERT INTO `imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(30, 45, 'craft\\imagetransforms\\ImageTransformer', 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', NULL, '_126x190_crop_center-center_none', 1, 0, 0, '2024-04-29 14:55:09', '2024-04-29 14:55:09', '2024-04-29 14:55:09', '272159e6-4154-404f-961d-13a67a1b62bb'),
(31, 45, 'craft\\imagetransforms\\ImageTransformer', 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', NULL, '_252x380_crop_center-center_none', 1, 0, 0, '2024-04-29 14:55:09', '2024-04-29 14:55:09', '2024-04-29 14:55:09', '6563686c-b9d1-4eeb-a969-cdf4365c4fa1'),
(32, 45, 'craft\\imagetransforms\\ImageTransformer', 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', NULL, '_20x30_crop_center-center_none', 1, 0, 0, '2024-04-29 14:55:09', '2024-04-29 14:55:09', '2024-04-29 14:55:09', '46a446d5-103d-477c-bbaf-6873b06e507a'),
(33, 45, 'craft\\imagetransforms\\ImageTransformer', 'andre-tan-humXycOzC00-unsplash-1-683x1024.jpg', NULL, '_40x60_crop_center-center_none', 1, 0, 0, '2024-04-29 14:55:09', '2024-04-29 14:55:09', '2024-04-29 14:55:10', 'e78f716f-b3ed-4d5d-9afe-8a502fa70c21'),
(34, 62, 'craft\\imagetransforms\\ImageTransformer', 'team.jpg', NULL, '_30x20_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:15', 'cc915bd1-2ea5-4e62-8fe4-99eaa60c2cc9'),
(35, 62, 'craft\\imagetransforms\\ImageTransformer', 'team.jpg', NULL, '_60x40_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:16', '440e98ad-3705-4c58-a61a-baa15cc343d9'),
(36, 61, 'craft\\imagetransforms\\ImageTransformer', 'nav-img-3.jpg', NULL, '_30x30_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:14', 'e5c65f07-6309-4791-8bc0-34bcb404772e'),
(37, 61, 'craft\\imagetransforms\\ImageTransformer', 'nav-img-3.jpg', NULL, '_60x60_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:17', 'b0a7c62c-8bba-45d0-8060-537f5b2aad1b'),
(38, 60, 'craft\\imagetransforms\\ImageTransformer', 'nav-img-2.jpg', NULL, '_29x30_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:16', 'c8fde03d-b6c4-45b4-81f8-62e8a06e6ae2'),
(39, 60, 'craft\\imagetransforms\\ImageTransformer', 'nav-img-2.jpg', NULL, '_59x60_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:18', '84677dc4-4730-4c79-943a-dcbb50526fcf'),
(40, 59, 'craft\\imagetransforms\\ImageTransformer', 'nav-img-1.jpg', NULL, '_29x30_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:17', '09743a95-3d87-4628-941e-a1b07d4f63fd'),
(41, 59, 'craft\\imagetransforms\\ImageTransformer', 'nav-img-1.jpg', NULL, '_59x60_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', 'a074a4b5-cdfb-403d-99a7-300bf40f91a2'),
(42, 57, 'craft\\imagetransforms\\ImageTransformer', 'gallery_5.jpg', NULL, '_30x21_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:17', 'fe4cade5-b6a8-4dc6-ae5e-7369016a76da'),
(43, 57, 'craft\\imagetransforms\\ImageTransformer', 'gallery_5.jpg', NULL, '_60x42_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', '816c4096-0e9b-4863-bd3f-c8767f75a51d'),
(44, 58, 'craft\\imagetransforms\\ImageTransformer', 'gallery_6.jpg', NULL, '_30x21_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:17', 'abf09db9-9eaa-4713-a6d6-41ebdc6c5d59'),
(45, 58, 'craft\\imagetransforms\\ImageTransformer', 'gallery_6.jpg', NULL, '_60x42_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', '6f558b89-3faf-44e1-98d1-22e53af27ca8'),
(46, 54, 'craft\\imagetransforms\\ImageTransformer', 'gallery_2.jpg', NULL, '_30x21_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:17', '7ab3a9b7-9ac5-4523-86e2-f8e275513700'),
(47, 54, 'craft\\imagetransforms\\ImageTransformer', 'gallery_2.jpg', NULL, '_60x42_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', '66938260-d27b-489b-9dce-0875e2b2d6fb'),
(48, 55, 'craft\\imagetransforms\\ImageTransformer', 'gallery_3.jpg', NULL, '_30x21_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:17', 'b03bb9ac-8ec1-411a-9faf-682156951975'),
(49, 55, 'craft\\imagetransforms\\ImageTransformer', 'gallery_3.jpg', NULL, '_60x42_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', '8248dbd7-9ca0-4908-ab58-bf51b7ed365d'),
(50, 56, 'craft\\imagetransforms\\ImageTransformer', 'gallery_4.jpg', NULL, '_30x21_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:18', '787a9b33-2973-443b-a0e5-1d6deca08e11'),
(51, 56, 'craft\\imagetransforms\\ImageTransformer', 'gallery_4.jpg', NULL, '_60x42_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', 'a330a15b-c1f4-429e-ab34-6f1ec0ea5e27'),
(52, 53, 'craft\\imagetransforms\\ImageTransformer', 'gallery_1.jpg', NULL, '_30x21_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:18', 'c3025d5b-1e92-4bf6-b0c3-84293666c38c'),
(53, 53, 'craft\\imagetransforms\\ImageTransformer', 'gallery_1.jpg', NULL, '_60x42_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:19', '367b6efd-e849-461a-be1d-8847ee6fbb77'),
(54, 52, 'craft\\imagetransforms\\ImageTransformer', 'bg.jpg', NULL, '_30x20_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:18', 'bd330fc3-fda5-44c2-84eb-eaf62a1e5ab9'),
(55, 52, 'craft\\imagetransforms\\ImageTransformer', 'bg.jpg', NULL, '_60x40_crop_center-center_none', 1, 0, 0, '2024-05-06 07:23:13', '2024-05-06 07:23:13', '2024-05-06 07:23:20', 'd812e211-e68c-4cc4-b4f0-20dcba55b990'),
(56, 55, 'craft\\imagetransforms\\ImageTransformer', 'gallery_3.jpg', NULL, '_266x190_crop_center-center_none', 1, 0, 0, '2024-05-13 06:18:54', '2024-05-13 06:18:54', '2024-05-13 06:18:55', '65f999db-a890-4706-9dfd-346edc2ddfd5'),
(57, 55, 'craft\\imagetransforms\\ImageTransformer', 'gallery_3.jpg', NULL, '_532x380_crop_center-center_none', 1, 0, 0, '2024-05-13 06:18:54', '2024-05-13 06:18:54', '2024-05-13 06:19:25', '1be72c5b-0701-412f-8b60-03350b6841cf'),
(58, 57, 'craft\\imagetransforms\\ImageTransformer', 'gallery_5.jpg', NULL, '_266x190_crop_center-center_none', 1, 0, 0, '2024-05-13 06:19:31', '2024-05-13 06:19:31', '2024-05-13 06:19:31', 'de24fe38-ac4c-4b6f-9d53-5db214b0e91e'),
(59, 57, 'craft\\imagetransforms\\ImageTransformer', 'gallery_5.jpg', NULL, '_532x380_crop_center-center_none', 1, 0, 0, '2024-05-13 06:19:31', '2024-05-13 06:19:31', '2024-05-13 06:19:44', '5cd9d863-ff31-4553-828a-8f0ccf2fc616'),
(60, 56, 'craft\\imagetransforms\\ImageTransformer', 'gallery_4.jpg', NULL, '_265x190_crop_center-center_none', 1, 0, 0, '2024-05-13 12:09:07', '2024-05-13 12:09:07', '2024-05-13 12:09:45', '58ab628a-9ce7-443e-b917-52556206ed09'),
(61, 56, 'craft\\imagetransforms\\ImageTransformer', 'gallery_4.jpg', NULL, '_530x380_crop_center-center_none', 1, 0, 0, '2024-05-13 12:09:07', '2024-05-13 12:09:07', '2024-05-13 12:09:07', 'ac71cb62-08a3-4fae-84f2-2b26e07b0909');

-- --------------------------------------------------------

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
CREATE TABLE IF NOT EXISTS `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int UNSIGNED DEFAULT NULL,
  `height` int UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jrvhizhmvxxbtcvkaadlbczeugxfinwsjgwz` (`name`),
  KEY `idx_vcqxqylebmemxsgvowpnpeabpydcomcvfrmu` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '5.1.8', '5.0.0.20', 1, 'fiuyokvncgsp', '3@rccvwrlqaf', '2024-04-16 07:00:10', '2024-06-04 15:07:01', '149bb378-5eaa-4725-a244-7848121b9159');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_biughfzodxbvxilcfjkasdltnmacaamwuidg` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'e64d2cb3-447d-4e35-bd77-1738dfafb0f4'),
(2, 'craft', 'm221101_115859_create_entries_authors_table', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '0ff5e55d-2ae0-4151-b01c-e2c1ae4292a1'),
(3, 'craft', 'm221107_112121_add_max_authors_to_sections', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'fe4192e8-f3e6-4a77-b8ef-ca5e7bacf8d5'),
(4, 'craft', 'm221205_082005_translatable_asset_alt_text', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'c3c33034-5ce8-4cea-85e2-b245c973532d'),
(5, 'craft', 'm230314_110309_add_authenticator_table', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'cb764b3c-b6e3-479c-9851-688385a35e51'),
(6, 'craft', 'm230314_111234_add_webauthn_table', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '41116f94-0e9a-4362-85b2-4f6374974f5e'),
(7, 'craft', 'm230503_120303_add_recoverycodes_table', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '3f8b34c9-6c4d-41d3-bb1d-c17188aa642c'),
(8, 'craft', 'm230511_000000_field_layout_configs', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2ff2daa6-ac38-4be0-849c-14b4ed53e4e0'),
(9, 'craft', 'm230511_215903_content_refactor', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '75fab650-1ca7-4cae-842f-c1658868c336'),
(10, 'craft', 'm230524_000000_add_entry_type_show_slug_field', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'ed363428-51d0-41cb-8c1e-f2fdf3d5649b'),
(11, 'craft', 'm230524_000001_entry_type_icons', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '98be092d-881d-4e66-a759-3d36db0734ab'),
(12, 'craft', 'm230524_000002_entry_type_colors', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '997386a9-f38b-4e79-b285-214b93150f34'),
(13, 'craft', 'm230524_220029_global_entry_types', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '669ab624-196a-4af4-a800-7792e17ef8b0'),
(14, 'craft', 'm230531_123004_add_entry_type_show_status_field', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '9f040c9a-e0ab-4f35-b2ac-99b6b5806f57'),
(15, 'craft', 'm230607_102049_add_entrytype_slug_translation_columns', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '734ed94c-5357-4a9e-b55d-6b2fb990054e'),
(16, 'craft', 'm230616_173810_kill_field_groups', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '416cf892-0503-41d7-b8c0-7ac4ce7a6abf'),
(17, 'craft', 'm230616_183820_remove_field_name_limit', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '70d4d886-fb3c-40a5-929d-6bb3f5cc1102'),
(18, 'craft', 'm230617_070415_entrify_matrix_blocks', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'd93f92d2-4c6a-4bf0-ae6f-309f232f8fbb'),
(19, 'craft', 'm230710_162700_element_activity', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '6e5dc327-30ed-4ed2-b067-9abd08833143'),
(20, 'craft', 'm230820_162023_fix_cache_id_type', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '426723ca-a65c-4388-962c-a47a3c3657b1'),
(21, 'craft', 'm230826_094050_fix_session_id_type', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'c9a06aab-daed-4fa9-9820-93364f1935fa'),
(22, 'craft', 'm230904_190356_address_fields', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '1da745e0-e1d2-4dce-82ac-9b9f48b859c2'),
(23, 'craft', 'm230928_144045_add_subpath_to_volumes', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '4dbc874c-b091-4868-8d6c-0a615c332837'),
(24, 'craft', 'm231013_185640_changedfields_amend_primary_key', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '557faf66-813c-4ca5-a5ff-88dc6d812013'),
(25, 'craft', 'm231213_030600_element_bulk_ops', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '927fb6c9-de5f-4f87-8a57-faff441001c9'),
(26, 'craft', 'm240129_150719_sites_language_amend_length', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '8d3d8661-0356-4b16-982a-1bb15d75cc23'),
(27, 'craft', 'm240206_035135_convert_json_columns', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'f1e9031b-92e2-4fd2-b7d1-e993c9270d6a'),
(28, 'craft', 'm240207_182452_address_line_3', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'd47d15cf-1b2f-4300-999e-0230472d3d70'),
(29, 'craft', 'm240302_212719_solo_preview_targets', '2024-04-16 07:00:11', '2024-04-16 07:00:11', '2024-04-16 07:00:11', 'ae676805-9efa-4866-b58c-db40d5bb72c1'),
(30, 'plugin:ckeditor', 'Install', '2024-05-06 08:20:34', '2024-05-06 08:20:34', '2024-05-06 08:20:34', '43825efc-7721-49ec-ad9d-a59ff99ab096'),
(31, 'plugin:ckeditor', 'm230408_163704_v3_upgrade', '2024-05-06 08:20:34', '2024-05-06 08:20:34', '2024-05-06 08:20:34', '645dafe1-ed07-4db7-8030-077cb19356bd');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fkfezadqpnetjzveykusgcayeyjpghojetsw` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ckeditor', '4.0.4', '3.0.0.0', '2024-05-06 08:20:34', '2024-05-06 08:20:34', '2024-05-06 08:20:34', '78b85748-ea51-4027-8e55-b43965fb3b21'),
(2, 'dumper', '5.0.1', '1.0.0', '2024-05-06 13:15:51', '2024-05-06 13:15:51', '2024-05-06 13:15:51', 'f6feb5e2-5efd-4263-84f0-fa1afe77f9bc');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
CREATE TABLE IF NOT EXISTS `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.headingLevels.0', '1'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.headingLevels.1', '2'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.headingLevels.2', '3'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.headingLevels.3', '4'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.headingLevels.4', '5'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.headingLevels.5', '6'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.name', '\"Simple\"'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.toolbar.0', '\"heading\"'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.toolbar.1', '\"|\"'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.toolbar.2', '\"bold\"'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.toolbar.3', '\"italic\"'),
('ckeditor.configs.21d73c87-fea9-45c4-bcd7-c7bcbbc36914.toolbar.4', '\"link\"'),
('dateModified', '1717512771'),
('elementSources.craft\\elements\\Entry.0.key', '\"*\"'),
('elementSources.craft\\elements\\Entry.0.type', '\"native\"'),
('elementSources.craft\\elements\\Entry.1.defaultSort.0', '\"title\"'),
('elementSources.craft\\elements\\Entry.1.defaultSort.1', '\"asc\"'),
('elementSources.craft\\elements\\Entry.1.disabled', 'false'),
('elementSources.craft\\elements\\Entry.1.key', '\"singles\"'),
('elementSources.craft\\elements\\Entry.1.tableAttributes.0', '\"link\"'),
('elementSources.craft\\elements\\Entry.1.type', '\"native\"'),
('elementSources.craft\\elements\\Entry.2.heading', '\"Sneakers\"'),
('elementSources.craft\\elements\\Entry.2.type', '\"heading\"'),
('elementSources.craft\\elements\\Entry.3.defaultSort.0', '\"structure\"'),
('elementSources.craft\\elements\\Entry.3.defaultSort.1', '\"asc\"'),
('elementSources.craft\\elements\\Entry.3.disabled', 'false'),
('elementSources.craft\\elements\\Entry.3.key', '\"section:dea38989-2ed2-4db7-bc89-0bd073d6c182\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.0', '\"field:fd445757-8cfd-45f7-9b1a-65a583956b73\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.1', '\"link\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.2', '\"field:b1818203-9eff-4584-9ea3-c39aab4fb3f0\"'),
('elementSources.craft\\elements\\Entry.3.type', '\"native\"'),
('elementSources.craft\\elements\\Entry.4.key', '\"section:cdb3ab49-66fb-4582-ad6d-51195eb25204\"'),
('elementSources.craft\\elements\\Entry.4.type', '\"native\"'),
('elementSources.craft\\elements\\Entry.5.heading', '\"\"'),
('elementSources.craft\\elements\\Entry.5.type', '\"heading\"'),
('elementSources.craft\\elements\\Entry.6.heading', '\"\"'),
('elementSources.craft\\elements\\Entry.6.type', '\"heading\"'),
('email.fromEmail', '\"robin.braibant@pxl.be\"'),
('email.fromName', '\"Web Expert\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.color', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elementCondition', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.class', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.disabled', 'false'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.id', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.inputType', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.instructions', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.label', '\"Kleur\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.max', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.min', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.name', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.orientation', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.readonly', 'false'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.requirable', 'false'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.size', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.step', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.tip', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.title', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.uid', '\"6cb19993-4b8e-47fc-8a89-4d4863f7e388\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.warning', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.elements.0.width', '100'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.name', '\"Content\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.uid', '\"fb702384-aba6-4214-9985-dec493dd9881\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.fieldLayouts.0d665ce8-9a01-4798-bacb-f95c2a2c3280.tabs.0.userCondition', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.handle', '\"colors\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.hasTitleField', 'true'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.icon', '\"\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.name', '\"Kleuren\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.showSlugField', 'true'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.showStatusField', 'true'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.slugTranslationKeyFormat', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.slugTranslationMethod', '\"site\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.titleFormat', '\"\"'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.titleTranslationKeyFormat', 'null'),
('entryTypes.0a8db0da-994f-4d07-9d6d-2df01713c777.titleTranslationMethod', '\"site\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.color', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.class', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.disabled', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.id', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.inputType', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.instructions', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.label', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.max', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.min', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.name', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.orientation', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.readonly', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.requirable', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.size', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.step', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.tip', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.title', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.uid', '\"1632b3d3-75ba-42d0-bd7a-c8514ace73ba\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.warning', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.0.width', '100'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.fieldUid', '\"fd445757-8cfd-45f7-9b1a-65a583956b73\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.handle', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.instructions', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.label', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.required', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.tip', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.uid', '\"3c156b75-7eae-46c3-a9a3-092f4782f697\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.warning', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.1.width', '50'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.fieldUid', '\"770ce4a3-7ca8-4558-b014-479fcb4ddb5e\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.handle', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.instructions', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.label', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.required', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.tip', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.uid', '\"64baa63c-9dad-4b86-b384-fc9e3e53fab6\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.warning', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.2.width', '50'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.fieldUid', '\"b1818203-9eff-4584-9ea3-c39aab4fb3f0\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.handle', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.instructions', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.label', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.required', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.tip', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.uid', '\"cd4d4642-d8f2-4d23-b38f-c23df3512f01\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.warning', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.3.width', '100'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.fieldUid', '\"519de1f8-b162-4b04-8923-fb072747ba56\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.handle', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.instructions', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.label', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.required', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.tip', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.uid', '\"158e547b-6539-4723-be1a-e52c94bc680e\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.warning', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.4.width', '100'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.fieldUid', '\"3d056b00-f42d-47e4-bc30-e14f28ac55da\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.handle', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.includeInCards', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.instructions', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.label', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.providesThumbs', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.required', 'false'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.tip', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.uid', '\"318bda92-6b2c-4675-9096-2bbb51334787\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.warning', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.elements.5.width', '100'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.name', '\"Content\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.uid', '\"bde21532-8ac5-44fa-812a-e10b75cb5416\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.fieldLayouts.c356ccf0-cd66-4b82-84dc-6501f751879c.tabs.0.userCondition', 'null'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.handle', '\"sneakers\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.hasTitleField', 'true'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.icon', '\"\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.name', '\"Sneakers\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.showSlugField', 'true'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.showStatusField', 'true'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.slugTranslationKeyFormat', '\"\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.slugTranslationMethod', '\"site\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.titleFormat', '\"\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.titleTranslationKeyFormat', '\"\"'),
('entryTypes.0b825ca4-12cd-464d-a5f3-dd500a0c4723.titleTranslationMethod', '\"site\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.color', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elementCondition', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.class', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.disabled', 'false'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.id', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.inputType', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.instructions', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.label', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.max', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.min', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.name', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.orientation', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.readonly', 'false'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.requirable', 'false'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.size', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.step', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.tip', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.title', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.uid', '\"0823564a-bfcd-40d7-88b7-f21902e8f333\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.warning', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.elements.0.width', '100'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.name', '\"Content\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.uid', '\"5ddc1267-afd2-4195-8064-3477371ac127\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.fieldLayouts.594463ef-a986-46ed-870b-22251a062491.tabs.0.userCondition', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.handle', '\"SneakersOverview\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.hasTitleField', 'true'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.icon', '\"\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.name', '\"Sneakers Overzicht\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.showSlugField', 'true'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.showStatusField', 'true'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.slugTranslationKeyFormat', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.slugTranslationMethod', '\"site\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.titleFormat', '\"\"'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.titleTranslationKeyFormat', 'null'),
('entryTypes.30517588-522b-4a74-8ca8-4a2b121d31dc.titleTranslationMethod', '\"site\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.color', '\"pink\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.class', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.disabled', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.id', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.inputType', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.instructions', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.label', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.max', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.min', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.name', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.orientation', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.readonly', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.requirable', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.size', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.step', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.tip', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.title', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.uid', '\"8714394b-b8f8-45be-8d5f-4cb9d4fa9018\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.warning', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.0.width', '100'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.1.heading', '\"Hero \"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\Heading\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.1.uid', '\"13c3d1b1-41f0-4dbb-b1b0-5f796ef8f49b\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.fieldUid', '\"c37718a4-2455-456a-a28a-4ab755d1ddb3\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.handle', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.includeInCards', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.instructions', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.label', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.providesThumbs', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.required', 'true'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.tip', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.uid', '\"a0eaa605-7549-4b6f-85a5-6387131a3c52\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.warning', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.2.width', '50'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.fieldUid', '\"c37718a4-2455-456a-a28a-4ab755d1ddb3\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.handle', '\"subTitle\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.includeInCards', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.instructions', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.label', '\"Ondertitel\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.providesThumbs', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.required', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.tip', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.uid', '\"4e11705e-3e24-48cc-a796-30b6730d034a\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.warning', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.3.width', '50'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.fieldUid', '\"9835d417-75ec-4190-a8a2-fb5eeabb0ec4\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.handle', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.includeInCards', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.instructions', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.label', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.providesThumbs', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.required', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.tip', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.uid', '\"c588d941-2b45-40c1-917e-8160ff829285\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.warning', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.4.width', '100'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.5.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.5.type', '\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.5.uid', '\"51686f2b-6bc3-4a0b-8dbd-7c3a6a445a0c\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.5.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.fieldUid', '\"fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.handle', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.includeInCards', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.instructions', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.label', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.providesThumbs', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.required', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.tip', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.uid', '\"d51ac987-38e2-4d55-85e6-f575b5af4fb5\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.warning', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.6.width', '100'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.elementCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.fieldUid', '\"3d056b00-f42d-47e4-bc30-e14f28ac55da\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.handle', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.includeInCards', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.instructions', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.label', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.providesThumbs', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.required', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.tip', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.uid', '\"19bd82cb-9c2e-41eb-838f-087a2d144ff3\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.warning', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.elements.7.width', '100'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.name', '\"Content\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.uid', '\"39f09732-54ea-46ae-b7e9-74ae28b004fe\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.fieldLayouts.d5aea1d3-eaf4-4039-b1ab-d44b3d3c0b53.tabs.0.userCondition', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.handle', '\"home\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.hasTitleField', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.icon', '\"house\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.name', '\"Startpagina\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.showSlugField', 'false'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.showStatusField', 'true'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.slugTranslationKeyFormat', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.slugTranslationMethod', '\"site\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.titleFormat', '\"{{\\\"Startpagina\\\"}}\"'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.titleTranslationKeyFormat', 'null'),
('entryTypes.572daa2f-bca0-46ac-8c9f-8eb5a784b77b.titleTranslationMethod', '\"site\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.color', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elementCondition', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.class', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.disabled', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.id', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.inputType', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.instructions', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.label', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.max', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.min', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.name', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.orientation', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.readonly', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.requirable', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.size', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.step', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.tip', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.title', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.uid', '\"9eeb3a88-f54f-4e4a-8770-99130e6ba7b9\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.userCondition', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.warning', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.elements.0.width', '100'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.name', '\"Content\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.uid', '\"9ebabb2f-4878-42bf-a313-961d3962e1cf\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.fieldLayouts.b94e87ea-0f6e-48a5-8521-14a0330d9a54.tabs.0.userCondition', 'null'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.handle', '\"login\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.hasTitleField', 'true'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.icon', '\"\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.name', '\"Login\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.showSlugField', 'false'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.showStatusField', 'true'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.slugTranslationKeyFormat', '\"\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.slugTranslationMethod', '\"site\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.titleFormat', '\"\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.titleTranslationKeyFormat', '\"\"'),
('entryTypes.a3e889f2-5ec0-4d28-879e-e83f828dab2f.titleTranslationMethod', '\"site\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.color', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elementCondition', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.class', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.disabled', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.id', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.inputType', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.instructions', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.label', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.max', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.min', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.name', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.orientation', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.readonly', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.requirable', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.size', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.step', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.tip', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.title', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.uid', '\"328e9e1d-c93c-4c76-ba80-031723be8e02\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.warning', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.0.width', '100'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.fieldUid', '\"519de1f8-b162-4b04-8923-fb072747ba56\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.handle', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.instructions', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.label', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.required', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.tip', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.uid', '\"b5d5aec5-bc6d-4463-bf18-75148cd4f01a\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.warning', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.elements.1.width', '100'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.name', '\"Content\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.uid', '\"d30cea72-cb3a-4799-a414-ff024be9b6b7\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.fieldLayouts.9218b2db-8dd2-4e2f-a916-1b2ffd841433.tabs.0.userCondition', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.handle', '\"tekst\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.hasTitleField', 'false'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.icon', '\"\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.name', '\"Tekst\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.showSlugField', 'true'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.showStatusField', 'true'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.slugTranslationKeyFormat', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.slugTranslationMethod', '\"site\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.titleFormat', '\"Tekst\"'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.titleTranslationKeyFormat', 'null'),
('entryTypes.b1ef33e9-9a2c-4970-a081-ca08f9c28190.titleTranslationMethod', '\"site\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.color', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elementCondition', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.class', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.disabled', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.elementCondition', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.id', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.includeInCards', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.inputType', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.instructions', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.label', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.max', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.min', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.name', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.orientation', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.providesThumbs', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.readonly', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.requirable', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.size', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.step', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.tip', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.title', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.uid', '\"6db31b95-4ab3-4056-a847-766eef74e095\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.userCondition', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.warning', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.0.width', '100'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.elementCondition', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.fieldUid', '\"770ce4a3-7ca8-4558-b014-479fcb4ddb5e\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.handle', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.includeInCards', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.instructions', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.label', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.providesThumbs', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.required', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.tip', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.uid', '\"b964b4bb-64a0-4b2d-8c7e-e8ccc0513eae\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.userCondition', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.warning', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.elements.1.width', '100'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.name', '\"Content\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.uid', '\"e6d5d557-a4cd-4eac-b30e-ba9ded9842a9\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.fieldLayouts.babe92de-3989-4220-8357-f7d89d3ba60d.tabs.0.userCondition', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.handle', '\"afbeelding\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.hasTitleField', 'false'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.icon', '\"\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.name', '\"Afbeelding\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.showSlugField', 'true'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.showStatusField', 'true'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.slugTranslationKeyFormat', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.slugTranslationMethod', '\"site\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.titleFormat', '\"Afbeelding\"'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.titleTranslationKeyFormat', 'null'),
('entryTypes.d1432e2e-47d7-4e76-aeec-da4fec2d3742.titleTranslationMethod', '\"site\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.columnSuffix', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.handle', '\"blocks\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.instructions', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.name', '\"blokken\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.searchable', 'true'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.createButtonLabel', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.entryTypes.0', '\"b1ef33e9-9a2c-4970-a081-ca08f9c28190\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.entryTypes.1', '\"d1432e2e-47d7-4e76-aeec-da4fec2d3742\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.includeTableView', 'false'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.maxEntries', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.minEntries', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.pageSize', '50'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.propagationKeyFormat', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.propagationMethod', '\"all\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.showCardsInGrid', 'false'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.settings.viewMode', '\"cards\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.translationKeyFormat', 'null'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.translationMethod', '\"site\"'),
('fields.3d056b00-f42d-47e4-bc30-e14f28ac55da.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.columnSuffix', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.handle', '\"text\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.instructions', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.name', '\"Text\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.searchable', 'true'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.availableTransforms', '\"\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.availableVolumes', '\"*\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.ckeConfig', '\"21d73c87-fea9-45c4-bcd7-c7bcbbc36914\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.createButtonLabel', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.defaultTransform', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.enableSourceEditingForNonAdmins', 'false'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.purifierConfig', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.purifyHtml', 'true'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.showUnpermittedFiles', 'false'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.showUnpermittedVolumes', 'false'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.showWordCount', 'false'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.settings.wordLimit', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.translationKeyFormat', 'null'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.translationMethod', '\"none\"'),
('fields.519de1f8-b162-4b04-8923-fb072747ba56.type', '\"craft\\\\ckeditor\\\\Field\"'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.columnSuffix', 'null'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.handle', '\"facebookUrl\"'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.instructions', 'null'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.name', '\"Facebook URL\"'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.searchable', 'true'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.settings.maxLength', '255'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.settings.types.0', '\"url\"'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.translationKeyFormat', 'null'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.translationMethod', '\"none\"'),
('fields.609b50fe-0974-43e3-b42c-929fd1574e5f.type', '\"craft\\\\fields\\\\Url\"'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.columnSuffix', 'null'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.handle', '\"instagram\"'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.instructions', 'null'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.name', '\"Instagram\"'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.searchable', 'true'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.settings.maxLength', '255'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.settings.types.0', '\"url\"'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.translationKeyFormat', 'null'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.translationMethod', '\"none\"'),
('fields.67765763-385a-42f9-a6d9-e39876a64542.type', '\"craft\\\\fields\\\\Url\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.columnSuffix', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.handle', '\"image\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.instructions', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.name', '\"Afbeelding\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.searchable', 'true'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.allowedKinds.0', '\"image\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.allowSelfRelations', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.allowSubfolders', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.allowUploads', 'true'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.branchLimit', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.defaultUploadLocationSource', '\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.defaultUploadLocationSubpath', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.localizeRelations', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.maintainHierarchy', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.maxRelations', '1'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.minRelations', '1'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.previewMode', '\"full\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.restrictedLocationSource', '\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.restrictedLocationSubpath', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.restrictFiles', 'true'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.restrictLocation', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.selectionLabel', '\"Selecteer een afbeelding\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.showCardsInGrid', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.showSiteMenu', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.showUnpermittedFiles', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.showUnpermittedVolumes', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.sources', '\"*\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.targetSiteId', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.validateRelatedElements', 'false'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.settings.viewMode', '\"list\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.translationKeyFormat', 'null'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.translationMethod', '\"site\"'),
('fields.770ce4a3-7ca8-4558-b014-479fcb4ddb5e.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.columnSuffix', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.handle', '\"heroImage\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.instructions', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.name', '\"Hero Afbeelding\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.searchable', 'true'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.allowedKinds.0', '\"image\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.allowSelfRelations', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.allowSubfolders', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.allowUploads', 'true'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.branchLimit', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.defaultUploadLocationSource', '\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.defaultUploadLocationSubpath', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.localizeRelations', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.maintainHierarchy', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.maxRelations', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.minRelations', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.previewMode', '\"full\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.restrictedDefaultUploadSubpath', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.restrictedLocationSource', '\"volume:93072a96-b65a-41ea-affb-1c3aa926763a\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.restrictedLocationSubpath', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.restrictFiles', 'true'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.restrictLocation', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.selectionLabel', '\"Voeg een afbeelding toe\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.showCardsInGrid', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.showSiteMenu', 'true'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.showUnpermittedFiles', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.showUnpermittedVolumes', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.sources', '\"*\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.targetSiteId', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.validateRelatedElements', 'false'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.settings.viewMode', '\"list\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.translationKeyFormat', 'null'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.translationMethod', '\"site\"'),
('fields.9835d417-75ec-4190-a8a2-fb5eeabb0ec4.type', '\"craft\\\\fields\\\\Assets\"'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.columnSuffix', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.handle', '\"color\"'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.instructions', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.name', '\"Kleur\"'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.searchable', 'true'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.allowSelfRelations', 'false'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.branchLimit', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.localizeRelations', 'false'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.maintainHierarchy', 'false'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.maxRelations', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.minRelations', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.selectionLabel', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.showCardsInGrid', 'false'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.showSiteMenu', 'true'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.sources.0', '\"section:cdb3ab49-66fb-4582-ad6d-51195eb25204\"'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.targetSiteId', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.validateRelatedElements', 'false'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.settings.viewMode', '\"list\"'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.translationKeyFormat', 'null'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.translationMethod', '\"site\"'),
('fields.b1818203-9eff-4584-9ea3-c39aab4fb3f0.type', '\"craft\\\\fields\\\\Entries\"'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.columnSuffix', 'null'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.handle', '\"pageTitle\"'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.instructions', 'null'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.name', '\"Titel\"'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.searchable', 'true'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.byteLimit', 'null'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.charLimit', 'null'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.code', 'false'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.initialRows', '4'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.multiline', 'false'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.placeholder', 'null'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.settings.uiMode', '\"normal\"'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.translationKeyFormat', 'null'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.translationMethod', '\"site\"'),
('fields.c37718a4-2455-456a-a28a-4ab755d1ddb3.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.columnSuffix', 'null'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.handle', '\"price\"'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.instructions', 'null'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.name', '\"Prijs\"'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.searchable', 'false'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.settings.currency', '\"EUR\"'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.settings.defaultValue', 'null'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.settings.max', 'null'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.settings.min', '0'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.settings.showCurrency', 'true'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.settings.size', 'null'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.translationKeyFormat', 'null'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.translationMethod', '\"none\"'),
('fields.fd445757-8cfd-45f7-9b1a-65a583956b73.type', '\"craft\\\\fields\\\\Money\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.columnSuffix', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.handle', '\"sneakers\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.instructions', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.name', '\"Sneakers\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.searchable', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.allowSelfRelations', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.branchLimit', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.localizeRelations', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.maintainHierarchy', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.maxRelations', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.minRelations', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.selectionLabel', '\"Selecteer een sneaker\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.showCardsInGrid', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.showSiteMenu', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.sources.0', '\"section:dea38989-2ed2-4db7-bc89-0bd073d6c182\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.targetSiteId', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.validateRelatedElements', 'false'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.settings.viewMode', '\"list\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.translationKeyFormat', 'null'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.translationMethod', '\"site\"'),
('fields.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6.type', '\"craft\\\\fields\\\\Entries\"'),
('fs.files.hasUrls', 'true'),
('fs.files.name', '\"Bestanden\"'),
('fs.files.settings.path', '\"@webroot/files\"'),
('fs.files.type', '\"craft\\\\fs\\\\Local\"'),
('fs.files.url', '\"/files\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elementCondition', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.elementCondition', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.fieldUid', '\"609b50fe-0974-43e3-b42c-929fd1574e5f\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.handle', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.includeInCards', 'false'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.instructions', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.label', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.providesThumbs', 'false'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.required', 'false'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.tip', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.uid', '\"1a096a33-e60d-4dbc-8492-8ab6cd075d24\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.userCondition', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.warning', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.elements.0.width', '100'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.name', '\"Sociale Media URL\'s\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.uid', '\"52344357-f5c2-4cee-84e5-16af9209f291\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.fieldLayouts.ab3eddae-cf8f-40e5-af8f-178bfd172372.tabs.0.userCondition', 'null'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.handle', '\"socialeMedia\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.name', '\"Sociale Media\"'),
('globalSets.c145b76d-f1b8-4a06-8c95-70cb973425e5.sortOrder', '3'),
('meta.__names__.0a8db0da-994f-4d07-9d6d-2df01713c777', '\"Kleuren\"'),
('meta.__names__.0b825ca4-12cd-464d-a5f3-dd500a0c4723', '\"Sneakers\"'),
('meta.__names__.21d73c87-fea9-45c4-bcd7-c7bcbbc36914', '\"Simple\"'),
('meta.__names__.30517588-522b-4a74-8ca8-4a2b121d31dc', '\"Sneakers Overzicht\"'),
('meta.__names__.3d056b00-f42d-47e4-bc30-e14f28ac55da', '\"blokken\"'),
('meta.__names__.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84', '\"Startpagina\"'),
('meta.__names__.49adc719-ffd2-491a-832b-7c6defaf41fa', '\"Web Expert Engels\"'),
('meta.__names__.519de1f8-b162-4b04-8923-fb072747ba56', '\"Text\"'),
('meta.__names__.572daa2f-bca0-46ac-8c9f-8eb5a784b77b', '\"Startpagina\"'),
('meta.__names__.609b50fe-0974-43e3-b42c-929fd1574e5f', '\"Facebook URL\"'),
('meta.__names__.67765763-385a-42f9-a6d9-e39876a64542', '\"Instagram\"'),
('meta.__names__.770ce4a3-7ca8-4558-b014-479fcb4ddb5e', '\"Afbeelding\"'),
('meta.__names__.93072a96-b65a-41ea-affb-1c3aa926763a', '\"Bestanden\"'),
('meta.__names__.9835d417-75ec-4190-a8a2-fb5eeabb0ec4', '\"Hero Afbeelding\"'),
('meta.__names__.a3e889f2-5ec0-4d28-879e-e83f828dab2f', '\"Login\"'),
('meta.__names__.ac63f299-82f5-4f8b-9f5f-24d1496028ca', '\"Web Expert\"'),
('meta.__names__.b1818203-9eff-4584-9ea3-c39aab4fb3f0', '\"Kleur\"'),
('meta.__names__.b1ef33e9-9a2c-4970-a081-ca08f9c28190', '\"Tekst\"'),
('meta.__names__.c145b76d-f1b8-4a06-8c95-70cb973425e5', '\"Sociale Media\"'),
('meta.__names__.c37718a4-2455-456a-a28a-4ab755d1ddb3', '\"Titel\"'),
('meta.__names__.cdb3ab49-66fb-4582-ad6d-51195eb25204', '\"Kleuren\"'),
('meta.__names__.d1432e2e-47d7-4e76-aeec-da4fec2d3742', '\"Afbeelding\"'),
('meta.__names__.dea38989-2ed2-4db7-bc89-0bd073d6c182', '\"Sneakers\"'),
('meta.__names__.df0d1799-8c87-4030-a2c5-1edfea893380', '\"Web Expert\"'),
('meta.__names__.f1299ccc-119c-44ac-ab0f-ba5dda4b5006', '\"Sneakers Overzicht\"'),
('meta.__names__.fd445757-8cfd-45f7-9b1a-65a583956b73', '\"Prijs\"'),
('meta.__names__.fdc0c5de-9ce5-4a92-ad55-c589f3d4a8d6', '\"Sneakers\"'),
('plugins.ckeditor.edition', '\"standard\"'),
('plugins.ckeditor.enabled', 'true'),
('plugins.ckeditor.schemaVersion', '\"3.0.0.0\"'),
('plugins.dumper.edition', '\"standard\"'),
('plugins.dumper.enabled', 'true'),
('plugins.dumper.schemaVersion', '\"1.0.0\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.defaultPlacement', '\"end\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.enableVersioning', 'true'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.entryTypes.0', '\"572daa2f-bca0-46ac-8c9f-8eb5a784b77b\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.handle', '\"home\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.maxAuthors', '1'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.name', '\"Startpagina\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.propagationMethod', '\"all\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.enabledByDefault', 'true'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.hasUrls', 'true'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.template', '\"_index.twig\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.uriFormat', '\"__home__\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.enabledByDefault', 'true'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.hasUrls', 'true'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.template', '\"_index.twig\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.uriFormat', '\"__home__\"'),
('sections.3d5ebfb2-b58d-4890-8705-cfc6be3e7f84.type', '\"single\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.defaultPlacement', '\"end\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.enableVersioning', 'true'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.entryTypes.0', '\"0a8db0da-994f-4d07-9d6d-2df01713c777\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.handle', '\"colors\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.maxAuthors', '1'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.name', '\"Kleuren\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.propagationMethod', '\"all\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.enabledByDefault', 'true'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.hasUrls', 'false'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.template', 'null'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.uriFormat', 'null'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.structure.maxLevels', '1'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.structure.uid', '\"862b16ef-8774-4ab2-899a-0bfa90e59b11\"'),
('sections.cdb3ab49-66fb-4582-ad6d-51195eb25204.type', '\"structure\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.defaultPlacement', '\"end\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.enableVersioning', 'true'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.entryTypes.0', '\"0b825ca4-12cd-464d-a5f3-dd500a0c4723\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.handle', '\"sneakers\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.maxAuthors', '1'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.name', '\"Sneakers\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.propagationMethod', '\"all\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.enabledByDefault', 'true'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.hasUrls', 'true'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.template', '\"_sneakers/_entry.twig\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.49adc719-ffd2-491a-832b-7c6defaf41fa.uriFormat', '\"our-sneakers/{slug}\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.enabledByDefault', 'true'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.hasUrls', 'true'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.template', '\"_sneakers/_entry.twig\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.uriFormat', '\"our-sneakers/{slug}\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.structure.maxLevels', '1'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.structure.uid', '\"96e28752-5701-4580-bd20-c55aeb9f54ba\"'),
('sections.dea38989-2ed2-4db7-bc89-0bd073d6c182.type', '\"structure\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.defaultPlacement', '\"end\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.enableVersioning', 'true'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.entryTypes.0', '\"30517588-522b-4a74-8ca8-4a2b121d31dc\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.handle', '\"sneakersOverview\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.maxAuthors', '1'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.name', '\"Sneakers Overzicht\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.propagationMethod', '\"all\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.enabledByDefault', 'true'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.hasUrls', 'true'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.template', '\"_sneakers/_overview.twig\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.siteSettings.df0d1799-8c87-4030-a2c5-1edfea893380.uriFormat', '\"our-sneakers\"'),
('sections.f1299ccc-119c-44ac-ab0f-ba5dda4b5006.type', '\"single\"'),
('siteGroups.ac63f299-82f5-4f8b-9f5f-24d1496028ca.name', '\"Web Expert\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.baseUrl', '\"@baseUrlEn\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.enabled', '\"1\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.handle', '\"webExpertEngels\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.hasUrls', 'true'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.language', '\"en-BE\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.name', '\"Web Expert Engels\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.primary', 'false'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.siteGroup', '\"ac63f299-82f5-4f8b-9f5f-24d1496028ca\"'),
('sites.49adc719-ffd2-491a-832b-7c6defaf41fa.sortOrder', '2'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.enabled', 'true'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.handle', '\"default\"'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.hasUrls', 'true'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.language', '\"nl-BE\"'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.name', '\"Web Expert\"'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.primary', 'true'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.siteGroup', '\"ac63f299-82f5-4f8b-9f5f-24d1496028ca\"'),
('sites.df0d1799-8c87-4030-a2c5-1edfea893380.sortOrder', '1'),
('system.edition', '\"pro\"'),
('system.live', 'true'),
('system.name', '\"Web Expert\"'),
('system.schemaVersion', '\"5.0.0.20\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.require2fa', 'false'),
('users.requireEmailVerification', 'true'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.altTranslationKeyFormat', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.altTranslationMethod', '\"none\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elementCondition', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.autocomplete', 'false'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.autocorrect', 'true'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.class', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.disabled', 'false'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.elementCondition', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.id', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.includeInCards', 'false'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.inputType', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.instructions', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.label', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.max', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.min', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.name', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.orientation', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.placeholder', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.providesThumbs', 'false'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.readonly', 'false'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.requirable', 'false'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.size', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.step', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.tip', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.title', 'null');
INSERT INTO `projectconfig` (`path`, `value`) VALUES
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.uid', '\"46b86a5e-2a4e-4d68-ad07-e678d16f71b9\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.userCondition', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.warning', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.elements.0.width', '100'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.name', '\"Content\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.uid', '\"3d0c6ec7-d326-4b2e-9bc6-57892d9db266\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fieldLayouts.a874318a-641b-4157-af21-9659c00843a4.tabs.0.userCondition', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.fs', '\"files\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.handle', '\"files\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.name', '\"Bestanden\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.sortOrder', '3'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.subpath', '\"\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.titleTranslationKeyFormat', 'null'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.titleTranslationMethod', '\"site\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.transformFs', '\"\"'),
('volumes.93072a96-b65a-41ea-affb-1c3aa926763a.transformSubpath', '\"\"');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_gnbpefostciawegygvxcpefteddiusryruqk` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_fjwcvthfvioxwcrneirebtegicstthnjxgmi` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
CREATE TABLE IF NOT EXISTS `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE IF NOT EXISTS `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yyuoxbneooczeiclrjejrgqmuakjkstqxnqf` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_azselajqwqzvthdohqszznhjtsqwrkqyrwhr` (`sourceId`),
  KEY `idx_skratlnshsyqngbnquwfuxvdvgtyqmkhajuj` (`targetId`),
  KEY `idx_thovgxkeffpxnsrthtygrzldramkbpsvzbqu` (`sourceSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 7, 46, NULL, 45, 1, '2024-04-29 14:59:53', '2024-04-29 14:59:53', '428784e9-962b-4938-ae5f-a53ba4bff486'),
(9, 7, 12, NULL, 45, 1, '2024-04-29 15:13:27', '2024-04-29 15:13:27', '8609d53d-106b-44d3-9e8c-f053bf46421e'),
(10, 7, 50, NULL, 45, 1, '2024-04-29 15:13:27', '2024-04-29 15:13:27', 'e2b6576f-bd68-4ff0-8e2f-763e934559b8'),
(11, 8, 51, NULL, 53, 1, '2024-05-06 07:24:06', '2024-05-06 07:24:06', '0da6a362-2e18-4309-b243-03d5648bcd60'),
(12, 8, 63, NULL, 53, 1, '2024-05-06 07:24:11', '2024-05-06 07:24:11', 'd359794f-7492-44e3-bdaf-fd8e397ab549'),
(13, 8, 64, NULL, 54, 1, '2024-05-06 07:24:29', '2024-05-06 07:24:29', 'e606da62-ee3d-4afa-bae4-794109173a3a'),
(14, 8, 65, NULL, 54, 1, '2024-05-06 07:24:34', '2024-05-06 07:24:34', '4df9d008-5bab-4e69-aa81-ed3ff854acbe'),
(15, 8, 66, NULL, 55, 1, '2024-05-06 07:24:51', '2024-05-06 07:24:51', '9b397800-48d0-4e97-9746-eb759ab76720'),
(16, 8, 67, NULL, 55, 1, '2024-05-06 07:24:58', '2024-05-06 07:24:58', '065c2485-4753-4744-a8ac-56afb26faa58'),
(17, 8, 68, NULL, 56, 1, '2024-05-06 07:25:19', '2024-05-06 07:25:19', '98fc636a-a522-4a32-9124-eda794be1b29'),
(18, 8, 69, NULL, 56, 1, '2024-05-06 07:25:26', '2024-05-06 07:25:26', 'a60b7b2b-552a-4206-b6d5-3f95f4d82744'),
(19, 8, 70, NULL, 57, 1, '2024-05-06 07:25:45', '2024-05-06 07:25:45', '09c7340e-7391-4bcf-b5dc-41506cc44ded'),
(20, 8, 71, NULL, 57, 1, '2024-05-06 07:25:50', '2024-05-06 07:25:50', '8532dec5-b77c-4c5a-9e8c-8b28137c30de'),
(21, 8, 72, NULL, 58, 1, '2024-05-06 07:26:04', '2024-05-06 07:26:04', '5283f21d-42e3-4f72-b779-e6e4765ca010'),
(22, 8, 73, NULL, 58, 1, '2024-05-06 07:26:09', '2024-05-06 07:26:09', 'ab1d527d-d2e6-40a3-8110-4d173d152198'),
(23, 8, 74, NULL, 58, 1, '2024-05-06 07:26:11', '2024-05-06 07:26:11', 'f8749468-7c3d-4bbd-8fa9-7e08108e0301'),
(28, 11, 12, NULL, 51, 2, '2024-05-06 13:01:02', '2024-05-06 13:03:39', 'da09f64b-1b53-4e5a-add9-93ef47e991ea'),
(30, 11, 12, NULL, 70, 1, '2024-05-06 13:01:02', '2024-05-06 13:03:39', '27a1a271-479a-46de-8690-577b15630b5c'),
(31, 7, 76, NULL, 45, 1, '2024-05-06 13:01:02', '2024-05-06 13:01:02', 'b2c85a3a-ef65-43b3-b002-bf28099a521a'),
(32, 11, 76, NULL, 51, 1, '2024-05-06 13:01:02', '2024-05-06 13:01:02', '72f5e0bd-0b8d-4f2f-a567-ce2bb91afa06'),
(33, 11, 76, NULL, 64, 2, '2024-05-06 13:01:02', '2024-05-06 13:01:02', 'a1ca09ce-3241-4c02-8e3e-d7c669fa3621'),
(34, 11, 76, NULL, 70, 3, '2024-05-06 13:01:02', '2024-05-06 13:01:02', 'd1c9c19c-2057-49fc-8748-96dd50de6dd0'),
(39, 7, 78, NULL, 45, 1, '2024-05-06 13:03:39', '2024-05-06 13:03:39', 'f0f9b619-ea77-44b7-9948-b2a68782e702'),
(40, 11, 78, NULL, 70, 1, '2024-05-06 13:03:39', '2024-05-06 13:03:39', '26c38708-afce-4533-a439-227bdd7f4248'),
(41, 11, 78, NULL, 51, 2, '2024-05-06 13:03:39', '2024-05-06 13:03:39', 'd18e86a1-bf11-409c-846f-70b80fc42ad9'),
(42, 11, 78, NULL, 64, 3, '2024-05-06 13:03:39', '2024-05-06 13:03:39', '622ad397-10ab-4461-a990-df15777b845e'),
(46, 8, 83, NULL, 56, 1, '2024-05-13 06:17:29', '2024-05-13 06:17:29', 'ca653a89-8b76-411a-86c8-0060e6a449b9'),
(51, 8, 87, NULL, 53, 1, '2024-05-13 06:17:56', '2024-05-13 06:17:56', 'be28e9dc-1ef2-42a7-86a9-c6a6e7d8dcfa'),
(56, 8, 91, NULL, 58, 1, '2024-05-13 06:18:16', '2024-05-13 06:18:16', '5fb7fc3b-55f9-4c47-9093-1ca0a1ae35f2'),
(61, 8, 95, NULL, 54, 1, '2024-05-13 06:18:45', '2024-05-13 06:18:45', '28140060-4f90-4884-8fd7-37720a58e3ad'),
(66, 8, 99, NULL, 55, 1, '2024-05-13 06:19:23', '2024-05-13 06:19:23', '32c3a481-7133-4fc9-9618-42d95c5eaef2'),
(71, 8, 101, NULL, 57, 1, '2024-05-13 06:19:42', '2024-05-13 06:19:42', 'bded152a-51c0-4c61-97e2-0a9131cb6e4d'),
(76, 8, 108, NULL, 62, 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', '71fa4758-9464-4110-9252-7b1f541222cc'),
(77, 8, 109, NULL, 56, 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', '8a80ebc6-3c75-4853-8264-60b99a6e947c'),
(79, 8, 111, NULL, 62, 1, '2024-05-13 07:59:56', '2024-05-13 07:59:56', '332c3f11-94c4-4146-a496-a584d6b46520'),
(82, 16, 68, NULL, 117, 1, '2024-05-13 12:11:59', '2024-05-13 12:11:59', '1c472d23-0e83-40db-9de8-04dcf1248916'),
(83, 8, 122, NULL, 56, 1, '2024-05-13 12:11:59', '2024-05-13 12:11:59', '50da9c4e-5a6c-4029-b21b-9316dec43021'),
(84, 16, 122, NULL, 117, 1, '2024-05-13 12:11:59', '2024-05-13 12:11:59', '12b59aa6-15dd-4ea5-8e7f-a1aa2fd7c09b'),
(87, 16, 51, NULL, 123, 1, '2024-05-13 12:12:27', '2024-05-13 12:12:27', 'd45e885f-ff88-4d1b-96bb-d355e3d9c0d3'),
(88, 8, 126, NULL, 53, 1, '2024-05-13 12:12:27', '2024-05-13 12:12:27', '2644a2e8-5705-40ae-a786-b590fee57fa3'),
(89, 16, 126, NULL, 123, 1, '2024-05-13 12:12:27', '2024-05-13 12:12:27', 'ccb42c8f-c4fa-48a5-b591-f334f9993cec'),
(90, 8, 127, NULL, 53, 1, '2024-05-13 12:12:29', '2024-05-13 12:12:29', '5dc1601f-52c7-482a-a50f-6e256dd821e3'),
(91, 16, 127, NULL, 123, 1, '2024-05-13 12:12:29', '2024-05-13 12:12:29', '00187f03-486a-418b-8b7e-5a58a5d82701'),
(94, 16, 72, NULL, 119, 1, '2024-05-13 12:12:40', '2024-05-13 12:12:40', '857c63cb-41d6-4f14-877f-076f33ae890d'),
(95, 8, 129, NULL, 58, 1, '2024-05-13 12:12:40', '2024-05-13 12:12:40', '9d8dc9e5-7ec3-41fe-a44e-f1b9227be812'),
(96, 16, 129, NULL, 119, 1, '2024-05-13 12:12:40', '2024-05-13 12:12:40', 'c6fee25e-fb09-4e05-8c34-65c56e3e10f8'),
(99, 16, 64, NULL, 113, 1, '2024-05-13 12:12:50', '2024-05-13 12:12:50', '967ecee4-baa4-4e88-8729-90beff1f8da7'),
(100, 8, 131, NULL, 54, 1, '2024-05-13 12:12:50', '2024-05-13 12:12:50', '483e782e-c7c1-4fda-a479-43a3fe19a1ec'),
(101, 16, 131, NULL, 113, 1, '2024-05-13 12:12:50', '2024-05-13 12:12:50', '15aef775-c3c0-4e96-8371-ed03806d9b94'),
(104, 16, 66, NULL, 115, 1, '2024-05-13 12:12:59', '2024-05-13 12:12:59', '1f918a11-d067-4d5f-bdd2-08039b84c71b'),
(105, 8, 133, NULL, 55, 1, '2024-05-13 12:12:59', '2024-05-13 12:12:59', '7e3ed583-821a-46ea-ae74-00cc77c37902'),
(106, 16, 133, NULL, 115, 1, '2024-05-13 12:12:59', '2024-05-13 12:12:59', '69a39b04-40b5-4716-9a04-f83d0e8f6cc9'),
(110, 8, 135, NULL, 57, 1, '2024-05-13 12:13:09', '2024-05-13 12:13:09', 'b56bb494-8258-4d9a-b005-95f0224460c4'),
(111, 16, 135, NULL, 113, 1, '2024-05-13 12:13:09', '2024-05-13 12:13:09', '06a77be7-67cf-487d-b29c-f6fcbe7c5218'),
(112, 8, 136, NULL, 56, 1, '2024-05-13 12:35:57', '2024-05-13 12:35:57', '6cc07b65-46eb-4572-8fdd-1ad8185da77e'),
(114, 16, 136, NULL, 117, 1, '2024-05-13 12:36:04', '2024-05-13 12:36:04', '73c46fa5-95a1-41f6-8cad-52efa2cc62f6'),
(120, 16, 136, NULL, 115, 2, '2024-05-13 14:42:11', '2024-05-13 14:42:11', 'e3c226fa-3b33-47bf-825e-4bf03ffa6cbf'),
(124, 16, 70, NULL, 145, 1, '2024-05-13 15:30:09', '2024-05-13 15:30:09', 'd9d881a8-049e-4dca-af79-fa8ee6ce32e0'),
(125, 8, 148, NULL, 57, 1, '2024-05-13 15:30:09', '2024-05-13 15:30:09', 'c9731f4e-3b82-4ebd-b529-8b0ae717bf6d'),
(126, 16, 148, NULL, 145, 1, '2024-05-13 15:30:09', '2024-05-13 15:30:09', 'c36f650c-82c5-4336-acb0-01879f4cb4c1'),
(127, 7, 149, NULL, 45, 1, '2024-05-27 14:03:45', '2024-05-27 14:03:45', 'aff41d88-7902-4055-8b01-9677c50a1953'),
(128, 11, 149, NULL, 70, 1, '2024-05-27 14:03:45', '2024-05-27 14:03:45', '9e6d6135-c3fd-4dd8-b456-d1ad741026d8'),
(129, 11, 149, NULL, 51, 2, '2024-05-27 14:03:45', '2024-05-27 14:03:45', '8e9062e1-9c23-470a-ab2b-60bae2e3815d'),
(130, 11, 149, NULL, 64, 3, '2024-05-27 14:03:45', '2024-05-27 14:03:45', '3e7d1a50-4b53-4030-a24a-fa2e2e8b1bc2'),
(131, 8, 151, NULL, 62, 1, '2024-05-27 14:07:55', '2024-05-27 14:07:55', 'e3b1e6fd-ad5d-49ea-9d7d-ec71f25260df'),
(132, 7, 154, NULL, 45, 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', '475de6de-ac8d-46b9-a737-102564f20ea3'),
(133, 11, 154, NULL, 70, 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', '488b3dcb-2b10-44b6-b8d7-087b49198fec'),
(134, 11, 154, NULL, 51, 2, '2024-05-27 14:07:56', '2024-05-27 14:07:56', '623ee8bd-e22b-47d0-9edb-824f77df47b1'),
(135, 8, 156, NULL, 62, 1, '2024-05-27 14:07:56', '2024-05-27 14:07:56', 'eb8e4bed-8477-47be-9d52-7ab9074813af');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE IF NOT EXISTS `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('15dbef09', '@craft/web/assets/fabric/dist'),
('26f510a', '@craft/web/assets/authmethodsetup/dist'),
('28f854f1', '@craft/web/assets/updates/dist'),
('2a04e257', '@craft/web/assets/vue/dist'),
('2a5c1208', '@craft/web/assets/editsection/dist'),
('2c854e1a', '@craft/web/assets/plugins/dist'),
('3121b5e5', '@craft/web/assets/feed/dist'),
('3568e8dd', '@craft/web/assets/axios/dist'),
('35b8b17c', '@craft/web/assets/datepickeri18n/dist'),
('3bb338bb', '@craft/web/assets/jquerypayment/dist'),
('3be0e7d9', '@craft/web/assets/jquerytouchevents/dist'),
('3d69d81e', '@craft/web/assets/garnish/dist'),
('3e243a0c', '@craft/web/assets/velocity/dist'),
('461870bc', '@craft/web/assets/cp/dist'),
('4862932e', '@craft/web/assets/dashboard/dist'),
('49f1b880', '@craft/web/assets/recententries/dist'),
('551bc7ec', '@craft/web/assets/xregexp/dist'),
('5c2d56f5', '@craft/web/assets/d3/dist'),
('5cb411a1', '@craft/web/assets/htmx/dist'),
('617d8137', '@craft/web/assets/selectize/dist'),
('657a3dc0', '@craft/web/assets/iframeresizer/dist'),
('66683b15', '@craft/web/assets/tailwindreset/dist'),
('676fa285', '@craft/web/assets/velocity/dist'),
('67fa0365', '@craft/web/assets/jqueryui/dist'),
('68fd8c9b', '@craft/web/assets/elementresizedetector/dist'),
('6d1d9373', '@bower/jquery/dist'),
('71b3cc78', '@craft/web/assets/updates/dist'),
('7209f6a7', '@craft/web/assets/prismjs/dist'),
('7981d5ce', '@craft/web/assets/fileupload/dist'),
('7de9b86c', '@nystudio107/codeeditor/web/assets/dist'),
('7e8e265', '@craft/web/assets/picturefill/dist'),
('84186a5f', '@craft/web/assets/elementresizedetector/dist'),
('89a12d9', '@craft/web/assets/timepicker/dist'),
('8fd7a99f', '@craft/web/assets/axios/dist'),
('94a55492', '@craft/web/assets/conditionbuilder/dist'),
('9564330a', '@craft/web/assets/fileupload/dist'),
('97223cc6', '@craft/web/assets/recententries/dist'),
('9ee17a99', '@craft/web/assets/updater/dist'),
('9f021886', '@craft/ckeditor/web/assets/ckeditor/dist'),
('a032b662', '@craft/web/assets/jqueryui/dist'),
('a2b288c7', '@craft/web/assets/iframeresizer/dist'),
('a4db5df1', '@craft/web/assets/fieldsettings/dist'),
('a9987ea8', '@craft/web/assets/updateswidget/dist'),
('a9d38170', '@craft/web/assets/d3/dist'),
('aacde0c1', '@craft/ckeditor/web/assets/ckeconfig/dist'),
('aad52674', '@bower/jquery/dist'),
('b05f077a', '@craft/web/assets/utilities/dist'),
('b3e6a739', '@craft/web/assets/cp/dist'),
('b5392263', '@bower/inputmask/dist'),
('b8bbbf53', '@craft/web/assets/tailwindreset/dist'),
('ba9d9744', '@craft/web/assets/pluginstore/dist'),
('bd9c44ab', '@craft/web/assets/dashboard/dist'),
('be9afcef', '@craft/web/assets/installer/dist'),
('bfae0571', '@craft/web/assets/selectize/dist'),
('c0027d25', '@craft/web/assets/admintable/dist'),
('c0205762', '@craft/web/assets/picturefill/dist'),
('c505f65', '@craft/web/assets/xregexp/dist'),
('c5bb0361', '@craft/web/assets/focalpoint/dist'),
('c6e2f043', '@craft/web/assets/money/dist'),
('d18c3eda', '@craft/web/assets/garnish/dist'),
('e3488a1', '@craft/web/assets/craftsupport/dist'),
('e9149ff3', '@craft/web/assets/utilities/dist'),
('eb7b49b9', '@craft/web/assets/userpermissions/dist'),
('f7cc0dd0', '@craft/web/assets/sites/dist'),
('f93e09cd', '@craft/web/assets/fabric/dist'),
('fbca5f24', '@craft/web/assets/craftsupport/dist'),
('fc2852de', '@craft/web/assets/jquerytouchevents/dist'),
('fc7b8dbc', '@craft/web/assets/jquerypayment/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE IF NOT EXISTS `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uftupcksyisjgoxmlnwdjtfadqnnzanjfnzb` (`canonicalId`,`num`),
  KEY `fk_ahathhwdurvhqeubzmtgttatbvqlatogrhna` (`creatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 159, 1, ''),
(2, 4, 159, 1, NULL),
(3, 6, 159, 1, NULL),
(4, 6, 159, 2, ''),
(5, 6, 159, 3, 'Applied “Draft 1”'),
(6, 6, 159, 4, ''),
(7, 12, 159, 1, NULL),
(8, 12, 159, 2, 'Applied “Draft 1”'),
(9, 12, 159, 3, 'Applied “Draft 1”'),
(10, 12, 159, 4, NULL),
(11, 12, 159, 5, NULL),
(12, 12, 159, 6, 'Applied “Draft 1”'),
(13, 12, 159, 7, ''),
(14, 12, 159, 8, 'Applied “Draft 1”'),
(15, 12, 159, 9, 'Applied “Draft 1”'),
(16, 12, 159, 10, 'Applied “Draft 1”'),
(17, 12, 159, 11, 'Applied “Draft 1”'),
(18, 12, 159, 12, 'Applied “Draft 1”'),
(19, 12, 159, 13, ''),
(20, 12, 159, 14, NULL),
(21, 12, 159, 15, NULL),
(22, 12, 159, 16, 'Applied “Draft 1”'),
(23, 12, 159, 17, 'Applied “Draft 1”'),
(24, 12, 159, 18, 'Applied “Draft 1”'),
(25, 51, 159, 1, ''),
(26, 64, 159, 1, ''),
(27, 66, 159, 1, ''),
(28, 68, 159, 1, ''),
(29, 70, 159, 1, ''),
(30, 72, 159, 1, ''),
(31, 72, 159, 2, ''),
(32, 12, 159, 19, 'Applied “Draft 1”'),
(33, 12, 159, 20, 'Applied “Draft 1”'),
(34, 80, 159, 1, ''),
(35, 68, 159, 2, 'Applied “Draft 1”'),
(36, 84, 159, 1, ''),
(37, 51, 159, 2, 'Applied “Draft 1”'),
(38, 88, 159, 1, ''),
(39, 72, 159, 3, 'Applied “Draft 1”'),
(40, 92, 159, 1, ''),
(41, 64, 159, 2, 'Applied “Draft 1”'),
(42, 96, 159, 1, ''),
(43, 66, 159, 2, 'Applied “Draft 1”'),
(44, 70, 159, 2, 'Applied “Draft 1”'),
(45, 102, 159, 1, NULL),
(46, 68, 159, 3, 'Applied “Draft 1”'),
(47, 107, 159, 1, NULL),
(48, 108, 159, 1, NULL),
(49, 113, 159, 1, ''),
(50, 115, 159, 1, ''),
(51, 117, 159, 1, ''),
(52, 119, 159, 1, ''),
(53, 68, 159, 4, 'Applied “Draft 1”'),
(54, 123, 159, 1, ''),
(55, 51, 159, 3, 'Applied “Draft 1”'),
(56, 51, 159, 4, ''),
(57, 72, 159, 4, 'Applied “Draft 1”'),
(58, 64, 159, 3, 'Applied “Draft 1”'),
(59, 66, 159, 3, 'Applied “Draft 1”'),
(60, 70, 159, 3, 'Applied “Draft 1”'),
(61, 137, 159, 1, NULL),
(62, 145, 159, 1, ''),
(63, 70, 159, 4, 'Applied “Draft 1”'),
(64, 12, 159, 21, NULL),
(65, 12, 159, 22, 'Applied “Draft 1”'),
(66, 150, 159, 1, NULL),
(67, 151, 159, 1, NULL),
(68, 152, 159, 1, NULL),
(69, 153, 159, 1, NULL),
(70, 160, 159, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE IF NOT EXISTS `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' robin braibant pxl be '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' robin braibant pxl be '),
(2, 'slug', 0, 1, ' test '),
(2, 'title', 0, 1, ' test '),
(4, 'slug', 0, 1, ' startpagina '),
(4, 'title', 0, 1, ' startpagina '),
(6, 'field', 2, 1, ' dit is de intro van de pagina '),
(6, 'slug', 0, 1, ' startpagina '),
(6, 'title', 0, 1, ' startpagina vanuit backend '),
(12, 'field', 6, 1, ' welkom find your preferred sneakers now '),
(12, 'field', 6, 3, ' welcome find your preferred sneakers now '),
(12, 'field', 7, 1, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(12, 'field', 7, 3, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(12, 'field', 17, 1, ' dit is voorbeeld tekst team dit is uitleg over de afbeelding dit is tweede voorbeeldtekst '),
(12, 'field', 17, 3, ''),
(12, 'slug', 0, 1, ' startpagina '),
(12, 'slug', 0, 3, ' startpagina '),
(12, 'title', 0, 1, ' startpagina '),
(12, 'title', 0, 3, ' startpagina '),
(18, 'alt', 0, 1, ''),
(18, 'extension', 0, 1, ' jpg '),
(18, 'filename', 0, 1, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(18, 'kind', 0, 1, ' image '),
(18, 'slug', 0, 1, ''),
(18, 'title', 0, 1, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(19, 'alt', 0, 1, ''),
(19, 'extension', 0, 1, ' jpg '),
(19, 'filename', 0, 1, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(19, 'kind', 0, 1, ' image '),
(19, 'slug', 0, 1, ''),
(19, 'title', 0, 1, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(20, 'alt', 0, 1, ''),
(20, 'extension', 0, 1, ' jpg '),
(20, 'filename', 0, 1, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(20, 'kind', 0, 1, ' image '),
(20, 'slug', 0, 1, ''),
(20, 'title', 0, 1, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(21, 'alt', 0, 1, ''),
(21, 'extension', 0, 1, ' png '),
(21, 'filename', 0, 1, ' 7db png '),
(21, 'kind', 0, 1, ' image '),
(21, 'slug', 0, 1, ''),
(21, 'title', 0, 1, ' 7db '),
(22, 'alt', 0, 1, ''),
(22, 'extension', 0, 1, ' jpg '),
(22, 'filename', 0, 1, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(22, 'kind', 0, 1, ' image '),
(22, 'slug', 0, 1, ''),
(22, 'title', 0, 1, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(33, 'alt', 0, 1, ''),
(33, 'extension', 0, 1, ' jpg '),
(33, 'filename', 0, 1, ' andre tan humxycozc00 unsplash 683x1024 jpg '),
(33, 'kind', 0, 1, ' image '),
(33, 'slug', 0, 1, ''),
(33, 'title', 0, 1, ' andre tan hum xyc oz c00 unsplash 683x1024 '),
(45, 'alt', 0, 1, ''),
(45, 'alt', 0, 2, ''),
(45, 'alt', 0, 3, ''),
(45, 'extension', 0, 1, ' jpg '),
(45, 'extension', 0, 2, ' jpg '),
(45, 'extension', 0, 3, ' jpg '),
(45, 'filename', 0, 1, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(45, 'filename', 0, 2, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(45, 'filename', 0, 3, ' andre tan humxycozc00 unsplash 1 683x1024 jpg '),
(45, 'kind', 0, 1, ' image '),
(45, 'kind', 0, 2, ' image '),
(45, 'kind', 0, 3, ' image '),
(45, 'slug', 0, 1, ''),
(45, 'slug', 0, 2, ''),
(45, 'slug', 0, 3, ''),
(45, 'title', 0, 1, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(45, 'title', 0, 2, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(45, 'title', 0, 3, ' andre tan hum xyc oz c00 unsplash 1 683x1024 '),
(51, 'field', 8, 1, ' gallery 1 '),
(51, 'field', 8, 3, ' gallery 1 '),
(51, 'field', 10, 1, ''),
(51, 'field', 10, 3, ''),
(51, 'field', 16, 1, ' blauw '),
(51, 'field', 16, 3, ' blauw '),
(51, 'slug', 0, 1, ' yeezy boost 700 hi res blue '),
(51, 'slug', 0, 3, ' yeezy boost 700 hi res blue '),
(51, 'title', 0, 1, ' yeezy boost 700 hi res blue '),
(51, 'title', 0, 3, ' yeezy boost 700 hi res blue '),
(52, 'alt', 0, 1, ''),
(52, 'alt', 0, 2, ''),
(52, 'alt', 0, 3, ''),
(52, 'extension', 0, 1, ' jpg '),
(52, 'extension', 0, 2, ' jpg '),
(52, 'extension', 0, 3, ' jpg '),
(52, 'filename', 0, 1, ' bg jpg '),
(52, 'filename', 0, 2, ' bg jpg '),
(52, 'filename', 0, 3, ' bg jpg '),
(52, 'kind', 0, 1, ' image '),
(52, 'kind', 0, 2, ' image '),
(52, 'kind', 0, 3, ' image '),
(52, 'slug', 0, 1, ''),
(52, 'slug', 0, 2, ''),
(52, 'slug', 0, 3, ''),
(52, 'title', 0, 1, ' bg '),
(52, 'title', 0, 2, ' bg '),
(52, 'title', 0, 3, ' bg '),
(53, 'alt', 0, 1, ''),
(53, 'alt', 0, 2, ''),
(53, 'alt', 0, 3, ''),
(53, 'extension', 0, 1, ' jpg '),
(53, 'extension', 0, 2, ' jpg '),
(53, 'extension', 0, 3, ' jpg '),
(53, 'filename', 0, 1, ' gallery 1 jpg '),
(53, 'filename', 0, 2, ' gallery 1 jpg '),
(53, 'filename', 0, 3, ' gallery 1 jpg '),
(53, 'kind', 0, 1, ' image '),
(53, 'kind', 0, 2, ' image '),
(53, 'kind', 0, 3, ' image '),
(53, 'slug', 0, 1, ''),
(53, 'slug', 0, 2, ''),
(53, 'slug', 0, 3, ''),
(53, 'title', 0, 1, ' gallery 1 '),
(53, 'title', 0, 2, ' gallery 1 '),
(53, 'title', 0, 3, ' gallery 1 '),
(54, 'alt', 0, 1, ''),
(54, 'alt', 0, 2, ''),
(54, 'alt', 0, 3, ''),
(54, 'extension', 0, 1, ' jpg '),
(54, 'extension', 0, 2, ' jpg '),
(54, 'extension', 0, 3, ' jpg '),
(54, 'filename', 0, 1, ' gallery 2 jpg '),
(54, 'filename', 0, 2, ' gallery 2 jpg '),
(54, 'filename', 0, 3, ' gallery 2 jpg '),
(54, 'kind', 0, 1, ' image '),
(54, 'kind', 0, 2, ' image '),
(54, 'kind', 0, 3, ' image '),
(54, 'slug', 0, 1, ''),
(54, 'slug', 0, 2, ''),
(54, 'slug', 0, 3, ''),
(54, 'title', 0, 1, ' gallery 2 '),
(54, 'title', 0, 2, ' gallery 2 '),
(54, 'title', 0, 3, ' gallery 2 '),
(55, 'alt', 0, 1, ''),
(55, 'alt', 0, 2, ''),
(55, 'alt', 0, 3, ''),
(55, 'extension', 0, 1, ' jpg '),
(55, 'extension', 0, 2, ' jpg '),
(55, 'extension', 0, 3, ' jpg '),
(55, 'filename', 0, 1, ' gallery 3 jpg '),
(55, 'filename', 0, 2, ' gallery 3 jpg '),
(55, 'filename', 0, 3, ' gallery 3 jpg '),
(55, 'kind', 0, 1, ' image '),
(55, 'kind', 0, 2, ' image '),
(55, 'kind', 0, 3, ' image '),
(55, 'slug', 0, 1, ''),
(55, 'slug', 0, 2, ''),
(55, 'slug', 0, 3, ''),
(55, 'title', 0, 1, ' gallery 3 '),
(55, 'title', 0, 2, ' gallery 3 '),
(55, 'title', 0, 3, ' gallery 3 '),
(56, 'alt', 0, 1, ''),
(56, 'alt', 0, 2, ''),
(56, 'alt', 0, 3, ''),
(56, 'extension', 0, 1, ' jpg '),
(56, 'extension', 0, 2, ' jpg '),
(56, 'extension', 0, 3, ' jpg '),
(56, 'filename', 0, 1, ' gallery 4 jpg '),
(56, 'filename', 0, 2, ' gallery 4 jpg '),
(56, 'filename', 0, 3, ' gallery 4 jpg '),
(56, 'kind', 0, 1, ' image '),
(56, 'kind', 0, 2, ' image '),
(56, 'kind', 0, 3, ' image '),
(56, 'slug', 0, 1, ''),
(56, 'slug', 0, 2, ''),
(56, 'slug', 0, 3, ''),
(56, 'title', 0, 1, ' gallery 4 '),
(56, 'title', 0, 2, ' gallery 4 '),
(56, 'title', 0, 3, ' gallery 4 '),
(57, 'alt', 0, 1, ''),
(57, 'alt', 0, 2, ''),
(57, 'alt', 0, 3, ''),
(57, 'extension', 0, 1, ' jpg '),
(57, 'extension', 0, 2, ' jpg '),
(57, 'extension', 0, 3, ' jpg '),
(57, 'filename', 0, 1, ' gallery 5 jpg '),
(57, 'filename', 0, 2, ' gallery 5 jpg '),
(57, 'filename', 0, 3, ' gallery 5 jpg '),
(57, 'kind', 0, 1, ' image '),
(57, 'kind', 0, 2, ' image '),
(57, 'kind', 0, 3, ' image '),
(57, 'slug', 0, 1, ''),
(57, 'slug', 0, 2, ''),
(57, 'slug', 0, 3, ''),
(57, 'title', 0, 1, ' gallery 5 '),
(57, 'title', 0, 2, ' gallery 5 '),
(57, 'title', 0, 3, ' gallery 5 '),
(58, 'alt', 0, 1, ''),
(58, 'alt', 0, 2, ''),
(58, 'alt', 0, 3, ''),
(58, 'extension', 0, 1, ' jpg '),
(58, 'extension', 0, 2, ' jpg '),
(58, 'extension', 0, 3, ' jpg '),
(58, 'filename', 0, 1, ' gallery 6 jpg '),
(58, 'filename', 0, 2, ' gallery 6 jpg '),
(58, 'filename', 0, 3, ' gallery 6 jpg '),
(58, 'kind', 0, 1, ' image '),
(58, 'kind', 0, 2, ' image '),
(58, 'kind', 0, 3, ' image '),
(58, 'slug', 0, 1, ''),
(58, 'slug', 0, 2, ''),
(58, 'slug', 0, 3, ''),
(58, 'title', 0, 1, ' gallery 6 '),
(58, 'title', 0, 2, ' gallery 6 '),
(58, 'title', 0, 3, ' gallery 6 '),
(59, 'alt', 0, 1, ''),
(59, 'alt', 0, 2, ''),
(59, 'alt', 0, 3, ''),
(59, 'extension', 0, 1, ' jpg '),
(59, 'extension', 0, 2, ' jpg '),
(59, 'extension', 0, 3, ' jpg '),
(59, 'filename', 0, 1, ' nav img 1 jpg '),
(59, 'filename', 0, 2, ' nav img 1 jpg '),
(59, 'filename', 0, 3, ' nav img 1 jpg '),
(59, 'kind', 0, 1, ' image '),
(59, 'kind', 0, 2, ' image '),
(59, 'kind', 0, 3, ' image '),
(59, 'slug', 0, 1, ''),
(59, 'slug', 0, 2, ''),
(59, 'slug', 0, 3, ''),
(59, 'title', 0, 1, ' nav img 1 '),
(59, 'title', 0, 2, ' nav img 1 '),
(59, 'title', 0, 3, ' nav img 1 '),
(60, 'alt', 0, 1, ''),
(60, 'alt', 0, 2, ''),
(60, 'alt', 0, 3, ''),
(60, 'extension', 0, 1, ' jpg '),
(60, 'extension', 0, 2, ' jpg '),
(60, 'extension', 0, 3, ' jpg '),
(60, 'filename', 0, 1, ' nav img 2 jpg '),
(60, 'filename', 0, 2, ' nav img 2 jpg '),
(60, 'filename', 0, 3, ' nav img 2 jpg '),
(60, 'kind', 0, 1, ' image '),
(60, 'kind', 0, 2, ' image '),
(60, 'kind', 0, 3, ' image '),
(60, 'slug', 0, 1, ''),
(60, 'slug', 0, 2, ''),
(60, 'slug', 0, 3, ''),
(60, 'title', 0, 1, ' nav img 2 '),
(60, 'title', 0, 2, ' nav img 2 '),
(60, 'title', 0, 3, ' nav img 2 '),
(61, 'alt', 0, 1, ''),
(61, 'alt', 0, 2, ''),
(61, 'alt', 0, 3, ''),
(61, 'extension', 0, 1, ' jpg '),
(61, 'extension', 0, 2, ' jpg '),
(61, 'extension', 0, 3, ' jpg '),
(61, 'filename', 0, 1, ' nav img 3 jpg '),
(61, 'filename', 0, 2, ' nav img 3 jpg '),
(61, 'filename', 0, 3, ' nav img 3 jpg '),
(61, 'kind', 0, 1, ' image '),
(61, 'kind', 0, 2, ' image '),
(61, 'kind', 0, 3, ' image '),
(61, 'slug', 0, 1, ''),
(61, 'slug', 0, 2, ''),
(61, 'slug', 0, 3, ''),
(61, 'title', 0, 1, ' nav img 3 '),
(61, 'title', 0, 2, ' nav img 3 '),
(61, 'title', 0, 3, ' nav img 3 '),
(62, 'alt', 0, 1, ''),
(62, 'alt', 0, 2, ''),
(62, 'alt', 0, 3, ''),
(62, 'extension', 0, 1, ' jpg '),
(62, 'extension', 0, 2, ' jpg '),
(62, 'extension', 0, 3, ' jpg '),
(62, 'filename', 0, 1, ' team jpg '),
(62, 'filename', 0, 2, ' team jpg '),
(62, 'filename', 0, 3, ' team jpg '),
(62, 'kind', 0, 1, ' image '),
(62, 'kind', 0, 2, ' image '),
(62, 'kind', 0, 3, ' image '),
(62, 'slug', 0, 1, ''),
(62, 'slug', 0, 2, ''),
(62, 'slug', 0, 3, ''),
(62, 'title', 0, 1, ' team '),
(62, 'title', 0, 2, ' team '),
(62, 'title', 0, 3, ' team '),
(64, 'field', 8, 1, ' gallery 2 '),
(64, 'field', 8, 3, ' gallery 2 '),
(64, 'field', 10, 1, ''),
(64, 'field', 10, 3, ''),
(64, 'field', 16, 1, ' zwart '),
(64, 'field', 16, 3, ' zwart '),
(64, 'slug', 0, 1, ' air jordan 4 retro se black canvas '),
(64, 'slug', 0, 3, ' air jordan 4 retro se black canvas '),
(64, 'title', 0, 1, ' air jordan 4 retro se black canvas '),
(64, 'title', 0, 3, ' air jordan 4 retro se black canvas '),
(66, 'field', 8, 1, ' gallery 3 '),
(66, 'field', 8, 3, ' gallery 3 '),
(66, 'field', 10, 1, ''),
(66, 'field', 10, 3, ''),
(66, 'field', 16, 1, ' geel '),
(66, 'field', 16, 3, ' geel '),
(66, 'slug', 0, 1, ' wtaps x authentic syndicate wings '),
(66, 'slug', 0, 3, ' wtaps x authentic syndicate wings '),
(66, 'title', 0, 1, ' wtaps x authentic syndicate wings '),
(66, 'title', 0, 3, ' wtaps x authentic syndicate wings '),
(68, 'field', 8, 1, ' gallery 4 '),
(68, 'field', 8, 3, ' gallery 4 '),
(68, 'field', 10, 1, ''),
(68, 'field', 10, 3, ''),
(68, 'field', 16, 1, ' wit '),
(68, 'field', 16, 3, ' wit '),
(68, 'slug', 0, 1, ' undefeated x zoom kobe 1 protro white gum '),
(68, 'slug', 0, 3, ' undefeated x zoom kobe 1 protro white gum '),
(68, 'title', 0, 1, ' undefeated x zoom kobe 1 protro white gum '),
(68, 'title', 0, 3, ' undefeated x zoom kobe 1 protro white gum '),
(70, 'field', 8, 1, ' gallery 5 '),
(70, 'field', 8, 3, ' gallery 5 '),
(70, 'field', 10, 1, ''),
(70, 'field', 10, 3, ''),
(70, 'field', 16, 1, ' rood '),
(70, 'field', 16, 3, ' rood '),
(70, 'slug', 0, 1, ' air jordan 4 retro red thunder '),
(70, 'slug', 0, 3, ' air jordan 4 retro red thunder '),
(70, 'title', 0, 1, ' air jordan 4 retro red thunder '),
(70, 'title', 0, 3, ' air jordan 4 retro red thunder '),
(72, 'field', 8, 1, ' gallery 6 '),
(72, 'field', 8, 3, ' gallery 6 '),
(72, 'field', 10, 1, ''),
(72, 'field', 10, 3, ''),
(72, 'field', 16, 1, ' groen '),
(72, 'field', 16, 3, ' groen '),
(72, 'slug', 0, 1, ' off white x air force 1 low brooklyn '),
(72, 'slug', 0, 3, ' off white x air force 1 low brooklyn '),
(72, 'title', 0, 1, ' off white x air force 1 low brooklyn '),
(72, 'title', 0, 3, ' off white x air force 1 low brooklyn '),
(79, 'field', 12, 1, ' https www instagram com '),
(79, 'slug', 0, 1, ''),
(80, 'slug', 0, 1, ' wit '),
(80, 'title', 0, 1, ' wit '),
(84, 'slug', 0, 1, ' blauw '),
(84, 'title', 0, 1, ' blauw '),
(88, 'slug', 0, 1, ' groen '),
(88, 'title', 0, 1, ' groen '),
(92, 'slug', 0, 1, ' zwart '),
(92, 'title', 0, 1, ' zwart '),
(96, 'slug', 0, 1, ' geel '),
(96, 'title', 0, 1, ' geel '),
(102, 'slug', 0, 1, ' sneakers overzicht '),
(102, 'title', 0, 1, ' sneakers overzicht '),
(107, 'field', 10, 1, ' dit is een voorbeeldtekst '),
(107, 'slug', 0, 1, ' tekst blok '),
(107, 'title', 0, 1, ' tekst blok '),
(108, 'field', 8, 1, ' team '),
(108, 'slug', 0, 1, ' afbeelding blok '),
(108, 'title', 0, 1, ' afbeelding blok '),
(112, 'field', 15, 1, ' https www instagram com '),
(112, 'slug', 0, 1, ''),
(113, 'slug', 0, 1, ' zwart '),
(113, 'title', 0, 1, ' zwart '),
(115, 'slug', 0, 1, ' geel '),
(115, 'title', 0, 1, ' geel '),
(117, 'slug', 0, 1, ' wit '),
(117, 'title', 0, 1, ' wit '),
(119, 'slug', 0, 1, ' groen '),
(119, 'title', 0, 1, ' groen '),
(123, 'slug', 0, 1, ' blauw '),
(123, 'title', 0, 1, ' blauw '),
(136, 'field', 8, 1, ' gallery 4 '),
(136, 'field', 8, 3, ' gallery 4 '),
(136, 'field', 10, 1, ''),
(136, 'field', 10, 3, ''),
(136, 'field', 16, 1, ' wit geel '),
(136, 'field', 16, 3, ' wit geel '),
(136, 'slug', 0, 1, ' undefeated x zoom kobe 1 protro white gum '),
(136, 'slug', 0, 3, ' undefeated x zoom kobe 1 protro white gum '),
(136, 'title', 0, 1, ' undefeated x zoom kobe 1 protro white gum '),
(136, 'title', 0, 3, ' undefeated x zoom kobe 1 protro white gum '),
(137, 'slug', 0, 1, ' sneakers overzicht '),
(137, 'title', 0, 1, ' sneakers overzicht '),
(144, 'field', 18, 1, ' https www facebook com '),
(144, 'field', 18, 2, ' https www facebook com '),
(144, 'field', 18, 3, ' https www facebook com '),
(144, 'slug', 0, 1, ''),
(144, 'slug', 0, 2, ''),
(144, 'slug', 0, 3, ''),
(145, 'slug', 0, 1, ' rood '),
(145, 'title', 0, 1, ' rood '),
(150, 'field', 10, 1, ' dit is voorbeeld tekst '),
(150, 'field', 10, 3, ' dit is voorbeeld tekst '),
(150, 'slug', 0, 1, ' tekst '),
(150, 'slug', 0, 3, ' tekst '),
(150, 'title', 0, 1, ' tekst '),
(150, 'title', 0, 3, ' tekst '),
(151, 'field', 8, 1, ' team '),
(151, 'field', 8, 3, ' team '),
(151, 'slug', 0, 1, ' afbeelding '),
(151, 'slug', 0, 3, ' afbeelding '),
(151, 'title', 0, 1, ' afbeelding '),
(151, 'title', 0, 3, ' afbeelding '),
(152, 'field', 10, 1, ' dit is uitleg over de afbeelding '),
(152, 'field', 10, 3, ' dit is uitleg over de afbeelding '),
(152, 'slug', 0, 1, ' tekst '),
(152, 'slug', 0, 3, ' tekst '),
(152, 'title', 0, 1, ' tekst '),
(152, 'title', 0, 3, ' tekst '),
(153, 'field', 10, 1, ' dit is tweede voorbeeldtekst '),
(153, 'field', 10, 3, ' dit is tweede voorbeeldtekst '),
(153, 'slug', 0, 1, ' tekst '),
(153, 'slug', 0, 3, ' tekst '),
(153, 'title', 0, 1, ' tekst '),
(153, 'title', 0, 3, ' tekst '),
(159, 'email', 0, 1, ' student pxl be '),
(159, 'firstname', 0, 1, ' pxl '),
(159, 'fullname', 0, 1, ' pxl '),
(159, 'lastname', 0, 1, ''),
(159, 'slug', 0, 1, ''),
(159, 'username', 0, 1, ' student '),
(160, 'slug', 0, 1, ' login '),
(160, 'slug', 0, 3, ' login '),
(160, 'title', 0, 1, ' login '),
(160, 'title', 0, 3, ' login ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint UNSIGNED NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zkxftifpmqkyctsltoxuzfzchlxqagqpryai` (`handle`),
  KEY `idx_icgzhvkxutnpqqpcretpuvuhatllrnmkoqzn` (`name`),
  KEY `idx_ghvkqsdumlatfxrlobzvvtzmhgrlbghrsjyc` (`structureId`),
  KEY `idx_apqnzqycwalydffpluqzbnworagdutlgsytr` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `maxAuthors`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Nieuws', 'news', 'channel', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-04-16 07:08:32', '2024-04-16 07:08:32', '2024-04-22 07:33:58', '662f9448-fab5-4356-b2b0-33ede11ba635'),
(2, NULL, 'Startpagina', 'startpagina', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-04-22 07:38:07', '2024-04-22 07:38:07', '2024-04-22 09:23:57', '64605c77-c47b-47c8-8efe-f0cfd78a7ae7'),
(3, NULL, 'Startpagina', 'home', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-04-22 12:05:02', '2024-04-22 12:05:02', '2024-04-22 13:45:48', '761d7c3a-8103-4449-88b6-55a370d8e919'),
(4, NULL, 'Startpagina', 'home', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-04-22 14:45:20', '2024-04-22 14:45:20', NULL, '3d5ebfb2-b58d-4890-8705-cfc6be3e7f84'),
(5, NULL, 'Nieuws', 'news', 'channel', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-04-23 10:15:26', '2024-04-23 10:15:26', '2024-04-29 12:18:36', 'a6038e4b-369b-4f22-a519-75fa7e2f3942'),
(6, 1, 'Sneakers', 'sneakers', 'structure', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-06 07:21:30', '2024-05-06 07:21:30', NULL, 'dea38989-2ed2-4db7-bc89-0bd073d6c182'),
(7, 2, 'Kleuren', 'colors', 'structure', 1, 1, 'all', 'end', NULL, '2024-05-13 06:15:03', '2024-05-13 06:15:03', '2024-05-13 08:26:08', '4223647b-cae8-4487-a1d4-c75e5231d837'),
(8, NULL, 'Sneakers Overzicht', 'sneakersOverview', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-13 06:25:59', '2024-05-13 06:25:59', '2024-05-13 08:26:05', '43038afd-b9a1-42b6-ad04-273162c50bb1'),
(9, 3, 'Kleuren', 'colors', 'structure', 1, 1, 'all', 'end', NULL, '2024-05-13 12:10:39', '2024-05-13 12:10:39', NULL, 'cdb3ab49-66fb-4582-ad6d-51195eb25204'),
(10, NULL, 'Sneakers Overzicht', 'sneakersOverview', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-13 12:45:57', '2024-05-13 12:45:57', NULL, 'f1299ccc-119c-44ac-ab0f-ba5dda4b5006'),
(11, NULL, 'Login', 'login', 'single', 1, 1, 'all', 'end', '[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]', '2024-05-28 07:08:28', '2024-05-28 07:08:28', '2024-06-04 14:52:39', '018fd177-ef58-4010-9804-b3fa8393977b');

-- --------------------------------------------------------

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
CREATE TABLE IF NOT EXISTS `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_egyebmxiyharchenwzrzornyjqbcyfzzumkd` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sections_entrytypes`
--

INSERT INTO `sections_entrytypes` (`sectionId`, `typeId`, `sortOrder`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 11, 1),
(10, 12, 1),
(11, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE IF NOT EXISTS `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_snyfahlflyuimwvqjhwttlwyrlhmkjwcabch` (`sectionId`,`siteId`),
  KEY `idx_aoyndsumxgyibvnilozuxqzhbwbvkczlgnte` (`siteId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'nieuws/{slug}', '_news/_entry.twig', 1, '2024-04-16 07:08:32', '2024-04-16 07:08:32', 'db387b6b-8dee-4988-9d0f-52a7184457c8'),
(2, 2, 1, 1, '__home__', 'index.twig', 1, '2024-04-22 07:38:07', '2024-04-22 07:38:07', 'fa4dc320-3544-4566-b283-789a8bb1badb'),
(3, 3, 1, 1, '__home__', 'index.twig', 1, '2024-04-22 12:05:02', '2024-04-22 12:05:02', 'd5a4a1dc-b738-4302-9850-2e37b2371e65'),
(4, 4, 1, 1, '__home__', '_index.twig', 1, '2024-04-22 14:45:20', '2024-04-29 14:20:58', 'feeffec1-ac6b-4410-952e-3fcdc5b320a6'),
(5, 5, 1, 1, 'nieuws/{slug}', '_news/_entry.twig', 1, '2024-04-23 10:15:26', '2024-04-23 10:15:26', 'ce03d5f5-4b97-4363-88dc-77161a8bf13d'),
(6, 6, 1, 1, 'our-sneakers/{slug}', '_sneakers/_entry.twig', 1, '2024-05-06 07:21:30', '2024-05-06 07:21:30', '138a2c03-d662-483c-8c7c-f4936d919e86'),
(7, 7, 1, 0, NULL, NULL, 1, '2024-05-13 06:15:03', '2024-05-13 06:15:03', '5659a51f-0ba3-4e56-a465-62007feccdd4'),
(8, 8, 1, 1, 'our-sneakers', '_sneakers/_index.twig', 1, '2024-05-13 06:25:59', '2024-05-13 06:25:59', 'b557f42c-66e2-4746-b368-30748dd1b06e'),
(9, 9, 1, 0, NULL, NULL, 1, '2024-05-13 12:10:39', '2024-05-13 12:10:39', 'd0798a06-6734-4a00-bd76-0e07555b92b4'),
(10, 10, 1, 1, 'our-sneakers', '_sneakers/_overview.twig', 1, '2024-05-13 12:45:57', '2024-05-13 12:45:57', 'b41d254d-c016-4e0d-83d9-d7fa2eb76d80'),
(11, 4, 3, 1, '__home__', '_index.twig', 1, '2024-05-27 14:03:45', '2024-05-27 14:03:45', '87231f55-69f4-4079-8f70-a440d442f4b8'),
(12, 6, 3, 1, 'our-sneakers/{slug}', '_sneakers/_entry.twig', 1, '2024-05-27 14:05:45', '2024-05-27 14:05:45', 'dc54298d-1a9a-4264-b51f-0665c7088233'),
(13, 11, 3, 1, 'login', '_login.twig', 1, '2024-05-28 07:08:28', '2024-05-28 07:08:28', '90d06b22-fd30-4d27-ab43-1873bcc7016f'),
(14, 11, 1, 1, 'login', '_login.twig', 1, '2024-05-28 07:08:28', '2024-05-28 07:08:28', 'b905685d-7737-414f-b58b-3b355f5a4210');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE IF NOT EXISTS `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mjyyvxhhjtaqpxqzgcybihlhaygitowtegcl` (`uid`),
  KEY `idx_gugbfgnuapszacqtsqglpkopqpubdfzxdtpe` (`token`),
  KEY `idx_vuwomnygvtshotdcbvzwauwybtvmhvtixhuv` (`dateUpdated`),
  KEY `idx_oqfypvbhunrmveewobedxkitgcspuvkbirqc` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(12, 1, 'uQXhAfUACuew9asH9rFK0VqaCVhrCRl8IUBlePlaDcDPi76QCrw8kX4k78hEtKbuK2v_P62SfWrRNAnqPGPU45AMuvAqIzKB6NSB', '2024-04-30 09:52:10', '2024-04-30 10:03:14', '3851ab16-08b3-4a88-ad1a-22d9f0897bec'),
(13, 1, 'vLRtuQG5O4LY3npuPBsHQpDlj9rv2kZhlu3Xeof668NHpIo_4QJ9uvawgHL4_vdrAIQRuP00ORefpmb3iLRknWV7ec5KgNlumB9D', '2024-05-06 07:17:56', '2024-05-06 09:07:53', 'b4f9059d-810f-4147-8faa-99163a8867e0'),
(14, 1, 'gDXWF_4RA8s2O4-yUFp8duAmeZKy9yNxfFp8aOkV1FQoSEfHX_G9UoE6W0wXN0K7DTcjSz6NLXIM81JP9yDoS7XnwC5DtQxagXbm', '2024-05-06 11:33:14', '2024-05-06 15:47:48', 'e95907e2-b8f9-447b-a574-7fa77ea9b87a'),
(15, 1, 'vkqmi4y-9CpWr1fBbp6wd_fXdrm_53SH3I9U0Vayt1kB6jPBPctfWE23-YO8FcLLH8mpkH1_WSSjBWX7MjEubdJZN6B4ZnmDCfsw', '2024-05-13 06:01:55', '2024-05-13 08:26:30', '22b0acd2-131c-4c21-8245-d88a9a5a3381'),
(16, 1, 'WbV0ufGbHnTr_p_kkmbefDyAYwrFNAq9ZDgraN35I68N9xTCqJ2hPFeRCfZPYHK5LTtBfZlYLfWza0VUaudVLXt01hheeiiERO0a', '2024-05-13 11:49:31', '2024-05-13 16:03:37', '3ca728eb-8662-4aa5-a986-351f6678a012'),
(17, 1, 'GBdRiSPNHLyOgktCOPIp77XzR03QIVEGSc_EtqH-3qnFexTsYGqU3yWtpAUDg4fPpAaoOYowS3XUVNRWgsD5qNebGWKJaw3DGoyH', '2024-05-27 10:01:17', '2024-05-27 11:04:40', '601d9e8e-50e9-4dc9-8e46-91fb97c40649'),
(19, 1, '8rQMxUs8PYOporHLcjlVB8U32BJgipeuLqkuCDu6-UL-T2HZCuGb-NBVAhk2oSTFsqmHFTw4Ajsc4R93tp2YJxhi1TzeJR6t3FKa', '2024-05-28 06:45:17', '2024-05-28 07:04:15', '1a01b818-8eec-40d7-b3c6-c7159456c18a'),
(20, 1, 'ygRfcaxf-W_ghIpcaGArimOhp8IH839QDPYfQ66EOkWLG4roGSZ7NXhJvTf_kMlM5oWl16hxb2JWRYpwrPNaekTRIOBNBWFKV00G', '2024-05-28 07:04:15', '2024-05-28 07:08:54', 'e82ec5ab-c528-403b-9772-63bd17003bba'),
(22, 1, 'leuSytC80_F9K_UHxDhFRXbZyVO8MkgUYM86qMaCfzrnjPzBF3X7Z1vu1SkTYBfpwoBAGUNINwSCg-4LSpjyZtla1q3mA_FIuBEA', '2024-06-04 14:40:13', '2024-06-04 14:49:30', '4bb8e506-9e37-41ba-97fc-a352cab3ffbd'),
(25, 159, '6OFZ_MHSFHEsAfQsDt88Vj1GRFA7sWoCCtfpglnVCXMvFcDkTsUzM8AZhPKgAAGMG-wg4LDdgGakQpmgSaEormkR8jARH5sXU5xv', '2024-06-04 14:53:50', '2024-06-04 15:19:55', '3ca8224a-3cb2-4f91-b65c-a8ba81397931');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE IF NOT EXISTS `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_natohndoyddevtvhycdwhtnvbuxdnetcxhkc` (`userId`,`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE IF NOT EXISTS `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_alohffkbcfpfhblyuyjnnqfogqdafuxmhpvk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Web Expert', '2024-04-16 07:00:10', '2024-04-16 07:00:10', NULL, 'ac63f299-82f5-4f8b-9f5f-24d1496028ca');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_awecsrntzyisyxbgezyxxdbcjhutgetveznr` (`dateDeleted`),
  KEY `idx_zueiczmrrzukaddqebfcpyohpbkleoqpqizr` (`handle`),
  KEY `idx_koqzqlvuydzskvwfjxgilnkzuemhgnbzjsbh` (`sortOrder`),
  KEY `fk_wrjaypmoomvmgtrjvdfsmecrywijduumhmel` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, '1', 'Web Expert', 'default', 'nl-BE', 1, '$PRIMARY_SITE_URL', 1, '2024-04-16 07:00:10', '2024-05-27 10:01:40', NULL, 'df0d1799-8c87-4030-a2c5-1edfea893380'),
(2, 1, 0, '1', 'fr', 'fr', 'fr-BE', 1, '@baseUrlFr', 2, '2024-05-27 10:55:15', '2024-05-27 10:55:15', '2024-05-27 13:52:57', 'c6f7c03e-6875-4c20-bc0c-437609b8b426'),
(3, 1, 0, '1', 'Web Expert Engels', 'webExpertEngels', 'en-BE', 1, '@baseUrlEn', 2, '2024-05-27 13:59:23', '2024-05-27 14:02:33', NULL, '49adc719-ffd2-491a-832b-7c6defaf41fa');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE IF NOT EXISTS `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED NOT NULL,
  `rgt` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lswvupmczgiwdcymomznkjpbgholjhuaswtq` (`structureId`,`elementId`),
  KEY `idx_iqyzoojbeeqniqbdzkgicidhyxcxaqrzhzeg` (`root`),
  KEY `idx_xybnjgmzroxywjxkvrbtplnknzxmvqoeapxg` (`lft`),
  KEY `idx_gtlhudgwpbzkevubhmqsexdjyejzmullxuds` (`rgt`),
  KEY `idx_ypgeazyvmtwkzvxmucpcflufcuwfgnkldpja` (`level`),
  KEY `idx_opvvqjbbxvjglabcmrbpedbymgmuglvvioqj` (`elementId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `structureelements`
--

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 14, 0, '2024-05-06 07:21:38', '2024-05-06 15:05:26', '3d73489e-707a-4b0a-88bb-358d73bc8173'),
(2, 1, 51, 1, 4, 5, 1, '2024-05-06 07:21:38', '2024-05-06 15:05:26', 'c2e5b36b-afcd-48d8-933c-34ce2c2ff3dd'),
(3, 1, 64, 1, 8, 9, 1, '2024-05-06 07:24:14', '2024-05-06 15:05:26', '2ba131a0-c409-429c-8c49-8ca6f511541e'),
(4, 1, 66, 1, 10, 11, 1, '2024-05-06 07:24:37', '2024-05-06 15:05:26', 'c0b96c31-9edd-4d45-9907-e40d44f4d484'),
(5, 1, 68, 1, 2, 3, 1, '2024-05-06 07:25:02', '2024-05-06 15:05:26', 'ed74163f-f396-4dbf-8bf7-dc35d714313b'),
(6, 1, 70, 1, 12, 13, 1, '2024-05-06 07:25:28', '2024-05-06 15:05:26', 'cdc8f123-044b-422b-a11b-f231a037adf5'),
(7, 1, 72, 1, 6, 7, 1, '2024-05-06 07:25:53', '2024-05-06 15:05:26', '90f38f44-8bcf-46c9-9486-eb9c2fb173dc'),
(8, 2, NULL, 8, 1, 12, 0, '2024-05-13 06:17:14', '2024-05-13 06:19:01', '6da36ce4-a48f-4ecf-90cf-eafc10703c51'),
(9, 2, 80, 8, 2, 3, 1, '2024-05-13 06:17:14', '2024-05-13 06:17:14', '31d1b70b-8543-4168-96f1-614332e9017b'),
(10, 2, 84, 8, 4, 5, 1, '2024-05-13 06:17:39', '2024-05-13 06:17:39', '95a51315-55b6-48a8-8322-fc6b6fef05f6'),
(11, 2, 88, 8, 6, 7, 1, '2024-05-13 06:18:05', '2024-05-13 06:18:05', '6fb08099-7cd1-45a3-9f29-87911a1cc720'),
(12, 2, 92, 8, 8, 9, 1, '2024-05-13 06:18:33', '2024-05-13 06:18:33', '08fcd932-02a7-4ac7-a64d-e210fc1c376b'),
(13, 2, 96, 8, 10, 11, 1, '2024-05-13 06:19:01', '2024-05-13 06:19:01', '11dca1b2-1688-4e8e-addb-2118f2d24140'),
(14, 3, NULL, 14, 1, 14, 0, '2024-05-13 12:11:12', '2024-05-13 15:17:19', '0c85592f-81f3-486b-b9b2-762d58712d77'),
(15, 3, 113, 14, 2, 3, 1, '2024-05-13 12:11:12', '2024-05-13 15:17:19', '86225fce-def9-494c-9099-dc3482fcff07'),
(16, 3, 115, 14, 4, 5, 1, '2024-05-13 12:11:19', '2024-05-13 15:17:19', '2ef78ed5-d7b5-41ea-987e-28e5a7621f00'),
(17, 3, 117, 14, 8, 9, 1, '2024-05-13 12:11:23', '2024-05-13 15:17:19', '06cdfd2d-cec9-48d8-9ab5-7f0c4f7eb195'),
(18, 3, 119, 14, 6, 7, 1, '2024-05-13 12:11:28', '2024-05-13 15:17:19', 'a768f7ef-4c14-48a4-a322-2c2d3c7d6dc7'),
(19, 3, 123, 14, 10, 11, 1, '2024-05-13 12:12:05', '2024-05-13 15:17:19', '3d743d5d-d143-4952-a6b5-ccbec864e086'),
(20, 3, 145, 14, 12, 13, 1, '2024-05-13 14:43:25', '2024-05-13 15:17:19', 'd287d61a-4d56-492d-8373-fe08b218d281');

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
CREATE TABLE IF NOT EXISTS `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jzwjlauhesosgefkcdxdkovgzycphygdrzvv` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, '2024-05-06 07:21:30', '2024-05-06 07:21:30', NULL, '96e28752-5701-4580-bd20-c55aeb9f54ba'),
(2, 1, '2024-05-13 06:15:03', '2024-05-13 06:15:03', '2024-05-13 08:26:08', '3bb82ee2-4068-4202-ba03-38287006fb20'),
(3, 1, '2024-05-13 12:10:39', '2024-05-13 12:10:39', NULL, '862b16ef-8774-4ab2-899a-0bfa90e59b11');

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE IF NOT EXISTS `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ilmddtqiaqclvbdcefhtxkotgnqstpqbkfyg` (`key`,`language`),
  KEY `idx_hqidmysttnrqgnwudwlfhllqgwpwquvqetds` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE IF NOT EXISTS `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iphogifslijnfoaiimtfwwnvsiqfnsypxjwc` (`name`),
  KEY `idx_dqjnwbbrxnskhcekmpfhnsqyhmtsoadjtyfv` (`handle`),
  KEY `idx_gjauipjxioevjzslucetvktvincbhjivzoih` (`dateDeleted`),
  KEY `fk_fgdnouhphpfrpbmjgxbxtdwwxpcarqhvnfjk` (`fieldLayoutId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vhuajheurdlnfmjequwzgftizkvzfqwshcji` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint UNSIGNED DEFAULT NULL,
  `usageCount` tinyint UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_atsmocejpnmdrnnlzsvzaqbpzdcpmopsjlel` (`token`),
  KEY `idx_fhdqofjewzsrnsnlcloehgtlellwvskmctma` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 'Tber0djmqwMfn0QS16glrtAWlmoTQDBC', '[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":12,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]', NULL, NULL, '2024-05-14 14:39:23', '2024-05-13 14:39:23', '2024-05-13 14:39:23', 'eb590271-6620-4e80-8a2a-e0639889ecfb');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE IF NOT EXISTS `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ijsndggxziyhqbrxqjryypkddnaoppbogvrd` (`handle`),
  KEY `idx_vpxymegqdsfjgnpxqwjhhhsmjgcpxwwgeayh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE IF NOT EXISTS `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qyqkdicoecuxprxhobbyymypcvwoitptxbfk` (`groupId`,`userId`),
  KEY `idx_ddgewhhwzcqikfdbhphelgijjqryizqatflb` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE IF NOT EXISTS `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hwrvfvtjmcgzmaclwzzwgdsmujemkfuxpsrg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE IF NOT EXISTS `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qhkuanuzftpnyprbazqmnmoxovseyhdeqhhe` (`permissionId`,`groupId`),
  KEY `idx_sgvoqbtstafrygogjnapqqpdznnklkogozut` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE IF NOT EXISTS `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xsmkuelqkuicvyaerwotwakjnjnltcumzsvc` (`permissionId`,`userId`),
  KEY `idx_jukwgjucajjswblyyzfjtwnewpajkumcwbzn` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE IF NOT EXISTS `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"locale\": null, \"language\": \"en-US\", \"useShapes\": false, \"weekStartDay\": \"1\", \"underlineLinks\": false, \"disableAutofocus\": \"\", \"profileTemplates\": true, \"showFieldHandles\": true, \"showExceptionView\": true, \"alwaysShowFocusRings\": false, \"notificationDuration\": \"5000\", \"enableDebugToolbarForCp\": false, \"enableDebugToolbarForSite\": true}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lptyxeuagbruuddyevqlebnhemwtkrtakuvn` (`active`),
  KEY `idx_bgcjztqjzwszhywvxzesplfobbngutruvvyi` (`locked`),
  KEY `idx_rhqbcrhsmpsoegwihgmhvzlvkucvqbpcjgcf` (`pending`),
  KEY `idx_ryafbvxrancdbcgzfvujmyukzectmddtgjhs` (`suspended`),
  KEY `idx_jhcntmbiuoiugllmcaommwyewrsmtzvcrpeg` (`verificationCode`),
  KEY `idx_civnxyetcuodylmxhpgdozuoiyyylhekcjks` (`email`),
  KEY `idx_vucsqnzqefsuwhnybgoxswprcclogrrqpwnv` (`username`),
  KEY `fk_rlovqusvckdlovvodwppgmaanxhlzpxzqvgp` (`photoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, 1, 0, 0, 0, 1, 'robin.braibant@pxl.be', NULL, NULL, NULL, 'robin.braibant@pxl.be', '$2y$13$/pULKzvQTeS.LmXYyuJ9Z.XaOedS7UIoMuM8fig6Py/k3bn27Ie.G', '2024-06-04 14:49:31', NULL, NULL, NULL, '2024-06-04 14:38:43', '2024-06-04 14:38:16', 1, NULL, NULL, NULL, 0, '2024-04-30 09:51:50', '2024-04-16 07:00:11', '2024-06-04 14:49:31'),
(159, NULL, 1, 0, 0, 0, 1, 'Student', 'PXL', 'Pxl', NULL, 'student@pxl.be', '$2y$13$VF.TVtWXHz9./NemYMOlJeW.Y5Kof7yrdZLgl4FF3gPbOCUnjN2OK', '2024-06-04 14:53:50', NULL, NULL, NULL, '2024-06-04 14:50:38', '2024-06-04 14:50:31', 1, NULL, NULL, NULL, 0, '2024-06-04 14:53:18', '2024-05-28 07:03:45', '2024-06-04 14:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE IF NOT EXISTS `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_puluyuvykzmhpueprhqoapkxmrbpxevocreu` (`name`,`parentId`,`volumeId`),
  KEY `idx_lrdatzrnbamszhvfygpmrkthjyvafmuoyerl` (`parentId`),
  KEY `idx_yojqgiafmvibflygucfzptpkxvpgogjupnua` (`volumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Bestanden', NULL, '2024-04-29 08:32:01', '2024-04-29 08:41:02', 'e9a2233e-fe9e-46f8-997d-39642b16b598'),
(2, NULL, NULL, 'Temporary Uploads', NULL, '2024-04-29 08:32:05', '2024-04-29 08:32:05', 'e2edd0a5-e675-4265-b700-fd3a4bdcefbb'),
(3, 2, NULL, 'user_1', 'user_1/', '2024-04-29 08:32:05', '2024-04-29 08:32:05', 'db15f436-be57-4ca7-aa08-5ce53c0b192c'),
(4, NULL, 2, 'Bestanden', '', '2024-04-29 13:10:07', '2024-04-29 13:10:07', '813ac9d9-36e0-4815-a978-7d7e5d0d13fa'),
(5, NULL, 3, 'Bestanden', '', '2024-04-29 14:40:11', '2024-04-29 14:40:11', '69b483e7-332f-4646-8f17-db2865b49823');

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
CREATE TABLE IF NOT EXISTS `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfqhqpbqhptgiqmzsfgjiecksvggzjfvkgcg` (`name`),
  KEY `idx_zopnmtkupbcvjyqxtrmspjzovgkyvyntgojl` (`handle`),
  KEY `idx_rxnzlbbwdevmsuojghbbovealjmqzavbnvrq` (`fieldLayoutId`),
  KEY `idx_grxpgwcgzhenxqcnqcdnseqoqztfjhoilbyk` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `subpath`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `altTranslationMethod`, `altTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 6, 'Bestanden', 'files', 'files', 'images', '', '', 'site', NULL, 'none', NULL, 1, '2024-04-29 08:32:01', '2024-04-29 08:41:02', '2024-04-29 08:43:27', '4a4b2801-7f1b-4841-ba5e-4f5ad817b47a'),
(2, 7, 'Bestanden', 'files', 'files', '', '', '', 'site', NULL, 'none', NULL, 2, '2024-04-29 13:10:07', '2024-04-29 13:10:07', '2024-04-29 13:46:34', 'd3f7924c-512f-4523-a1d4-9714d748c465'),
(3, 8, 'Bestanden', 'files', 'files', '', '', '', 'site', NULL, 'none', NULL, 3, '2024-04-29 14:40:11', '2024-04-29 14:40:11', NULL, '93072a96-b65a-41ea-affb-1c3aa926763a');

-- --------------------------------------------------------

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
CREATE TABLE IF NOT EXISTS `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_xqinhxlmqvelozkqjsewsmbjyzchwzmoqhps` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint UNSIGNED DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_phqjekvzdkecqvioyameqhdqazyvlpeurlvg` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}', 1, '2024-04-16 07:03:05', '2024-04-16 07:03:05', '87f1150e-6180-4bec-9c58-a9a9b274cc1f'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2024-04-16 07:03:05', '2024-04-16 07:03:05', '8c09ae19-aabe-4c0a-ab95-ec0f9f4d4f00'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2024-04-16 07:03:05', '2024-04-16 07:03:05', '8895d33e-8c31-483d-a41a-2f90363defa7'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}', 1, '2024-04-16 07:03:05', '2024-04-16 07:03:05', '85acde9a-b648-4116-91ac-6761b68eaa8b'),
(5, 159, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}', 1, '2024-06-04 14:51:44', '2024-06-04 14:51:44', '42666f39-76e6-4523-9e16-180f717b8843'),
(6, 159, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2024-06-04 14:51:44', '2024-06-04 14:51:44', 'd7f9678e-fd3e-4039-b160-a71bd8dabeb6'),
(7, 159, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2024-06-04 14:51:44', '2024-06-04 14:51:44', 'e0089908-37c5-4964-9e7a-64d68259f801'),
(8, 159, 'craft\\widgets\\Feed', 4, NULL, '{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}', 1, '2024-06-04 14:51:44', '2024-06-04 14:51:44', 'b75ee273-e31b-49ca-b0fd-52eb53521daf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_rzstroedjvurttgkikwuyhhpgegfrpmrcdug` (`keywords`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_cofsortvmkhmrpjabvafqtrybzadaiqvxhnf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_shpqyewynsgolzuusgawkwnnwjbusvszxpdh` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_lqhjqtbkubfghhqhqskzyqomuiqjkzrxlkkd` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xjuyhlhshjnalcczhropwjdblytgvpzruerj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_oqselnumkvvobrufvknvjkcdlavrbpwkrffz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pmgmfjaxygdwxrnlovoziahtpfujczsrfjox` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_aihskvyfsmoxwdauvjwcudfivgvpdaykdnyx` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ftebvxhamkyvrragjycpdsleuwkfzupjguym` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ihcbfuwjuwclughpyfagfgfzhzzbrrexwwme` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_phsvnlmgiyygzmpzgvgcbjzlrnuczqrwbxsh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets_sites`
--
ALTER TABLE `assets_sites`
  ADD CONSTRAINT `fk_ikyrfskebrfycqqdqtkaaovdfsphrgpfdxuq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zcyoylhqqvkcouzfqdmmwavursfszqpngqhu` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `authenticator`
--
ALTER TABLE `authenticator`
  ADD CONSTRAINT `fk_xjicfsusdwkubffpavberbudwdjkpohxobrq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_ewnpknsmlgwgrtnsawqtxhairflxngoljuij` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nbzdpkmskizaznecfotsfgncojefygymbmzj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ratdknoierylodtpvhglxinpbnqkqpmoxmoc` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_nlygrmwyveiqvexmjtoovjtgtcxakntgfqtm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tbqexpaxeliaooeghgpxnhduoksqdjfliszj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_kzuwywlnanldxxtuphgyrvublcsyixzvaupz` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mtzdvkghieoquugjpfnoovgrrnbzlugucyws` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_bjxxqritpytxuoimooqyjjoilkfhlfsarfod` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fiidrfsxqydsebtubgsbcuwqshkecmqdzaxo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gntjccmiivzswvzbjebqdfqsvnwqukkkyvse` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_ejfdogimnophxempqrrxpkriiyhtgcknkcpb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jcoyzmtfxevooqxtxfgmpjgpdqnjokklcnnb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_qmejamltwyopzvmmbejgdrnesadrjifcqchi` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vqzkkyyrlwxxzargyezpbpbuddeghkgjtkmh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_hzpickfnkqtsusutbwufhmfkzygbopoiqjnj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_bpakiygstowpjecnkeozydfabgbbvvubazpy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fzfufpbocrabthmihofnxpulxexcgeormvgh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elementactivity`
--
ALTER TABLE `elementactivity`
  ADD CONSTRAINT `fk_dzdgdjeawrtdwypahjpqukuhuacwjijhzxes` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fmtubfwbwkzljskxhkupovbjmduqjlnsikxj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jjrhevivywvflwafycfohccgstmfcspadvwp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wmsvodgjdxepaxoqzqmhvdtyrwyuqtuoekyb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_kbfettsqzssyoxgguuhgdctbznfxzrrwkkqu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_mwbhovabatybgxifvhhwoborjvzszfrnscqd` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nvlfzgtziurezexvxzyaxmcywkcytcltrpbq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qaoyneysibujxhyqdaadppuoaxrimutoltvc` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_bulkops`
--
ALTER TABLE `elements_bulkops`
  ADD CONSTRAINT `fk_qgehkjkqttzmdpdgpwvtjlujmblahxojznrt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_owners`
--
ALTER TABLE `elements_owners`
  ADD CONSTRAINT `fk_ggudnutvngngpbzlofqfwrkkfjihktomtrcd` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_opgmybrfdiiujxwehrrfbrkuanuvuaemrtau` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_jrfvsmsyclwmxvmfqlpwimkridwigiuvcsjh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ltzmovbwnispozjktkhmejcyleoazthfodgo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_ektdcnwdykixbvetxxfslipwtxxbadapkxyi` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gpadvwgxmjbanmcwmowgihikkroaktfnjftr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mwjbvqoedoymedvruljevtnkqzoouyopebaw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ofsqmnpsnsaunwuxruajazkazygscywasfen` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yfuffcijxbeoqxhydfzylrdzwfwuzelztzfm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yzzzovjewkjvvjacddmknsfsbsctcylpjriz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entries_authors`
--
ALTER TABLE `entries_authors`
  ADD CONSTRAINT `fk_pusjnqnfebeijjdzilvotqsymbdzordhevgl` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sflpndsjmakcvhellpeqsoapqqgxwbgsnldp` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_gffhrzjnulrbshjpvpmtcmewepbbcjmlxbfz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_kkpzlczsynwykzafwrfyvbnhrtntehosoauv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tkhurcsuzfwxlapeeqnbmcioguujlhytmvcd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_ttbqqnuqaytgclohrieasuumpywlysadmlek` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_clyiswaxekvkfcipbxnerxtzkudnopwiungu` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fhkndpuwbfmhpppnayhsvqzxyziqqqehygsr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zgoybiamvapuoqakjylxzlbzhhderlloaboc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_ahathhwdurvhqeubzmtgttatbvqlatogrhna` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_dzxppbizyrbzkhzskfpezmgjurrpsrukjfoz` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_uokueeuvptxfkodurhlawzwxkcohjeasnhrm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_entrytypes`
--
ALTER TABLE `sections_entrytypes`
  ADD CONSTRAINT `fk_egyebmxiyharchenwzrzornyjqbcyfzzumkd` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hpqtalglcfgnxkhxnwlzinuobbqgsfwswomk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_ggqxdelxgftmrhrohhdaiooloconiyzufhla` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nyikajdwhqdflpkpuldpnqtnybxndlmfxqqs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_pkbtvmnkkyfssgbfwwprdzeloabxbpouyjos` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_jocniirizqpwweqixygojdigtfklranznbez` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_wrjaypmoomvmgtrjvdfsmecrywijduumhmel` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_qqxjbciwxsrpwnacbvmurpebcdroihqxzgrc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_fgdnouhphpfrpbmjgxbxtdwwxpcarqhvnfjk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_knkrekxkoyypdywqpvcedrsbpghlvlkafzsf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rfsgmujhihtdtirvqbvsegbowlrsjhnotaxb` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_cqpexrghocvwmtrawvxewqlutdmugeozyatz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nkesyzelpwlywgihezfwizlpyckvcrwynuki` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_atdtoavbegdgejanvmwsbgsgdnvkxyudnfcf` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vxcxmhnlginvvqmffspzljvusgiyxbluydmh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_ezsqbdsckdcvplcnrcecwokvxnzxypnzaijf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sukguaayknheugskwilitaklxjxxyynqmpwz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_adzpuklvwjitiiehzynnvmvwgvznuruviftn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_rlovqusvckdlovvodwppgmaanxhlzpxzqvgp` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_zfwqhxuswjvrnrwiynsiazjhguhyiusrzbsc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_fllwcammylgeunvbacwpinuatknuwlbkdufe` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yeueguipxlggijbglhoanaauvjnuznedokto` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_izertdtpsbiennjckzrkmsktzyqmnufdqpik` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `webauthn`
--
ALTER TABLE `webauthn`
  ADD CONSTRAINT `fk_xqinhxlmqvelozkqjsewsmbjyzchwzmoqhps` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_azokhzcqmagvuzfiijiqlbewnrotwpthrbfs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
