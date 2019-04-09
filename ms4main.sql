# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: ms4
# Generation Time: 2019-04-09 11:17:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bookings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `extraPrice` int(11) NOT NULL,
  `extraService` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookingTime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookingDate` date NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;

INSERT INTO `bookings` (`id`, `buyer_id`, `seller_id`, `service_id`, `totalPrice`, `extraPrice`, `extraService`, `bookingTime`, `bookingDate`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,1000,500,'[]','(12:40 AM - 01:00 AM)','2019-03-11',3,'2019-03-10 17:02:32','2019-03-12 05:54:54'),
	(2,2,1,1,1100,600,'[{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(01:00 AM - 01:20 AM)','2019-03-11',2,'2019-03-10 17:04:19','2019-03-21 10:30:18'),
	(3,2,1,1,1400,900,'[{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":2,\"service_id\":1,\"serviceName\":\"Service 1.3\",\"servicePrice\":\"300.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(02:20 AM - 02:40 AM)','2019-03-11',3,'2019-03-10 17:04:46','2019-03-21 10:30:45'),
	(4,1,2,1,1900,1400,'[{\"id\":1,\"service_id\":1,\"serviceName\":\"Service 1.2\",\"servicePrice\":\"500.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":2,\"service_id\":1,\"serviceName\":\"Service 1.3\",\"servicePrice\":\"300.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','10:00 - 10:30','2019-03-11',3,'2019-03-11 07:14:58','2019-03-29 22:16:58'),
	(5,1,2,1,500,0,'[]','(04:00 AM - 04:20 AM)','2019-03-11',1,'2019-03-11 08:52:52','2019-03-21 09:55:17'),
	(6,3,2,2,2,0,'\"\\\"[]\\\"\"','(12:40 AM - 01:00 AM)','2019-03-12',3,'2019-03-12 11:31:35','2019-03-12 14:36:45'),
	(7,5,2,2,2,0,'\"\\\"\\\\\\\"[]\\\\\\\"\\\"\"','(01:20 AM - 01:40 AM)','2019-03-12',3,'2019-03-12 11:31:50','2019-03-12 14:38:21'),
	(8,5,2,2,2,0,'\"\\\"\\\\\\\"\\\\\\\\\\\\\\\"[]\\\\\\\\\\\\\\\"\\\\\\\"\\\"\"','(02:40 AM - 03:00 AM)','2019-03-12',3,'2019-03-12 11:32:18','2019-03-12 13:02:15'),
	(9,5,2,2,2,0,'[]','(01:00 AM - 01:20 AM)','2019-03-18',1,'2019-03-12 11:55:15','2019-03-17 04:39:23'),
	(10,5,4,3,30,0,'[]','(01:30 AM - 02:00 AM)','2019-03-16',1,'2019-03-15 18:06:23','2019-03-15 19:17:21'),
	(11,5,4,3,30,0,'[]','(02:30 AM - 03:00 AM)','2019-03-16',1,'2019-03-15 18:06:45','2019-03-15 18:39:27'),
	(12,5,4,3,30,0,'[]','(01:20 AM - 01:40 AM)','2019-03-18',2,'2019-03-15 18:07:03','2019-03-15 18:07:03'),
	(13,5,2,2,2,0,'[]','(12:40 AM - 01:00 AM)','2019-03-18',2,'2019-03-15 18:09:48','2019-03-16 11:36:49'),
	(14,5,4,3,30,0,'[]','(02:00 AM - 02:30 AM)','2019-03-16',1,'2019-03-15 18:10:02','2019-03-16 11:34:50'),
	(15,5,4,3,30,0,'[]','(03:00 AM - 03:30 AM)','2019-03-16',3,'2019-03-15 18:10:06','2019-03-15 18:10:06'),
	(16,2,4,6,89,56,'[{\"id\":37,\"service_id\":6,\"serviceName\":\"gfhhgfgh\",\"servicePrice\":\"56.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(01:20 AM - 01:40 AM)','2019-03-18',0,'2019-03-17 21:39:21','2019-03-17 21:39:21'),
	(17,1,2,1,170,140,'[{\"id\":33,\"service_id\":1,\"serviceName\":\"Service 1.2\",\"servicePrice\":\"50.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":34,\"service_id\":1,\"serviceName\":\"Service 1.3\",\"servicePrice\":\"30.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":35,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"60.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(12:00 AM - 12:20 AM)','2019-03-18',1,'2019-03-17 21:53:06','2019-03-21 09:55:40'),
	(18,2,1,1,30,0,'[]','(12:20 AM - 12:40 AM)','2019-03-18',0,'2019-03-17 22:05:31','2019-03-17 22:05:31'),
	(19,2,1,1,30,0,'[]','(12:20 AM - 12:40 AM)','2019-03-21',0,'2019-03-21 11:17:27','2019-03-21 11:17:27'),
	(20,3,4,7,10,0,'[]','(04:20 AM - 04:40 AM)','2019-03-25',2,'2019-03-24 07:39:04','2019-03-24 10:44:48'),
	(21,3,4,7,10,0,'[]','(07:20 AM - 07:40 AM)','2019-03-25',3,'2019-03-24 07:39:16','2019-03-24 10:45:14'),
	(22,3,2,4,0,0,'[]','(12:20 AM - 12:40 AM)','2019-04-01',3,'2019-03-29 19:26:29','2019-03-29 20:52:49'),
	(23,3,2,4,0,0,'[]','(12:40 AM - 01:00 AM)','2019-04-01',2,'2019-03-29 19:26:36','2019-03-29 20:52:50'),
	(24,3,2,1,30,0,'[]','(12:40 AM - 01:00 AM)','2019-04-01',1,'2019-03-29 22:16:24','2019-03-29 22:20:42'),
	(25,3,2,1,30,0,'[]','(01:40 AM - 02:00 AM)','2019-04-01',1,'2019-03-29 22:16:31','2019-03-29 22:58:36'),
	(26,3,2,8,60,20,'[{\"id\":38,\"service_id\":8,\"serviceName\":\"ex1\",\"servicePrice\":\"20.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(03:00 AM - 03:20 AM)','2019-04-01',0,'2019-03-30 01:12:09','2019-03-30 01:12:09');

/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `catName`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Pedicure','/uploads/5Gsjr0CbMgfCggfkM6xT8sT5lZ9Az12SNGvrjWDD.png',NULL,'2019-03-29 20:09:07'),
	(2,'Facial','/uploads/i4Zsf6oPg3eSQLz2iLAg0X5QY1PZNvB5cGsi8jMD.jpeg',NULL,'2019-03-29 20:15:52'),
	(3,'Hair-Cut','/uploads/i3DeX8VkJaav3sa3n7hDZItdDbwkJhV9q25AVdWd.jpeg',NULL,'2019-03-29 20:14:57'),
	(4,'Make Up','',NULL,'2019-03-16 13:42:50'),
	(5,'manicure','',NULL,'2019-03-16 13:43:03'),
	(6,'wax','/uploads/wax.svg',NULL,NULL),
	(7,'new catagory','/uploads/cat1.svg','2019-03-16 12:17:16','2019-03-16 12:17:16'),
	(8,'new catagory','/uploads/cat1.svg','2019-03-16 12:17:58','2019-03-16 12:17:58'),
	(9,'Room-Cleaning','/uploads/QIVm0XOlCGeDPG864bzD2tLVdwcUXAoJpM1IjGPs.jpeg','2019-03-29 20:08:27','2019-03-29 20:08:27'),
	(10,'nice','/uploads/LLCAw3pXdEzt2zU5PtWU6LClYKm3rf1RwvIMIsgI.png','2019-04-01 18:14:45','2019-04-01 18:15:05');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table chats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chats`;

