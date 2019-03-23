# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: ms4
# Generation Time: 2019-03-17 22:32:04 +0000
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
	(2,1,1,1,1100,600,'[{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(01:00 AM - 01:20 AM)','2019-03-11',1,'2019-03-10 17:04:19','2019-03-11 16:29:21'),
	(3,1,1,1,1400,900,'[{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":2,\"service_id\":1,\"serviceName\":\"Service 1.3\",\"servicePrice\":\"300.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(02:20 AM - 02:40 AM)','2019-03-11',3,'2019-03-10 17:04:46','2019-03-12 05:54:59'),
	(4,1,1,1,1900,1400,'[{\"id\":1,\"service_id\":1,\"serviceName\":\"Service 1.2\",\"servicePrice\":\"500.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":2,\"service_id\":1,\"serviceName\":\"Service 1.3\",\"servicePrice\":\"300.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":3,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"600.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','10:00 - 10:30','2019-03-11',1,'2019-03-11 07:14:58','2019-03-11 16:33:04'),
	(5,2,1,1,500,0,'[]','(04:00 AM - 04:20 AM)','2019-03-11',3,'2019-03-11 08:52:52','2019-03-11 16:33:07'),
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
	(17,2,1,1,170,140,'[{\"id\":33,\"service_id\":1,\"serviceName\":\"Service 1.2\",\"servicePrice\":\"50.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":34,\"service_id\":1,\"serviceName\":\"Service 1.3\",\"servicePrice\":\"30.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true},{\"id\":35,\"service_id\":1,\"serviceName\":\"Service 1.4\",\"servicePrice\":\"60.00\",\"created_at\":null,\"updated_at\":null,\"staus\":true}]','(12:00 AM - 12:20 AM)','2019-03-18',0,'2019-03-17 21:53:06','2019-03-17 21:53:06'),
	(18,2,1,1,30,0,'[]','(12:20 AM - 12:40 AM)','2019-03-18',0,'2019-03-17 22:05:31','2019-03-17 22:05:31');

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
	(1,'pedicure','/uploads/cat1.svg',NULL,NULL),
	(2,'facials','/uploads/4cZ2GCup8usv3H1KqGHohsaIcHf38py9qtjDVf6e.jpeg',NULL,'2019-03-16 13:44:29'),
	(3,'Hair','/uploads/suPMJ9qDzboiDzalQ6bYjIcSqDU8pY7CtSzwCoDj.jpeg',NULL,'2019-03-16 13:45:39'),
	(4,'Make Up','',NULL,'2019-03-16 13:42:50'),
	(5,'manicure','',NULL,'2019-03-16 13:43:03'),
	(6,'wax','/uploads/wax.svg',NULL,NULL),
	(7,'new catagory','/uploads/cat1.svg','2019-03-16 12:17:16','2019-03-16 12:17:16'),
	(8,'new catagory','/uploads/cat1.svg','2019-03-16 12:17:58','2019-03-16 12:17:58');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
	(37,6,'gfhhgfgh',56.00,NULL,NULL);

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
	(12,6,'/uploads/KheTBI2d10Sl89JbHJ7UoKCxBemSfjrEeKETNtEv.png',NULL,NULL);

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
	(13,'2019_02_25_101002_create_reviews_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;

INSERT INTO `reviews` (`id`, `service_id`, `buyer_id`, `seller_id`, `booking_id`, `rating`, `comment`, `created_at`, `updated_at`)
VALUES
	(1,3,2,4,12,4,'This is Nice Service','2019-03-15 21:09:04','2019-03-15 21:09:04'),
	(2,3,2,4,10,5,'This is May be Nice Project','2019-03-15 21:27:32','2019-03-15 21:27:32'),
	(3,3,2,4,14,5,'This is ReView number 3','2019-03-15 21:28:18','2019-03-15 21:28:18');

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
  `videoLink` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `openingMassage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
	(1,1,'Service 1',1,30.00,'https://www.youtube.com/watch?v=3eA3oVc6lF4','This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.This Some Descriptoin.','Opening message of  Service 1',0,4,1,'2019-03-10 12:00:01','2019-03-16 10:00:08'),
	(2,2,'gh',2,2.00,'S','SD','DS',0,2,0,'2019-03-11 07:47:49','2019-03-11 07:47:49'),
	(3,4,'Service Shipu 1',1,30.00,'https://www.youtube.com/watch?v=JXpJAOa_azk','This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service .This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service . This is numan Service .','Hi i am good Service Man',0,5,1,'2019-03-15 17:27:16','2019-03-16 07:47:05'),
	(4,2,'sdkljkl;',1,0.00,'.xgvodfmnv','jhytghjfggh','dfgdfg',0,3,0,'2019-03-17 10:27:10','2019-03-17 10:47:54'),
	(5,2,'KSKLJL;',2,20.00,'dasfjkl','sdfah','sdaf',0,4,0,'2019-03-17 11:00:14','2019-03-17 11:00:25'),
	(6,4,'ggg',6,33.00,'22','ygjhghj','22',0,5,0,'2019-03-17 19:39:57','2019-03-17 19:40:38');

/*!40000 ALTER TABLE `services` ENABLE KEYS */;
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
	(19,6,'lkjhk',NULL,NULL);

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
	(30,4,'Monday','00:00','04:00',20,'2019-03-17 10:27:10','2019-03-17 10:27:10'),
	(31,5,'Monday','00:00','04:00',20,'2019-03-17 11:00:14','2019-03-17 11:00:14'),
	(32,6,'Monday','01:00','04:00',20,'2019-03-17 19:39:58','2019-03-17 19:39:58'),
	(33,6,'Tuesday','05:00','09:00',20,'2019-03-17 19:39:58','2019-03-17 19:39:58');

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
  `paymentInfo` text COLLATE utf8mb4_unicode_ci,
  `billingInfo` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '/img/prfile.png',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userType` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
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

INSERT INTO `users` (`id`, `name`, `userName`, `email`, `location`, `language`, `bio`, `paymentInfo`, `billingInfo`, `image`, `country`, `phone`, `userType`, `isActive`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Nazmul Chowdhury','nazmul','nazmul@gmail.com','Sylhet','volvo','sss','sss','ss','/uploads/TR0fQprwrOD4tjEojSHPcdKUNNf6WgLEp3GB9pys.jpeg','ss','sss',4,1,NULL,'$2y$10$UwI/wodDT6856i0VZOVJL.H4ppdKJnh1R06Fk4NJyZ71brY.VQvi.','yFHxFl5qs7oNJfDlHmud3FvqJSAXzFJLKpKXQdN7Oow6qHkY9rLGT1uiuZD4','2019-03-10 11:38:59','2019-03-17 19:45:35'),
	(2,'Kamran Ahmed','Kamran','kamran@gmail.com',NULL,NULL,NULL,NULL,NULL,'/img/prfile.png',NULL,NULL,1,1,NULL,'$2y$10$obubdCG8bKN7xX2PTqwIiuls/FzoD5SkK1.Oh9pcnhCa93eY1LEmy','KXD1D4zfBM2EGmQwOtnd9WyaW1txXW67V6ecftSIjNUoexpERAmkAMXXRJPs','2019-03-11 07:45:27','2019-03-17 04:38:40'),
	(3,'Sadek Ahmed','sadek','sadek@gmail.com','Sylhet','volvo','Ami Boss Boss Boss.. Kita mato .Bolda hokol... Kamran boro Bolda',NULL,NULL,'/uploads/pUkAHn2vOW4LgOPSMOvpqvYmkYFzaevYHSFgMXAN.jpeg',NULL,NULL,1,1,NULL,'$2y$10$mwi2FqsfJWdpC5c5VphGZ.iDM3jt5rNFgTGjFkSNR6PmbkyUpS3FW','j3OZr4eL0e2wnrnU6lEbKRY9CGynzZc4CsjOOuD0vNDSVQJlAqRFlys4fcVI','2019-03-12 11:24:39','2019-03-16 06:54:57'),
	(4,'Numan Shipu 1','numan','numan@gmail.com','sylhet','volvo','this is my bio','no payment info','no billing info','/img/prfile.png','New Zealand','+641239190432',4,1,NULL,'$2y$10$aSwqXrBmg311NOuheGrUdefed0gPDVl5iPAoWmQFovDzF4EXxFVfa','6DEMyqWzH78r26zdWTOzy2c9ozKlzhkLUXWoozPnd5YnhMkKhB9p4BU83SvN','2019-03-15 12:56:42','2019-03-15 12:56:42');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
