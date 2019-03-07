-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3300
-- Generation Time: Mar 07, 2019 at 07:55 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookingmarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `bookingTime` time NOT NULL,
  `bookingDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

CREATE TABLE `cats` (
  `id` int(10) UNSIGNED NOT NULL,
  `catName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `catName`, `image`, `created_at`, `updated_at`) VALUES
(1, 'pedicure', 'uploads/cat1.svg', NULL, NULL),
(2, 'facials', 'uploads/deck-chair.svg', NULL, NULL),
(3, 'hair', 'uploads/female-hair-shape-and-face-silhouette.svg', NULL, NULL),
(4, 'make-up', 'uploads/make-up.svg', NULL, NULL),
(5, 'manicure', 'uploads/manicure.svg', NULL, NULL),
(6, 'wax', 'uploads/wax.svg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servicePrice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `service_id`, `serviceName`, `servicePrice`, `created_at`, `updated_at`) VALUES
(1, 8, 'sd', '2', '2019-03-06 14:17:25', '2019-03-06 14:17:25'),
(2, 8, 'sa', '33', '2019-03-06 14:25:09', '2019-03-06 14:25:09'),
(3, 8, 'sa', '33', '2019-03-06 14:26:00', '2019-03-06 14:26:00'),
(4, 8, 'sa', '33', '2019-03-06 14:32:16', '2019-03-06 14:32:16'),
(5, 8, 'sa', '22', '2019-03-06 14:32:16', '2019-03-06 14:32:16'),
(6, 8, 'sa', '33', '2019-03-06 14:32:27', '2019-03-06 14:32:27'),
(7, 8, 'sa', '22', '2019-03-06 14:32:28', '2019-03-06 14:32:28'),
(8, 8, 'da', '4', '2019-03-06 14:33:33', '2019-03-06 14:33:33'),
(9, 8, 'e', '5', '2019-03-06 14:33:33', '2019-03-06 14:33:33'),
(10, 8, 'ds', '2', NULL, NULL),
(11, 8, '22', '33', NULL, NULL),
(12, 8, 'ds', '2', NULL, NULL),
(13, 8, '22', '33', NULL, NULL),
(14, 8, 'ee', '33', NULL, NULL),
(15, 8, 'ee', '33', NULL, NULL),
(16, 8, 'ee', '33', NULL, NULL),
(17, 8, 'ee', '33', NULL, NULL),
(18, 8, 'ee', '33', NULL, NULL),
(19, 8, 'ee', '33', NULL, NULL),
(20, 8, 'ss', '5', NULL, NULL),
(21, 8, 'ds', '3', NULL, NULL),
(22, 8, 'ds', '3', NULL, NULL),
(23, 8, 'ds', '3', NULL, NULL),
(24, 8, 'ds', '3', NULL, NULL),
(25, 8, 'ds', '3', NULL, NULL),
(26, 8, 'ds', '3', NULL, NULL),
(27, 8, 'sd', '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `service_id`, `imageUrl`, `created_at`, `updated_at`) VALUES
(1, 14, '/uploads/uvBannX3ajcShyptRhj09rifvxRerANvmIhHfaK6.png', NULL, NULL),
(2, 14, '/uploads/uvBannX3ajcShyptRhj09rifvxRerANvmIhHfaK6.png', NULL, NULL),
(3, 14, '/uploads/AQB7w9m1vdWccL04GN7jyQ0m2V46Vyebi5f4HGDC.png', NULL, NULL),
(4, 14, '/uploads/AQB7w9m1vdWccL04GN7jyQ0m2V46Vyebi5f4HGDC.png', NULL, NULL),
(5, 14, '/uploads/Xy3TxIrU2hYdrfbHIT1tZjqACNccxDIN8XUEfaGJ.png', NULL, NULL),
(6, 14, '/uploads/3upZNP7BcMV9NMFizXfYt1EXF1O8NeLbsxuSW7rG.png', NULL, NULL),
(7, 7, '/uploads/SIbMWfjoz1K7A4hZJ0zjTJwIS4cHi3eNc1L0pzgK.jpeg', NULL, NULL),
(8, 7, '/uploads/8cY4C3tBo5BAO2Bx5J7hKuXcYci6ya2RyBfhDVHk.png', NULL, NULL),
(9, 7, '/uploads/JzN0FGyGM2e4W0z8lnnMFLO6FKSz6A6FxkutZSKP.jpeg', NULL, NULL),
(10, 7, '/uploads/BHsKdWQ8XLYuEcN8FXq1L71yclDZ3mQamDe6Ppco.png', NULL, NULL),
(11, 8, '/uploads/SfdrShi89iMxTuLVmaguSLsFZ2OamPk1nsGvmSYS.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_02_25_100443_create_services_table', 1),
(4, '2019_02_25_100654_create_tags_table', 1),
(5, '2019_02_25_100717_create_cats_table', 1),
(6, '2019_02_25_100800_create_sub_cats_table', 1),
(7, '2019_02_25_100937_create_bookings_table', 1),
(8, '2019_02_25_101002_create_reviews_table', 1),
(9, '2019_02_25_101135_create_time_settings_table', 1),
(10, '2019_02_25_101201_create_images_table', 1),
(11, '2019_02_28_192700_create_extras_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewMassege` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `srvice_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `videoLink` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openingMassage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daliveryTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `nextStep` tinyint(1) NOT NULL DEFAULT '2',
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `cat_id`, `price`, `videoLink`, `description`, `openingMassage`, `daliveryTime`, `isFeatured`, `nextStep`, `isApproved`, `created_at`, `updated_at`) VALUES
(1, 1, 'Unforgettable massage!!! And... Waxing!!!', 1, 200, 'youtube.com', 'some description is requred', 'hello world', '10:20', 1, 2, 1, NULL, NULL),
(2, 2, 'Unforgettable massage!!! And... Waxing!!!', 2, 200, 'youtube.com', 'some description is requred', 'hello world', '10:20', 1, 2, 1, NULL, NULL),
(3, 1, 'Unforgettable massage!!! And... Waxing!!!', 3, 200, 'youtube.com', 'some description is requred', 'hello world', '10:20', 1, 2, 1, NULL, NULL),
(4, 1, 'Unforgettable massage!!! And... Waxing!!!', 4, 200, 'youtube.com', 'some description is requred', 'hello world', '10:20', 1, 2, 1, NULL, NULL),
(5, 1, 'Unforgettable massage!!! And... Waxing!!!', 1, 200, 'youtube.com', 'some description is requred', 'hello world', '10:20', 0, 2, 1, NULL, NULL),
(6, 2, 'Unforgettable massage!!! And... Waxing!!!', 2, 200, 'youtube.com', 'some description is requred', 'hello world', '10:20', 0, 2, 1, NULL, NULL),
(7, 1, 'aaaaaaaaaaaa', 5, 500, 'aaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaa', 0, 3, 0, '2019-03-06 12:35:11', '2019-03-06 13:24:57'),
(8, 1, 'salon', 0, 20, 'youtube.com', 'this description', 'hi', '3', 0, 3, 0, '2019-03-06 13:36:33', '2019-03-06 15:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `sub_cats`
--

CREATE TABLE `sub_cats` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `tagName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `service_id`, `tagName`, `created_at`, `updated_at`) VALUES
(1, 8, 'sadf', NULL, NULL),
(2, 8, 'd', NULL, NULL),
(3, 8, 'sadf', NULL, NULL),
(4, 8, 'd', NULL, NULL),
(5, 8, 's', NULL, NULL),
(6, 8, 'f', NULL, NULL),
(7, 8, 's', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timessettings`
--

CREATE TABLE `timessettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `intervel` time NOT NULL,
  `weekDay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `userType`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'salman', 'salman@gmail.com', 1, NULL, '$2y$10$6BfdzS/kFxZiecblt1eHSuE1ssCLtjNQiY6ht0bQNDMKPZtOCoJo2', NULL, NULL, NULL),
(2, 'kamran', 'kamran@gmail.com', 1, NULL, '$2y$10$clZPNSZ51JbzLC.mKdBNDO.5BjuZOMt1Q5O2RpEFt3X9bPajN6.4G', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_cats`
--
ALTER TABLE `sub_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timessettings`
--
ALTER TABLE `timessettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`userName`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cats`
--
ALTER TABLE `cats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub_cats`
--
ALTER TABLE `sub_cats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `timessettings`
--
ALTER TABLE `timessettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