CREATE TABLE `chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_sender` int(10) unsigned NOT NULL,
  `con_id` int(10) unsigned NOT NULL,
  `msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `seen` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `con_id` (`con_id`),
  KEY `msg_sender` (`msg_sender`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`con_id`) REFERENCES `conversations` (`id`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`msg_sender`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;

INSERT INTO `chats` (`id`, `msg_sender`, `con_id`, `msg`, `file`, `deleted`, `seen`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'\"Kita ba Vala ni\"',NULL,0,0,NULL,'2019-03-28 13:43:21'),
	(2,2,3,'\"Oyo vala Ba\"',NULL,0,0,NULL,'2019-03-28 13:43:21'),
	(3,1,4,'\"Kita ba Vala ni\"',NULL,0,0,NULL,NULL),
	(4,3,4,'\"Oyo vala Ba\"',NULL,0,0,NULL,NULL),
	(5,1,3,'aaaa',NULL,0,0,'2019-03-27 22:29:10','2019-03-28 13:43:21'),
	(6,1,3,'uhbujbnjknkjnl',NULL,0,0,'2019-03-28 09:46:30','2019-03-28 13:43:21'),
	(7,1,3,'uhbujbnjknkjnliujhnji',NULL,0,0,'2019-03-28 09:46:39','2019-03-28 13:43:21'),
	(8,1,4,'aaa',NULL,0,0,'2019-03-28 09:47:31','2019-03-28 09:47:31'),
	(9,1,3,'aaaa',NULL,0,0,'2019-03-28 09:47:42','2019-03-28 13:43:21'),
	(10,1,3,'aaffff',NULL,0,0,'2019-03-28 09:47:50','2019-03-28 13:43:21'),
	(11,1,3,'zs',NULL,0,0,'2019-03-28 09:50:09','2019-03-28 13:43:21'),
	(12,1,3,'asa',NULL,0,0,'2019-03-28 09:51:43','2019-03-28 13:43:21'),
	(13,1,3,'s',NULL,0,0,'2019-03-28 09:52:53','2019-03-28 13:43:21'),
	(14,1,3,'df',NULL,0,0,'2019-03-28 09:54:07','2019-03-28 13:43:21'),
	(15,1,3,'sd',NULL,0,0,'2019-03-28 09:55:33','2019-03-28 13:43:21'),
	(16,1,3,'ok working',NULL,0,0,'2019-03-28 09:56:19','2019-03-28 13:43:21'),
	(17,1,3,'sdfsdfsdfsdf',NULL,0,0,'2019-03-28 09:56:27','2019-03-28 13:43:21'),
	(18,1,3,'dfdd',NULL,0,0,'2019-03-28 09:57:24','2019-03-28 13:43:21'),
	(19,1,3,'sdfsdfsdf',NULL,0,0,'2019-03-28 09:57:58','2019-03-28 13:43:21'),
	(20,1,3,'sdfsdfsdfcvxcvxcv',NULL,0,0,'2019-03-28 09:58:06','2019-03-28 13:43:21'),
	(21,1,3,'ok nie',NULL,0,0,'2019-03-28 09:58:25','2019-03-28 13:43:21'),
	(22,1,3,'working,.,....',NULL,0,0,'2019-03-28 09:58:32','2019-03-28 13:43:21'),
	(23,1,3,'ok cool',NULL,0,0,'2019-03-28 09:59:07','2019-03-28 13:43:21'),
	(24,1,3,'jhgujhgbjh',NULL,0,0,'2019-03-28 09:59:17','2019-03-28 13:43:21'),
	(25,1,3,'s',NULL,0,0,'2019-03-28 10:00:19','2019-03-28 13:43:21'),
	(26,1,3,'ok should show up at left',NULL,0,0,'2019-03-28 10:00:49','2019-03-28 13:43:21'),
	(27,1,3,'ok now what is uit',NULL,0,0,'2019-03-28 10:02:33','2019-03-28 13:43:21'),
	(28,1,3,'opk now',NULL,0,0,'2019-03-28 10:03:09','2019-03-28 13:43:21'),
	(29,1,3,'working,,,,,,,,,,,,,,,,,,,,,,,,,,,,',NULL,0,0,'2019-03-28 10:03:17','2019-03-28 13:43:21'),
	(30,1,4,'wow bro',NULL,0,0,'2019-03-28 10:03:23','2019-03-28 10:03:23'),
	(31,1,3,'newwwwwwwwwwwwwwwwwwwwwwwwwww',NULL,0,0,'2019-03-28 11:39:37','2019-03-28 13:43:21'),
	(32,1,3,'kl,lp',NULL,0,0,'2019-03-28 11:42:56','2019-03-28 13:43:21'),
	(33,1,3,'with id may be',NULL,0,0,'2019-03-28 11:44:39','2019-03-28 13:43:21'),
	(34,1,3,'kita koro mia',NULL,0,0,'2019-03-28 11:47:20','2019-03-28 13:43:21'),
	(35,2,3,'hello',NULL,0,0,'2019-03-28 11:49:28','2019-03-28 13:43:21'),
	(36,1,3,'kita ba',NULL,0,0,'2019-03-28 12:25:59','2019-03-28 13:43:21'),
	(37,1,3,'p;;',NULL,0,0,'2019-03-28 12:39:02','2019-03-28 13:43:21'),
	(38,1,3,'hello',NULL,0,0,'2019-03-28 13:15:53','2019-03-28 13:43:21'),
	(39,1,3,'hi',NULL,0,0,'2019-03-28 13:18:01','2019-03-28 13:43:21'),
	(40,1,3,'This is New msg',NULL,0,0,'2019-03-28 13:52:51','2019-03-28 14:54:21'),
	(41,2,3,'This is Firte Msg',NULL,0,0,'2019-03-28 13:54:25','2019-03-28 14:54:03'),
	(42,2,3,'Kno Amon Hoy',NULL,0,0,'2019-03-28 14:54:37','2019-03-28 14:58:15'),
	(43,2,3,'Kno KNo',NULL,0,0,'2019-03-28 14:59:09','2019-03-28 14:59:25'),
	(44,2,3,'New Msg',NULL,0,0,'2019-03-28 15:00:10','2019-03-28 15:35:56'),
	(45,1,3,'Bujsi',NULL,0,0,'2019-03-28 16:13:33','2019-03-28 16:14:45'),
	(46,2,3,'koi ba',NULL,0,0,'2019-03-28 16:18:13','2019-03-28 16:18:29'),
	(47,2,3,'aso ni b a',NULL,0,0,'2019-03-28 16:19:02','2019-03-28 16:19:51'),
	(48,2,3,'new Msg Again',NULL,0,0,'2019-03-28 16:25:58','2019-03-28 16:35:33'),
	(49,2,3,'Another New msg',NULL,0,0,'2019-03-28 16:35:58','2019-03-28 16:36:03'),
	(50,2,3,'New New msg new',NULL,0,0,'2019-03-28 16:36:31','2019-03-29 12:27:52'),
	(51,1,3,'eito asi basat',NULL,0,0,'2019-03-29 12:28:39','2019-03-29 12:30:49'),
	(52,2,3,'aibay kobe',NULL,0,0,'2019-03-29 12:31:09','2019-03-29 12:31:09'),
	(53,1,3,'ektu bade airam',NULL,0,0,'2019-03-29 12:31:23','2019-03-29 12:31:24'),
	(54,1,3,'tumi kunsomoy aibay',NULL,0,0,'2019-03-29 12:31:42','2019-03-29 12:31:44'),
	(55,2,3,'eito jokhon aibay call dio',NULL,0,0,'2019-03-29 12:31:56','2019-03-29 12:31:59'),
	(56,2,3,'hi bro',NULL,0,0,'2019-03-29 12:45:58','2019-03-29 12:46:01'),
	(57,2,3,'this is nice',NULL,0,0,'2019-03-29 12:46:12','2019-03-29 12:46:30'),
	(58,2,3,'hello Buddy',NULL,0,0,'2019-03-29 13:15:36','2019-03-29 13:17:50'),
	(59,2,3,'hello Nice Buddy',NULL,0,0,'2019-03-29 13:23:20','2019-03-29 13:32:24'),
	(60,2,3,'wow ni9e Buddy',NULL,0,0,'2019-03-29 13:33:00','2019-03-29 13:37:03'),
	(61,1,3,'hi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi brohi bro',NULL,0,0,'2019-03-29 14:56:30','2019-03-29 14:56:34'),
	(62,1,3,'dfjgbujdfjgbjhdf',NULL,0,0,'2019-03-29 14:58:28','2019-03-29 14:58:29'),
	(63,1,3,'jjhhjhhh',NULL,0,0,'2019-03-29 14:59:48','2019-03-29 14:59:49'),
	(64,1,3,'Hello',NULL,0,0,'2019-03-29 15:15:14','2019-03-29 15:15:18'),
	(65,1,3,'hello',NULL,0,0,'2019-03-29 15:16:30','2019-03-29 15:16:33'),
	(66,1,4,'kita ba vala ni',NULL,0,0,'2019-03-29 15:55:01','2019-03-29 18:50:32'),
	(67,1,3,'rahima america gese gi ajke jano ni??',NULL,0,0,'2019-03-29 15:56:29','2019-03-29 15:56:33'),
	(68,1,7,'kita b e shipu',NULL,0,0,'2019-03-29 15:57:19','2019-04-06 03:29:13'),
	(69,3,5,'hi kamran',NULL,0,0,'2019-03-29 18:50:24','2019-03-29 18:50:47'),
	(70,2,5,'iojiojk',NULL,0,0,'2019-03-29 18:50:53','2019-03-29 18:50:56'),
	(71,3,5,'okkkkkk',NULL,0,0,'2019-03-29 18:51:01','2019-03-29 18:51:05'),
	(72,2,5,'uijhi',NULL,0,0,'2019-03-29 18:51:10','2019-03-29 18:51:21'),
	(73,3,5,'kkkkk',NULL,0,0,'2019-03-29 18:51:29','2019-03-29 18:51:33'),
	(74,3,5,'Hello I have contacted a msg',NULL,0,0,'2019-03-29 19:26:52','2019-03-29 21:09:38');

/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table conversations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversations`;

CREATE TABLE `conversations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` int(10) unsigned NOT NULL,
  `reciever` int(10) unsigned NOT NULL,
  `status` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `conType` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reciver` (`reciever`),
  KEY `sender` (`sender`),
  CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`reciever`) REFERENCES `users` (`id`),
  CONSTRAINT `conversations_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;

INSERT INTO `conversations` (`id`, `sender`, `reciever`, `status`, `type`, `conType`, `created_at`, `updated_at`)
VALUES
	(3,1,2,0,1,1,NULL,NULL),
	(4,3,1,0,1,1,NULL,NULL),
	(5,3,2,0,1,1,NULL,NULL),
	(6,3,4,0,1,1,NULL,NULL),
	(7,1,4,0,1,1,'2019-03-29 15:57:19','2019-03-29 15:57:19');

/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table extras
# ------------------------------------------------------------

DROP TABLE IF EXISTS `extras`;

CREATE TABLE `extras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `serviceName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servicePrice` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;

INSERT INTO `extras` (`id`, `service_id`, `serviceName`, `servicePrice`, `created_at`, `updated_at`)
VALUES
	(4,3,'Extra service 1',10.00,NULL,NULL),
	(5,3,'Extra service 2',5.00,NULL,NULL),
	(33,1,'Service 1.2',50.00,NULL,NULL),
	(34,1,'Service 1.3',30.00,NULL,NULL),
	(35,1,'Service 1.4',60.00,NULL,NULL),
	(36,5,'ss',2.00,NULL,NULL),
	(37,6,'gfhhgfgh',56.00,NULL,NULL),
	(38,8,'ex1',20.00,NULL,NULL),
	(39,9,'awd',23.00,NULL,NULL);

/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `imageUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;

INSERT INTO `images` (`id`, `service_id`, `imageUrl`, `created_at`, `updated_at`)
VALUES
	(2,2,'/uploads/pcpSlKaSylqS3Vj2WUvtVmghh8KyPwERrbGGamVP.jpeg',NULL,NULL),
	(3,3,'/uploads/3iHGMItNlaJRasm0yFRkutjgoSckvvUnngnCNWDG.png',NULL,NULL),
	(4,3,'/uploads/DfZ6jzrOsw8zaVq7tuLxbymfbuzrUSfwupcEzYco.png',NULL,NULL),
	(5,3,'/uploads/qoQe1hfH4aDWrOqvs4LCkM3rKItptBsLtZREdpUg.png',NULL,NULL),
	(6,1,'/uploads/WmLZ3XW4pAyVYAjTMwsJmFMc6377tJ5mzJcMTh3h.jpeg',NULL,NULL),
	(7,1,'/uploads/CPhgIidcMQfEOjq1PHbqT7SQ1ZB23g0UOZuigyeN.jpeg',NULL,NULL),
	(8,4,'/uploads/nfIbiyEWWtXx7DRfB9QeFHNnY06UQYKeXP6iiolA.png',NULL,NULL),
	(9,4,'/uploads/Vx285GOTjk50URj8m2vN55Re3YUumDvZrwn090op.png',NULL,NULL),
	(10,5,'/uploads/JZYZrYjjBr13xhIVgAK5S0o6TfEV7ut5IlNUMrCn.png',NULL,NULL),
	(11,6,'/uploads/cRrmk48np2N0ueCpYo0MHjfXmf2ROY7HVPBEBIqo.png',NULL,NULL),
	(12,6,'/uploads/KheTBI2d10Sl89JbHJ7UoKCxBemSfjrEeKETNtEv.png',NULL,NULL),
	(13,7,'/uploads/gQAtlrLl2h6Uuek5fNLymkWYlIfdvWQ5nLmfdteq.png',NULL,NULL),
	(14,8,'/uploads/TMwGAyaGyY2uYst9wMi9JYHDgJIgKRYPUqXXFoWl.png',NULL,NULL),
	(15,9,'/uploads/4wlRrFl3q1znR3gBT91jTfeNuxIVdA9Gif5xvoOg.png',NULL,NULL),
	(16,10,'/uploads/zKnKmKeValfG5FpVYYz3o7edjvE0QbMFsejAHIBq.jpeg',NULL,NULL),
	(17,11,'/uploads/FUXKuJ7eCtvymYG98OwlWkJh5U53em8OTzvY0M2Z.jpeg',NULL,NULL),
	(18,12,'/uploads/6tgQncvnonWz4J9OglhSm9TDyEJt6FllU8kROFSX.png',NULL,NULL);

/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_02_25_100443_create_services_table',1),
	(4,'2019_02_25_100654_create_tags_table',1),
	(7,'2019_02_25_101135_create_time_settings_table',1),
	(8,'2019_02_25_101201_create_images_table',1),
	(9,'2019_02_28_192700_create_extras_table',1),
	(10,'2019_03_10_065258_create_categories_table',1),
	(12,'2019_02_25_100937_create_bookings_table',2),
	(13,'2019_02_25_101002_create_reviews_table',3),
	(14,'2019_03_20_205458_create_notifications_table',1),
	(15,'2019_03_24_070223_create_subcategories_table',4),
	(16,'2019_03_27_123832_create_chats_table',5),
	(17,'2019_03_27_123940_create_conversations_table',5),
	(18,'2019_03_30_013937_create_reviewbs_table',6);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notifor` int(11) NOT NULL,
  `notifrom` int(11) NOT NULL,
  `notitxt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;

INSERT INTO `notifications` (`id`, `notifor`, `notifrom`, `notitxt`, `url`, `seen`, `created_at`, `updated_at`)
VALUES
	(9,3,2,'approved your booking','/bprofile/3?tab=3',0,'2019-03-29 22:58:37','2019-03-29 22:58:45'),
	(10,2,3,'booked your Service','/sprofile/2?tab=2',0,'2019-03-30 01:12:09','2019-03-30 01:20:17');

/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;

INSERT INTO `password_resets` (`email`, `token`, `created_at`)
VALUES
	('nazmul@gmail.com','$2y$10$rOeT018i1aZMoCarvzfaVOwkg3k1QXA.hb/RfT1/K1V/EJ.V4Ho0y','2019-03-15 13:45:15');

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reviewbs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviewbs`;

CREATE TABLE `reviewbs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `booking_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `reviewbs` WRITE;
/*!40000 ALTER TABLE `reviewbs` DISABLE KEYS */;

INSERT INTO `reviewbs` (`id`, `service_id`, `buyer_id`, `seller_id`, `booking_id`, `rating`, `comment`, `created_at`, `updated_at`)
VALUES
	(1,4,3,2,23,4,'He is quite good in behavbe','2019-03-30 02:09:15','2019-03-30 02:09:15');

/*!40000 ALTER TABLE `reviewbs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;

INSERT INTO `reviews` (`id`, `service_id`, `buyer_id`, `seller_id`, `booking_id`, `rating`, `comment`, `created_at`, `updated_at`)
VALUES
	(1,3,2,4,12,4,'This is Nice Service','2019-03-15 21:09:04','2019-03-15 21:09:04'),
	(2,3,4,2,10,5,'This is May be Nice Project','2019-03-15 21:27:32','2019-03-15 21:27:32'),
	(3,3,3,2,14,5,'This is ReView number 3','2019-03-15 21:28:18','2019-03-15 21:28:18'),
	(4,1,2,1,3,4,'dfs','2019-03-21 10:28:46','2019-03-21 10:28:46');

/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `videoLink` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `openingMassage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isComplete` tinyint(1) NOT NULL DEFAULT '0',
  `nextStep` int(11) NOT NULL DEFAULT '2',
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;

INSERT INTO `services` (`id`, `user_id`, `title`, `cat_id`, `price`, `videoLink`, `description`, `openingMassage`, `isComplete`, `nextStep`, `isApproved`, `created_at`, `updated_at`)
VALUES
	(1,2,'Service 1',1,30.00,'https://www.youtube.com/watch?v=3eA3oVc6lF4','This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.','Opening message of  Service 1',0,4,1,'2019-03-10 12:00:01','2019-03-16 10:00:08'),
	(3,4,'Service Shipu 1',1,30.00,'https://www.youtube.com/watch?v=JXpJAOa_azk','This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service .This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service .','Hi i am good Service Man',1,5,1,'2019-03-15 17:27:16','2019-03-16 07:47:05'),
	(4,2,'Service Title',1,0.00,'.xgvodfmnv','jhytghjfggh','dfgdfg',0,3,0,'2019-03-17 10:27:10','2019-03-17 10:47:54'),
	(5,2,'KSKLJL;',2,20.00,'dasfjkl','sdfah','sdaf',0,4,0,'2019-03-17 11:00:14','2019-03-17 11:00:25'),
	(6,4,'ggg',6,33.00,'22','ygjhghj','22',1,5,0,'2019-03-17 19:39:57','2019-03-17 19:40:38'),
	(7,4,'test 1',7,10.00,'youtube.com','some description','nice work',0,3,1,'2019-03-21 10:51:09','2019-03-21 10:51:34'),
	(8,2,'rahi',2,40.00,'youtube.com','dsaf fdaf fadf dsaf fdaf fadf dsaf fdaf fadf dsaf fdaf fadf','fine service',0,5,0,'2019-03-21 12:48:46','2019-03-21 12:50:32'),
	(9,3,'sdfsdf',5,34.00,'sdfsdf','sdfsdf','sdfsdf',0,5,0,'2019-03-30 18:45:30','2019-03-30 18:46:03'),
	(10,3,'sa',1,10.00,NULL,'azdcvzv',NULL,0,5,0,'2019-03-30 19:19:58','2019-03-30 19:33:42'),
	(11,3,'sdf',1,10.00,NULL,'fgfg',NULL,0,5,0,'2019-03-30 19:37:37','2019-03-30 20:10:36'),
	(12,4,'nice',1,20.00,NULL,'nice',NULL,0,5,0,'2019-04-06 03:38:19','2019-04-06 03:41:10');

/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subcategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subcategories`;

CREATE TABLE `subcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `created_at`, `updated_at`)
VALUES
	(1,'Hair Oil',3,'2019-03-24 07:17:12','2019-03-24 07:17:12'),
	(2,'Foundation',4,'2019-03-24 07:19:35','2019-03-24 07:19:35'),
	(3,'Hair Wax',3,'2019-03-24 07:22:55','2019-03-24 08:33:28'),
	(4,'Lipstick',4,'2019-03-24 07:27:08','2019-03-24 07:27:08'),
	(6,'Hair Removal Wax',6,'2019-03-24 08:20:02','2019-03-24 08:31:14');

/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `tagName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `service_id`, `tagName`, `created_at`, `updated_at`)
VALUES
	(4,3,'Tag1',NULL,NULL),
	(5,3,'Tag2',NULL,NULL),
	(16,1,'Skin',NULL,NULL),
	(17,6,'fggf',NULL,NULL),
	(18,6,'jkhk',NULL,NULL),
	(19,6,'lkjhk',NULL,NULL),
	(20,8,'salon',NULL,NULL),
	(21,9,'aasd',NULL,NULL),
	(22,9,'asdasd',NULL,NULL),
	(23,10,'sd',NULL,NULL),
	(24,10,'f',NULL,NULL),
	(25,10,'df',NULL,NULL),
	(26,10,'sd',NULL,NULL),
	(27,10,'f',NULL,NULL),
	(28,10,'df',NULL,NULL),
	(29,10,'sd',NULL,NULL),
	(30,10,'f',NULL,NULL),
	(31,10,'df',NULL,NULL),
	(32,10,'sd',NULL,NULL),
	(33,10,'f',NULL,NULL),
	(34,10,'df',NULL,NULL),
	(35,11,'sds',NULL,NULL),
	(36,11,'dsfa',NULL,NULL),
	(37,11,'afsda',NULL,NULL),
	(38,12,'tag',NULL,NULL),
	(39,12,'taf',NULL,NULL),
	(40,12,'nice',NULL,NULL);

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table time_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `time_settings`;

CREATE TABLE `time_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endTime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `time_settings` WRITE;
/*!40000 ALTER TABLE `time_settings` DISABLE KEYS */;

INSERT INTO `time_settings` (`id`, `service_id`, `day`, `startTime`, `endTime`, `duration`, `created_at`, `updated_at`)
VALUES
	(7,2,'Monday','00:00','03:00',20,'2019-03-11 07:47:49','2019-03-11 07:47:49'),
	(8,3,'Monday','00:00','05:00',20,'2019-03-15 17:27:16','2019-03-15 17:27:16'),
	(9,3,'Tuesday','00:00','05:00',20,'2019-03-15 17:27:16','2019-03-15 17:27:16'),
	(10,3,'Wednesday','00:00','05:00',20,'2019-03-15 17:27:16','2019-03-15 17:27:16'),
	(11,3,'Thursday','00:00','05:00',20,'2019-03-15 17:27:16','2019-03-15 17:27:16'),
	(12,3,'Friday','00:00','12:00',30,'2019-03-15 17:27:16','2019-03-15 17:27:16'),
	(13,3,'Saturday','01:00','04:00',30,'2019-03-15 17:27:16','2019-03-15 17:27:16'),
	(25,1,'Monday','00:00','05:00',20,'2019-03-16 09:10:42','2019-03-16 09:10:42'),
	(26,1,'Tuesday','00:00','05:00',20,'2019-03-16 09:10:42','2019-03-16 09:10:42'),
	(27,1,'Wednesday','00:00','05:00',20,'2019-03-16 09:10:42','2019-03-16 09:10:42'),
	(28,1,'Thursday','00:00','05:00',20,'2019-03-16 09:10:42','2019-03-16 09:10:42'),
	(29,1,'Friday','00:00','08:00',20,'2019-03-16 09:10:42','2019-03-16 09:10:42'),
	(31,5,'Monday','00:00','04:00',20,'2019-03-17 11:00:14','2019-03-17 11:00:14'),
	(32,6,'Monday','01:00','04:00',20,'2019-03-17 19:39:58','2019-03-17 19:39:58'),
	(33,6,'Tuesday','05:00','09:00',20,'2019-03-17 19:39:58','2019-03-17 19:39:58'),
	(35,7,'Monday','04:00','10:00',20,'2019-03-21 11:08:54','2019-03-21 11:08:54'),
	(36,8,'Monday','02:00','04:00',20,'2019-03-21 12:48:46','2019-03-21 12:48:46'),
	(37,9,'Monday','00:00','03:00',30,'2019-03-29 20:06:08','2019-03-29 20:06:08'),
	(38,4,'Monday','00:00','04:00',20,'2019-03-29 20:51:40','2019-03-29 20:51:40'),
	(39,9,'Monday','01:00','03:00',20,'2019-03-30 18:45:30','2019-03-30 18:45:30'),
	(40,10,'Monday','00:00','02:00',10,'2019-03-30 19:19:58','2019-03-30 19:19:58'),
	(41,11,'Monday','00:00','02:00',10,'2019-03-30 19:37:37','2019-03-30 19:37:37'),
	(44,12,'Monday','03:00','04:00',30,'2019-04-06 03:41:48','2019-04-06 03:41:48');

/*!40000 ALTER TABLE `time_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `activation_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentInfo` text COLLATE utf8mb4_unicode_ci,
  `billingInfo` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '/img/prfile.png',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`userName`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `userName`, `email`, `location`, `language`, `bio`, `activation_token`, `paymentInfo`, `billingInfo`, `image`, `country`, `phone`, `userType`, `isActive`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Nazmul Chowdhury','nazmul','admin@admin.com','Sylhet','volvo','sss',NULL,'sss','ss','/uploads/TR0fQprwrOD4tjEojSHPcdKUNNf6WgLEp3GB9pys.jpeg','ss','sss',4,1,NULL,'$2y$10$UwI/wodDT6856i0VZOVJL.H4ppdKJnh1R06Fk4NJyZ71brY.VQvi.','WGPBTcRefxBLUbTUDt9P4pmFgvuIDkdSfzI8gE8FbQuKllctovksWTG5eeM6','2019-03-10 11:38:59','2019-04-08 21:28:08'),
	(2,'Kamran Ahmed','Kamran','iamkamran@gmail.com','Sylhet','English',NULL,NULL,NULL,NULL,'/img/prfile.png','Bangladesh','01681189844',1,1,NULL,'$2y$10$KcmPlpTpUh4uI/TeK10pHenIEBaZrcBRSVxZLOT8pdou0DMfx6x2e','afddHMozT10BMuW8Fug6fttpu5ha3Vy12UWrDaMLc5sMp6o4IBMxdlySkcCQ','2019-03-11 07:45:27','2019-04-08 21:28:08'),
	(3,'Sadek Ahmed','sadek','iamsadek@gmail.com','Sylhet','volvo','Ami Boss Boss Boss.. Kita mato .Bolda hokol... Kamran boro Bolda',NULL,NULL,NULL,'/uploads/pUkAHn2vOW4LgOPSMOvpqvYmkYFzaevYHSFgMXAN.jpeg',NULL,NULL,1,1,NULL,'$2y$10$oJUrtYigrCmPhoR86sVxKe11jA7OCIsU7m6ao8T63YgXmRLDTcddm','yHbtHCwDNeq58aBCIfEbI4ELEP5C6xBGWJpknNiTLTyjKEssOhJgOAbllcFD','2019-03-12 11:24:39','2019-04-08 21:28:08'),
	(4,'Numan Shipu 1','numan','numan@gmail.com','sylhet','volvo','this is my bio',NULL,'no payment info','no billing info','/img/prfile.png','New Zealand','+641239190432',1,1,NULL,'$2y$10$aSwqXrBmg311NOuheGrUdefed0gPDVl5iPAoWmQFovDzF4EXxFVfa','lmZ1wlvg8D7jwTNDjLrBIRMGCblKyh4skntm29I6PqV48Rv61PGSnFipNW5b','2019-03-15 12:56:42','2019-04-08 21:28:08'),
	(9,'sadek','numan@gmail.com','sadek.hkm@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'/img/prfile.png',NULL,NULL,1,1,NULL,'$2y$10$9jhf9fBhO5.mxFxMTFROUuf7B/1.uBY33RZ4TXCW5xQCucVjEom0O',NULL,'2019-04-08 21:38:35','2019-04-08 21:38:48');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
