-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2025 at 02:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `title`, `is_enable`, `created_at`, `updated_at`) VALUES
(3, 'size', 1, '2025-06-01 19:42:20', '2025-06-01 19:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `backlog` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `backup_date` date NOT NULL,
  `backup_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backups`
--

INSERT INTO `backups` (`id`, `backlog`, `action`, `backup_date`, `backup_time`, `created_at`, `updated_at`) VALUES
(1, 'Backup file created: u445737611_shakeeb_backup_2025_06_02_010133.sql', 'Database Backup', '2025-06-02', '01:01:33', NULL, NULL),
(2, 'Backup file created: u445737611_shakeeb_backup_2025_06_12_235504.sql', 'Database Backup', '2025-06-12', '23:55:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_enable` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `image_id`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `is_enable`) VALUES
(4, 'Ajmal', 'ajmal', 'filemanager/684805f6c932d.png', 'Ajmal', 'Ajmal', 'Ajmal', '2025-06-10 10:16:57', '2025-06-10 10:16:57', 1),
(5, 'COACH', 'coach', 'filemanager/684805eab6009.png', 'COACH', 'COACH', 'COACH', '2025-06-10 10:17:22', '2025-06-10 10:17:22', 1),
(6, 'Elizabeth Arden', 'elizabeth-arden', 'filemanager/684805db1f72d.png', 'Elizabeth Arden', 'Elizabeth Arden', 'Elizabeth Arden', '2025-06-10 10:17:37', '2025-06-10 10:17:37', 1),
(7, 'Jimmy Choo', 'Jimmy Choo', 'filemanager/684805d0215d8.png', 'Jimmy Choo', 'Jimmy Choo', 'Jimmy Choo', '2025-06-10 10:17:55', '2025-06-10 10:17:55', 1),
(8, 'John Varvatos', 'john-varvatos', 'filemanager/684805c11c433.png', 'John Varvatos', 'John Varvatos', 'John Varvatos', '2025-06-10 10:18:13', '2025-06-10 10:18:13', 1),
(9, 'Juicy Couture', 'juicy-couture', 'filemanager/684805b5ef40b.png', 'Juicy Couture', 'Juicy Couture', 'Juicy Couture', '2025-06-10 10:18:27', '2025-06-10 10:18:27', 1),
(10, 'Kenneth Cole', 'kenneth-cole', 'filemanager/6848059d6fcbb.png', 'Kenneth Cole', 'Kenneth Cole', 'Kenneth Cole', '2025-06-10 10:18:46', '2025-06-10 10:18:46', 1),
(11, 'MANCERA', 'mancera', 'filemanager/684805893f08b.png', 'MANCERA', 'MANCERA', 'MANCERA', '2025-06-10 10:19:12', '2025-06-10 10:19:12', 1),
(12, 'Mont Blanc', 'mont-blanc', 'filemanager/6848057d977f0.png', 'Mont Blanc', 'Mont Blanc', 'Mont Blanc', '2025-06-10 10:19:29', '2025-06-10 10:19:29', 1),
(13, 'MONTALE', 'montale', 'filemanager/6848056d5e5ba.png', 'MONTALE', 'MONTALE', 'MONTALE', '2025-06-10 10:19:46', '2025-06-10 10:19:46', 1),
(14, 'Trussardi', 'trussardi', 'filemanager/684805602c5df.png', 'Trussardi', 'Trussardi', 'Trussardi', '2025-06-10 10:20:48', '2025-06-10 10:20:48', 1),
(15, 'VICTORINOX', 'victorinox', 'filemanager/68480550f0ae6.png', 'VICTORINOX', 'VICTORINOX', 'VICTORINOX', '2025-06-10 10:21:01', '2025-06-10 10:21:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `details`, `image_id`, `parent_id`, `level`, `is_featured`, `sort`, `is_enable`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(45, 'Watches', 'watches', 'Watches', 'filemanager/683c646a74480.jpeg', NULL, 1, 0, 4, 1, 'Watches', 'Watches', 'Watches', '2025-06-01 19:32:24', '2025-06-01 19:32:43'),
(44, 'Health & Beauty', 'health-beauty', 'Health & Beauty', 'filemanager/683c64084f063.jpeg', NULL, 1, 1, 3, 1, 'Health & Beauty', 'Health & Beauty', 'Health & Beauty', '2025-06-01 19:30:41', '2025-06-01 19:30:59'),
(43, 'Gift sets', 'gift-sets', 'Gift sets', 'filemanager/683c639148ada.jpeg', NULL, 1, 1, 2, 1, 'Gift sets', 'Gift sets', 'Gift sets', '2025-06-01 19:28:58', '2025-06-01 19:29:23'),
(42, 'Perfumes', 'perfumes', 'Perfumes', 'filemanager/683c63121df3f.jpeg', NULL, 1, 1, 1, 1, 'Perfumes', 'Perfumes', 'Perfumes', '2025-06-01 19:26:42', '2025-06-01 19:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `title`, `slug`, `details`, `sort`, `image_id`, `meta_title`, `meta_description`, `meta_keywords`, `is_enable`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Mens', 'mens', 'favourite pieces from Mens Collections', 2, NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Womens', 'womens', 'favourite pieces from Womens Collections', 3, NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 'Unisex', 'unisex', 'UNISEX', 4, 'filemanager/GirlsShortsSummer.jpeg', NULL, NULL, NULL, 1, 1, '2025-06-12 05:24:12', '2025-06-12 18:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filemanager`
--

CREATE TABLE `filemanager` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `filename` text NOT NULL,
  `size` double DEFAULT NULL,
  `extension` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `grouping` text NOT NULL DEFAULT 'others'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filemanager`
--

INSERT INTO `filemanager` (`id`, `title`, `description`, `path`, `filename`, `size`, `extension`, `type`, `created_by`, `created_at`, `updated_at`, `is_enable`, `grouping`) VALUES
(28, 'logo', 'logo', 'filemanager/684b2226c64cb.png', 'logo.png', 1529662, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2025-06-12 18:53:26', 1, 'others'),
(48, 'perfumes', 'perfumes', 'filemanager/6831591a38850.png', '6831591a38850.png', 922616, 'png', 'image/png', NULL, '2025-05-24 10:28:58', '2025-05-24 10:28:58', 1, 'others'),
(229, 'ss', 'ss', 'filemanager/684d315fb9067.png', '684d315fb9067.png', 1529662, 'png', 'image/png', NULL, '2025-06-14 08:22:55', '2025-06-14 08:22:55', 1, 'others'),
(50, 'banner 2', 'banner 2', 'filemanager/683cab6437ebe.png', '683c4f3aac067.avif', 141685, 'png', 'image/png', NULL, '2025-06-01 18:01:46', '2025-06-01 19:35:00', 1, 'banner'),
(51, 'banner3', 'banner3', 'filemanager/683cab80b1cd2.jpg', '683c4f50b3f6d.avif', 164261, 'jpg', 'image/jpeg', NULL, '2025-06-01 18:02:08', '2025-06-01 19:35:28', 1, 'banner'),
(52, 'icon webmenu', 'icon webmenu', 'filemanager/683c608ab0706.png', '683c608ab0706.png', 81214, 'png', 'image/png', NULL, '2025-06-01 19:15:38', '2025-06-01 19:15:38', 1, 'favicon'),
(53, 'category perfumes', 'category perfumes', 'filemanager/683c63121df3f.jpeg', '683c63121df3f.jpeg', 197756, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:26:26', '2025-06-01 19:26:26', 1, 'perfumes'),
(54, 'Gift sets', 'Gift sets', 'filemanager/683c639148ada.jpeg', '683c639148ada.jpeg', 239433, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:28:33', '2025-06-01 19:28:33', 1, 'Gift sets'),
(55, 'Health & Beauty', 'Health & Beauty', 'filemanager/683c64084f063.jpeg', '683c64084f063.jpeg', 205767, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:30:32', '2025-06-01 19:30:32', 1, 'Health & Beauty'),
(56, 'Watchescat', 'Watches', 'filemanager/683c646a74480.jpeg', '683c646a74480.jpeg', 292523, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:32:10', '2025-06-01 19:32:10', 1, 'Watches'),
(57, 'AJMAL front', 'AJMAL front', 'filemanager/683c653cbdd73.jpeg', '683c653cbdd73.jpeg', 228005, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:35:40', '2025-06-01 19:35:40', 1, 'AJMAL'),
(58, 'AJMAL back', 'AJMAL back', 'filemanager/683c65502614a.jpeg', '683c65502614a.jpeg', 223382, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:36:00', '2025-06-01 19:36:00', 1, 'AJMAL'),
(59, 'COACH back', 'COACH back', 'filemanager/683c6bf3a06ae.jpeg', '683c6bf3a06ae.jpeg', 225658, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:04:19', '2025-06-01 20:04:19', 1, 'COACH'),
(60, 'COACH fornt', 'COACH', 'filemanager/683c6bfef3463.jpeg', '683c6bfef3463.jpeg', 221881, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:04:30', '2025-06-01 20:04:30', 1, 'COACH'),
(61, 'Kenneth Cole front', 'Kenneth Cole', 'filemanager/683c6d1f0a0e9.jpeg', '683c6d1f0a0e9.jpeg', 188381, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:09:19', '2025-06-01 20:09:19', 1, 'Kenneth Cole'),
(62, 'Kenneth Cole back', 'Kenneth Cole', 'filemanager/683c6d5aa0a17.jpeg', '683c6d31f4122.jpeg', 213254, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:09:38', '2025-06-01 20:10:18', 1, 'Kenneth Cole'),
(63, 'VICTORINOX', 'VICTORINOX', 'filemanager/68480550f0ae6.png', '68480550f0ae6.png', 35465, 'png', 'image/png', NULL, '2025-06-10 10:13:36', '2025-06-10 10:13:36', 1, 'others'),
(64, 'Trussardi', 'Trussardi', 'filemanager/684805602c5df.png', '684805602c5df.png', 26847, 'png', 'image/png', NULL, '2025-06-10 10:13:52', '2025-06-10 10:13:52', 1, 'others'),
(65, 'MONTALE', 'MONTALE', 'filemanager/6848056d5e5ba.png', '6848056d5e5ba.png', 26873, 'png', 'image/png', NULL, '2025-06-10 10:14:05', '2025-06-10 10:14:05', 1, 'others'),
(66, 'Mont Blanc', 'Mont Blanc', 'filemanager/6848057d977f0.png', '6848057d977f0.png', 33812, 'png', 'image/png', NULL, '2025-06-10 10:14:21', '2025-06-10 10:14:21', 1, 'others'),
(67, 'MANCERA', 'MANCERA', 'filemanager/684805893f08b.png', '684805893f08b.png', 31347, 'png', 'image/png', NULL, '2025-06-10 10:14:33', '2025-06-10 10:14:33', 1, 'others'),
(68, 'Kenneth Cole', 'Kenneth Cole', 'filemanager/6848059d6fcbb.png', '6848059d6fcbb.png', 26456, 'png', 'image/png', NULL, '2025-06-10 10:14:53', '2025-06-10 10:14:53', 1, 'others'),
(69, 'Juicy Couture', 'Juicy Couture', 'filemanager/684805b5ef40b.png', '684805b5ef40b.png', 28295, 'png', 'image/png', NULL, '2025-06-10 10:15:17', '2025-06-10 10:15:17', 1, 'others'),
(70, 'John Varvatos', 'John Varvatos', 'filemanager/684805c11c433.png', '684805c11c433.png', 22809, 'png', 'image/png', NULL, '2025-06-10 10:15:29', '2025-06-10 10:15:29', 1, 'others'),
(71, 'Jimmy Choo', 'Jimmy Choo', 'filemanager/684805d0215d8.png', '684805d0215d8.png', 31375, 'png', 'image/png', NULL, '2025-06-10 10:15:44', '2025-06-10 10:15:44', 1, 'others'),
(72, 'Elizabeth Arden', 'Elizabeth Arden', 'filemanager/684805db1f72d.png', '684805db1f72d.png', 27327, 'png', 'image/png', NULL, '2025-06-10 10:15:55', '2025-06-10 10:15:55', 1, 'others'),
(73, 'COACH logo', 'COACH', 'filemanager/684805eab6009.png', '684805eab6009.png', 40154, 'png', 'image/png', NULL, '2025-06-10 10:16:10', '2025-06-10 10:16:10', 1, 'others'),
(74, 'ajmal logo', 'ajmal logo', 'filemanager/684805f6c932d.png', '684805f6c932d.png', 54978, 'png', 'image/png', NULL, '2025-06-10 10:16:22', '2025-06-10 10:16:22', 1, 'others'),
(75, '1001 NIGHTS EDP', '1001 NIGHTS EDP', 'filemanager/68481c3624d1c.jpg', '68481c3624d1c.jpg', 248694, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:51:18', '2025-06-10 11:51:18', 1, 'others'),
(76, '1001 NIGHTS EDP3', '1001 NIGHTS EDP3', 'filemanager/68481c5f7a1a1.jpg', '68481c5f7a1a1.jpg', 131381, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:51:59', '2025-06-10 11:51:59', 1, 'others'),
(77, '1001 NIGHTS EDP2', '1001 NIGHTS EDP2', 'filemanager/68481c689bde2.jpg', '68481c689bde2.jpg', 197471, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:52:08', '2025-06-10 11:52:08', 1, 'others'),
(78, 'AMBER MUSC', 'AMBER MUSC', 'filemanager/68481d142a1e0.jpg', '68481d142a1e0.jpg', 171083, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:55:00', '2025-06-10 11:55:00', 1, 'others'),
(79, 'AMBER MUSC2', 'AMBER MUSC2', 'filemanager/68481d1fb3fc8.jpg', '68481d1fb3fc8.jpg', 78180, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:55:11', '2025-06-10 11:55:11', 1, 'others'),
(80, 'AMBER MUSC3', 'AMBER MUSC3', 'filemanager/68481d2a5bf7b.jpg', '68481d2a5bf7b.jpg', 137854, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:55:22', '2025-06-10 11:55:22', 1, 'others'),
(81, 'AMBER WOOD', 'AMBER WOOD', 'filemanager/68481dbc2c378.jpg', '68481dbc2c378.jpg', 274961, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:57:48', '2025-06-10 11:57:48', 1, 'others'),
(82, 'AMBER WOOD2', 'AMBER WOOD2', 'filemanager/68481dc4b7122.jpg', '68481dc4b7122.jpg', 100052, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:57:56', '2025-06-10 11:57:56', 1, 'others'),
(83, 'AMBER WOOD3', 'AMBER WOOD3', 'filemanager/68481dce4d797.jpg', '68481dce4d797.jpg', 227108, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:58:06', '2025-06-10 11:58:06', 1, 'others'),
(84, 'ARISTOCRAT HER', 'ARISTOCRAT HER', 'filemanager/684820d93bc30.jpg', '684820d93bc30.jpg', 268115, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:11:05', '2025-06-10 12:11:05', 1, 'others'),
(85, 'ARISTOCRAT HER2', 'ARISTOCRAT HER2', 'filemanager/684820e8b7170.jpg', '684820e8b7170.jpg', 140342, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:11:20', '2025-06-10 12:11:20', 1, 'others'),
(86, 'ARISTOCRAT HER3', 'ARISTOCRAT HER3', 'filemanager/684820f50dab8.jpg', '684820f50dab8.jpg', 158823, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:11:33', '2025-06-10 12:11:33', 1, 'others'),
(87, 'ARISTOCRAT HIM', 'ARISTOCRAT HIM', 'filemanager/684822f162fb0.jpg', '684822f162fb0.jpg', 242908, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:20:01', '2025-06-10 12:20:01', 1, 'others'),
(88, 'ARISTOCRAT HIM', 'ARISTOCRAT HIM', 'filemanager/684822f16349f.jpg', '684822f16349f.jpg', 207206, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:20:01', '2025-06-10 12:20:01', 1, 'others'),
(89, 'ARISTOCRAT HIM', 'ARISTOCRAT HIM', 'filemanager/684822f163872.jpg', '684822f163872.jpg', 408084, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:20:01', '2025-06-10 12:20:01', 1, 'others'),
(90, 'ARISTOCRAT PLATINUM', 'ARISTOCRAT PLATINUM', 'filemanager/68482374387c3.jpg', '68482374387c3.jpg', 98133, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:22:12', '2025-06-10 12:22:12', 1, 'others'),
(91, 'ARISTOCRAT PLATINUM', 'ARISTOCRAT PLATINUM', 'filemanager/6848237438ca8.jpg', '6848237438ca8.jpg', 148387, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:22:12', '2025-06-10 12:22:12', 1, 'others'),
(92, 'ARISTOCRAT PLATINUM', 'ARISTOCRAT PLATINUM', 'filemanager/68482374390ca.jpg', '68482374390ca.jpg', 124125, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:22:12', '2025-06-10 12:22:12', 1, 'others'),
(93, 'AURUM', 'AURUM', 'filemanager/684823ea0c4e2.jpg', '684823ea0c4e2.jpg', 127148, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:24:10', '2025-06-10 12:24:10', 1, 'others'),
(94, 'AURUM', 'AURUM', 'filemanager/684823ea0cac9.jpg', '684823ea0cac9.jpg', 338745, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:24:10', '2025-06-10 12:24:10', 1, 'others'),
(95, 'AURUM', 'AURUM', 'filemanager/684823ea0d0dc.jpg', '684823ea0d0dc.jpg', 412924, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:24:10', '2025-06-10 12:24:10', 1, 'others'),
(96, 'AURUM MINIATURE', 'AURUM MINIATURE', 'filemanager/6848245f4d865.jpg', '6848245f4d865.jpg', 73203, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:26:07', '2025-06-10 12:26:07', 1, 'others'),
(97, 'AURUM MINIATURE', 'AURUM MINIATURE', 'filemanager/6848245f4dd17.jpg', '6848245f4dd17.jpg', 132329, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:26:07', '2025-06-10 12:26:07', 1, 'others'),
(98, 'AURUM MINIATURE', 'AURUM MINIATURE', 'filemanager/6848245f4e111.jpg', '6848245f4e111.jpg', 141570, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:26:07', '2025-06-10 12:26:07', 1, 'others'),
(99, 'AURUM SUMMER', 'AURUM SUMMER', 'filemanager/684824cd0a41f.jpg', '684824cd0a41f.jpg', 75288, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:27:57', '2025-06-10 12:27:57', 1, 'others'),
(100, 'AURUM SUMMER', 'AURUM SUMMER', 'filemanager/684824cd0a84b.jpg', '684824cd0a84b.jpg', 122105, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:27:57', '2025-06-10 12:27:57', 1, 'others'),
(101, 'AURUM SUMMER', 'AURUM SUMMER', 'filemanager/684824cd0ac1a.jpg', '684824cd0ac1a.jpg', 98554, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:27:57', '2025-06-10 12:27:57', 1, 'others'),
(107, 'dd', 'dd', 'filemanager/68495cd959b1d.jpg', '68495cd959b1d.jpg', 9604, 'jpg', 'image/jpeg', NULL, '2025-06-11 10:39:21', '2025-06-11 10:39:21', 1, 'others'),
(104, 'logonee', 'shakeeb', 'filemanager/684950ae0c22f.jpg', '684950ae0c22f.jpg', 9604, 'jpg', 'image/jpeg', NULL, '2025-06-11 09:47:26', '2025-06-11 10:21:54', 1, 'others'),
(108, 'test', 'test', 'filemanager/6849690ab3ed1.png', '6849690ab3ed1.png', 1529662, 'png', 'image/png', NULL, '2025-06-11 11:31:22', '2025-06-11 11:31:22', 1, 'others'),
(110, 'BLU BY AJMAL', 'BLU BY AJMAL', 'filemanager/68497fd872030.jpg', '68497fd872030.jpg', 299782, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:08:40', '2025-06-11 13:08:40', 1, 'BLU BY AJMAL'),
(111, 'BLU BY AJMAL', 'BLU BY AJMAL', 'filemanager/68497fd87251c.jpg', '68497fd87251c.jpg', 142786, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:08:40', '2025-06-11 13:08:40', 1, 'BLU BY AJMAL'),
(112, 'BLU BY AJMAL', 'BLU BY AJMAL', 'filemanager/68497fd8728a4.jpg', '68497fd8728a4.jpg', 223095, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:08:40', '2025-06-11 13:08:40', 1, 'BLU BY AJMAL'),
(113, 'BLU MINIATURE', 'BLU MINIATURE', 'filemanager/68498036971e7.jpg', '68498036971e7.jpg', 71002, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:10:14', '2025-06-11 13:10:14', 1, 'BLU MINIATURE'),
(114, 'BLU MINIATURE', 'BLU MINIATURE', 'filemanager/68498036975f4.jpg', '68498036975f4.jpg', 129670, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:10:14', '2025-06-11 13:10:14', 1, 'BLU MINIATURE'),
(115, 'BLU MINIATURE', 'BLU MINIATURE', 'filemanager/6849803697949.jpg', '6849803697949.jpg', 125136, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:10:14', '2025-06-11 13:10:14', 1, 'BLU MINIATURE'),
(116, '6293708000425', '6293708000425', 'filemanager/68498097bea51.jpg', '68498097bea51.jpg', 83558, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:11:51', '2025-06-11 13:11:51', 1, 'others'),
(117, '6293708000425-1', '6293708000425-1', 'filemanager/68498097bee7a.jpg', '68498097bee7a.jpg', 54189, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:11:51', '2025-06-11 13:11:51', 1, 'others'),
(118, '6293708000425-2', '6293708000425-2', 'filemanager/68498097bf1cd.jpg', '68498097bf1cd.jpg', 72641, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:11:51', '2025-06-11 13:11:51', 1, 'others'),
(119, 'CARBON', 'CARBON', 'filemanager/684980b024caa.jpg', '684980b024caa.jpg', 83558, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:12:16', '2025-06-11 13:12:16', 1, 'others'),
(120, 'CARBON', 'CARBON', 'filemanager/684980b02508a.jpg', '684980b02508a.jpg', 54189, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:12:16', '2025-06-11 13:12:16', 1, 'others'),
(121, 'CARBON', 'CARBON', 'filemanager/684980b0253b0.jpg', '684980b0253b0.jpg', 72641, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:12:16', '2025-06-11 13:12:16', 1, 'others'),
(122, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008b5bd.jpg', '684981008b5bd.jpg', 49343, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(123, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008bb13.jpg', '684981008bb13.jpg', 64028, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(124, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008bf4e.jpg', '684981008bf4e.jpg', 49354, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(125, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008c256.jpg', '684981008c256.jpg', 104776, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(126, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008c574.jpg', '684981008c574.jpg', 134335, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(127, 'CHIVALRY', 'CHIVALRY', 'filemanager/68498151babf5.jpg', '68498151babf5.jpg', 74471, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:14:57', '2025-06-11 13:14:57', 1, 'CHIVALRY'),
(128, 'CHIVALRY', 'CHIVALRY', 'filemanager/68498151bb095.jpg', '68498151bb095.jpg', 178502, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:14:57', '2025-06-11 13:14:57', 1, 'CHIVALRY'),
(129, 'CHIVALRY', 'CHIVALRY', 'filemanager/68498151bb47c.jpg', '68498151bb47c.jpg', 182036, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:14:57', '2025-06-11 13:14:57', 1, 'CHIVALRY'),
(130, 'CUIR MUSC', 'CUIR MUSC', 'filemanager/6849819d2b58e.jpg', '6849819d2b58e.jpg', 69011, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:16:13', '2025-06-11 13:16:13', 1, 'CUIR MUSC'),
(131, 'CUIR MUSC', 'CUIR MUSC', 'filemanager/6849819d2b956.jpg', '6849819d2b956.jpg', 76611, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:16:13', '2025-06-11 13:16:13', 1, 'CUIR MUSC'),
(132, 'CUIR MUSC', 'CUIR MUSC', 'filemanager/6849819d2bc5c.jpg', '6849819d2bc5c.jpg', 63112, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:16:13', '2025-06-11 13:16:13', 1, 'CUIR MUSC'),
(133, 'DANAT AL DUNIYA', 'DANAT AL DUNIYA', 'filemanager/684981fc75c45.jpg', '684981fc75c45.jpg', 57961, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:17:48', '2025-06-11 13:17:48', 1, 'DANAT AL DUNIYA'),
(134, 'DANAT AL DUNIYA', 'DANAT AL DUNIYA', 'filemanager/684981fc760d7.jpg', '684981fc760d7.jpg', 110182, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:17:48', '2025-06-11 13:17:48', 1, 'DANAT AL DUNIYA'),
(135, 'DANAT AL DUNIYA', 'DANAT AL DUNIYA', 'filemanager/684981fc764b9.jpg', '684981fc764b9.jpg', 108838, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:17:48', '2025-06-11 13:17:48', 1, 'DANAT AL DUNIYA'),
(136, 'ELIXIR INTENSE', 'ELIXIR INTENSE', 'filemanager/68498298b8109.jpg', '68498298b8109.jpg', 63090, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:20:24', '2025-06-11 13:20:24', 1, 'ELIXIR INTENSE'),
(137, 'ELIXIR INTENSE', 'ELIXIR INTENSE', 'filemanager/68498298b8673.jpg', '68498298b8673.jpg', 67807, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:20:24', '2025-06-11 13:20:24', 1, 'ELIXIR INTENSE'),
(138, 'ELIXIR INTENSE', 'ELIXIR INTENSE', 'filemanager/68498298b8a3f.jpg', '68498298b8a3f.jpg', 63064, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:20:24', '2025-06-11 13:20:24', 1, 'ELIXIR INTENSE'),
(139, 'ELIXIR PRECIOUS', 'ELIXIR PRECIOUS', 'filemanager/684982f3f1aee.jpg', '684982f3f1aee.jpg', 65667, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:21:55', '2025-06-11 13:21:55', 1, 'others'),
(140, 'ELIXIR PRECIOUS', 'ELIXIR PRECIOUS', 'filemanager/684982f3f1f04.jpg', '684982f3f1f04.jpg', 68252, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:21:55', '2025-06-11 13:21:55', 1, 'others'),
(141, 'ELIXIR PRECIOUS', 'ELIXIR PRECIOUS', 'filemanager/684982f3f2226.jpg', '684982f3f2226.jpg', 63688, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:21:55', '2025-06-11 13:21:55', 1, 'others'),
(142, 'ELIXIR SUAVE', 'ELIXIR SUAVE', 'filemanager/684983cb547b7.jpg', '684983cb547b7.jpg', 59766, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:25:31', '2025-06-11 13:25:31', 1, 'others'),
(143, 'ELIXIR SUAVE', 'ELIXIR SUAVE', 'filemanager/684983cb54bbe.jpg', '684983cb54bbe.jpg', 67410, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:25:31', '2025-06-11 13:25:31', 1, 'others'),
(144, 'ELIXIR SUAVE', 'ELIXIR SUAVE', 'filemanager/684983cb54fdb.jpg', '684983cb54fdb.jpg', 62205, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:25:31', '2025-06-11 13:25:31', 1, 'others'),
(145, 'EVOKE HIM', 'EVOKE HIM', 'filemanager/6849847522f4f.jpg', '6849847522f4f.jpg', 65876, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:28:21', '2025-06-11 13:28:21', 1, 'EVOKE HIM'),
(146, 'EVOKE HIM', 'EVOKE HIM', 'filemanager/68498475235bb.jpg', '68498475235bb.jpg', 155550, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:28:21', '2025-06-11 13:28:21', 1, 'EVOKE HIM'),
(147, 'EVOKE HIM', 'EVOKE HIM', 'filemanager/6849847523985.jpg', '6849847523985.jpg', 166362, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:28:21', '2025-06-11 13:28:21', 1, 'EVOKE HIM'),
(148, 'GOLD MAN', 'GOLD MAN', 'filemanager/684984ba46a9e.jpg', '684984ba46a9e.jpg', 72241, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:29:30', '2025-06-11 13:29:30', 1, 'GOLD MAN'),
(149, 'GOLD MAN', 'GOLD MAN', 'filemanager/684984ba46e78.jpg', '684984ba46e78.jpg', 170220, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:29:30', '2025-06-11 13:29:30', 1, 'GOLD MAN'),
(150, 'GOLD MAN', 'GOLD MAN', 'filemanager/684984ba471e0.jpg', '684984ba471e0.jpg', 183227, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:29:30', '2025-06-11 13:29:30', 1, 'GOLD MAN'),
(151, 'GRAY', 'GRAY', 'filemanager/684984fe0d8e4.jpg', '684984fe0d8e4.jpg', 57842, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:30:38', '2025-06-11 13:30:38', 1, 'others'),
(152, 'GRAY', 'GRAY', 'filemanager/684984fe0dd33.jpg', '684984fe0dd33.jpg', 78806, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:30:38', '2025-06-11 13:30:38', 1, 'others'),
(153, 'GRAY', 'GRAY', 'filemanager/684984fe0e0e8.jpg', '684984fe0e0e8.jpg', 68304, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:30:38', '2025-06-11 13:30:38', 1, 'others'),
(154, 'HATKORA WOOD', 'HATKORA WOOD', 'filemanager/6849853f1702f.jpg', '6849853f1702f.jpg', 54595, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:31:43', '2025-06-11 13:31:43', 1, 'others'),
(155, 'HATKORA WOOD', 'HATKORA WOOD', 'filemanager/6849853f17472.jpg', '6849853f17472.jpg', 97949, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:31:43', '2025-06-11 13:31:43', 1, 'others'),
(156, 'HATKORA WOOD', 'HATKORA WOOD', 'filemanager/6849853f177b7.jpg', '6849853f177b7.jpg', 102720, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:31:43', '2025-06-11 13:31:43', 1, 'others'),
(157, 'INCENSE WOOD', 'INCENSE WOOD', 'filemanager/6849863f42557.jpg', '6849863f42557.jpg', 52337, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:35:59', '2025-06-11 13:35:59', 1, 'INCENSE WOOD'),
(158, 'INCENSE WOOD', 'INCENSE WOOD', 'filemanager/6849863f42a73.jpg', '6849863f42a73.jpg', 67084, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:35:59', '2025-06-11 13:35:59', 1, 'INCENSE WOOD'),
(159, 'INCENSE WOOD', 'INCENSE WOOD', 'filemanager/6849863f42d49.jpg', '6849863f42d49.jpg', 61262, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:35:59', '2025-06-11 13:35:59', 1, 'INCENSE WOOD'),
(160, 'KURO', 'KURO', 'filemanager/6849868ebd833.jpg', '6849868ebd833.jpg', 64214, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:37:18', '2025-06-11 13:37:18', 1, 'KURO'),
(161, 'KURO', 'KURO', 'filemanager/6849868ebdc61.jpg', '6849868ebdc61.jpg', 191002, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:37:18', '2025-06-11 13:37:18', 1, 'KURO'),
(162, 'KURO', 'KURO', 'filemanager/6849868ebe096.jpg', '6849868ebe096.jpg', 153675, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:37:18', '2025-06-11 13:37:18', 1, 'KURO'),
(163, 'MIZYAAN', 'MIZYAAN', 'filemanager/684986cd7f203.jpg', '684986cd7f203.jpg', 144257, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:38:21', '2025-06-11 13:38:21', 1, 'MIZYAAN'),
(164, 'MIZYAAN', 'MIZYAAN', 'filemanager/684986cd7f67f.jpg', '684986cd7f67f.jpg', 268898, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:38:21', '2025-06-11 13:38:21', 1, 'MIZYAAN'),
(165, 'MIZYAAN', 'MIZYAAN', 'filemanager/684986cd7fa73.jpg', '684986cd7fa73.jpg', 275980, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:38:21', '2025-06-11 13:38:21', 1, 'MIZYAAN'),
(166, 'MUSK KHAS', 'MUSK KHAS', 'filemanager/684987487b22b.jpg', '684987487b22b.jpg', 100052, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:40:24', '2025-06-11 13:40:24', 1, 'MUSK KHAS'),
(167, 'MUSK KHAS', 'MUSK KHAS', 'filemanager/684987487b6e4.jpg', '684987487b6e4.jpg', 227108, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:40:24', '2025-06-11 13:40:24', 1, 'MUSK KHAS'),
(168, 'MUSK KHAS', 'MUSK KHAS', 'filemanager/684987487bbd6.jpg', '684987487bbd6.jpg', 274961, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:40:24', '2025-06-11 13:40:24', 1, 'MUSK KHAS'),
(169, 'NEUTRON', 'NEUTRON', 'filemanager/684987f22dc22.jpg', '684987f22dc22.jpg', 118849, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:43:14', '2025-06-11 13:43:14', 1, 'NEUTRON'),
(170, 'NEUTRON', 'NEUTRON', 'filemanager/684987f22e146.jpg', '684987f22e146.jpg', 101735, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:43:14', '2025-06-11 13:43:14', 1, 'NEUTRON'),
(171, 'NEUTRON', 'NEUTRON', 'filemanager/684987f22e55d.jpg', '684987f22e55d.jpg', 131641, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:43:14', '2025-06-11 13:43:14', 1, 'NEUTRON'),
(172, 'PATCHOULI WOOD', 'PATCHOULI WOOD', 'filemanager/6849882898a4f.jpg', '6849882898a4f.jpg', 94610, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:44:08', '2025-06-11 13:44:08', 1, 'others'),
(173, 'PATCHOULI WOOD', 'PATCHOULI WOOD', 'filemanager/6849882898e6d.jpg', '6849882898e6d.jpg', 77910, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:44:08', '2025-06-11 13:44:08', 1, 'others'),
(174, 'PATCHOULI WOOD', 'PATCHOULI WOOD', 'filemanager/6849882899193.jpg', '6849882899193.jpg', 67077, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:44:08', '2025-06-11 13:44:08', 1, 'others'),
(175, 'RAINDROPS', 'RAINDROPS', 'filemanager/684988e2f29a5.jpg', '684988e2f29a5.jpg', 57941, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:47:14', '2025-06-11 13:47:14', 1, 'RAINDROPS'),
(176, 'RAINDROPS', 'RAINDROPS', 'filemanager/684988e2f2f15.jpg', '684988e2f2f15.jpg', 45800, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:47:14', '2025-06-11 13:47:14', 1, 'RAINDROPS'),
(177, 'RAINDROPS', 'RAINDROPS', 'filemanager/684988e2f3258.jpg', '684988e2f3258.jpg', 57780, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:47:14', '2025-06-11 13:47:14', 1, 'RAINDROPS'),
(178, 'RAINDROPS MINIATURE', 'RAINDROPS MINIATURE', 'filemanager/68498a3290791.jpg', '68498a3290791.jpg', 61072, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:52:50', '2025-06-11 13:52:50', 1, 'RAINDROPS MINIATURE'),
(179, 'RAINDROPS MINIATURE', 'RAINDROPS MINIATURE', 'filemanager/68498a3290b58.jpg', '68498a3290b58.jpg', 84362, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:52:50', '2025-06-11 13:52:50', 1, 'RAINDROPS MINIATURE'),
(180, 'RAINDROPS MINIATURE', 'RAINDROPS MINIATURE', 'filemanager/68498a3290ec4.jpg', '68498a3290ec4.jpg', 72488, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:52:50', '2025-06-11 13:52:50', 1, 'RAINDROPS MINIATURE'),
(181, 'ROSE WOOD', 'ROSE WOOD', 'filemanager/68498a6d4d0a8.jpg', '68498a6d4d0a8.jpg', 61667, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:53:49', '2025-06-11 13:53:49', 1, 'others'),
(182, 'ROSE WOOD', 'ROSE WOOD', 'filemanager/68498a6d4d4f1.jpg', '68498a6d4d4f1.jpg', 117977, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:53:49', '2025-06-11 13:53:49', 1, 'others'),
(183, 'ROSE WOOD', 'ROSE WOOD', 'filemanager/68498a6d4d8fd.jpg', '68498a6d4d8fd.jpg', 117926, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:53:49', '2025-06-11 13:53:49', 1, 'others'),
(184, 'SACRED LOVE', 'SACRED LOVE', 'filemanager/68498aa6597cd.jpg', '68498aa6597cd.jpg', 104776, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:54:46', '2025-06-11 13:54:46', 1, 'SACRED LOVE'),
(185, 'SACRED LOVE', 'SACRED LOVE', 'filemanager/68498aa659d8c.jpg', '68498aa659d8c.jpg', 116396, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:54:46', '2025-06-11 13:54:46', 1, 'SACRED LOVE'),
(186, 'SACRED LOVE', 'SACRED LOVE', 'filemanager/68498aa65a2a8.jpg', '68498aa65a2a8.jpg', 166366, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:54:46', '2025-06-11 13:54:46', 1, 'SACRED LOVE'),
(187, 'SACRED LOVE MINIATURE', 'SACRED LOVE MINIATURE', 'filemanager/68498ae02d1cc.jpg', '68498ae02d1cc.jpg', 73937, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:55:44', '2025-06-11 13:55:44', 1, 'SACRED LOVE MINIATURE'),
(188, 'SACRED LOVE MINIATURE', 'SACRED LOVE MINIATURE', 'filemanager/68498ae02d6b2.jpg', '68498ae02d6b2.jpg', 108390, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:55:44', '2025-06-11 13:55:44', 1, 'SACRED LOVE MINIATURE'),
(189, 'SACRED LOVE MINIATURE', 'SACRED LOVE MINIATURE', 'filemanager/68498ae02da7b.jpg', '68498ae02da7b.jpg', 88447, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:55:44', '2025-06-11 13:55:44', 1, 'SACRED LOVE MINIATURE'),
(190, 'SANTAL WOOD', 'SANTAL WOOD', 'filemanager/68498b27b2459.jpg', '68498b27b2459.jpg', 78208, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:56:55', '2025-06-11 13:56:55', 1, 'SANTAL WOOD'),
(191, 'SANTAL WOOD', 'SANTAL WOOD', 'filemanager/68498b27b289e.jpg', '68498b27b289e.jpg', 98676, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:56:55', '2025-06-11 13:56:55', 1, 'SANTAL WOOD'),
(192, 'SANTAL WOOD', 'SANTAL WOOD', 'filemanager/68498b27b2c0d.jpg', '68498b27b2c0d.jpg', 83486, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:56:55', '2025-06-11 13:56:55', 1, 'SANTAL WOOD'),
(193, 'SERENITY IN ME', 'SERENITY IN ME', 'filemanager/68498b5ca20fd.jpg', '68498b5ca20fd.jpg', 58722, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:57:48', '2025-06-11 13:57:48', 1, 'SERENITY IN ME'),
(194, 'SERENITY IN ME', 'SERENITY IN ME', 'filemanager/68498b5ca261c.jpg', '68498b5ca261c.jpg', 100838, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:57:48', '2025-06-11 13:57:48', 1, 'SERENITY IN ME'),
(195, 'SERENITY IN ME', 'SERENITY IN ME', 'filemanager/68498b5ca2dc7.jpg', '68498b5ca2dc7.jpg', 87910, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:57:48', '2025-06-11 13:57:48', 1, 'SERENITY IN ME'),
(196, 'SHADOW HER', 'SHADOW HER', 'filemanager/68498bc3d36d1.jpg', '68498bc3d36d1.jpg', 136139, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:59:31', '2025-06-11 13:59:31', 1, 'SHADOW HER'),
(197, 'SHADOW HER', 'SHADOW HER', 'filemanager/68498bc3d3b43.jpg', '68498bc3d3b43.jpg', 135630, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:59:31', '2025-06-11 13:59:31', 1, 'SHADOW HER'),
(198, 'SHADOW HER', 'SHADOW HER', 'filemanager/68498bc3d3f0f.jpg', '68498bc3d3f0f.jpg', 179178, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:59:31', '2025-06-11 13:59:31', 1, 'SHADOW HER'),
(199, 'SHADOW HIM', 'SHADOW HIM', 'filemanager/68498bfb8770d.jpg', '68498bfb8770d.jpg', 70938, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:00:27', '2025-06-11 14:00:27', 1, 'SHADOW HIM'),
(200, 'SHADOW HIM', 'SHADOW HIM', 'filemanager/68498bfb87d38.jpg', '68498bfb87d38.jpg', 105552, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:00:27', '2025-06-11 14:00:27', 1, 'SHADOW HIM'),
(201, 'SHADOW HIM', 'SHADOW HIM', 'filemanager/68498bfb8828b.jpg', '68498bfb8828b.jpg', 90328, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:00:27', '2025-06-11 14:00:27', 1, 'SHADOW HIM'),
(202, 'SHINE', 'SHINE', 'filemanager/68498c41c337e.jpg', '68498c41c337e.jpg', 112433, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:01:37', '2025-06-11 14:01:37', 1, 'SHINE'),
(203, 'SHINE', 'SHINE', 'filemanager/68498c41c3802.jpg', '68498c41c3802.jpg', 333460, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:01:37', '2025-06-11 14:01:37', 1, 'SHINE'),
(204, 'SHINE', 'SHINE', 'filemanager/68498c41c3c8b.jpg', '68498c41c3c8b.jpg', 360039, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:01:37', '2025-06-11 14:01:37', 1, 'SHINE'),
(205, 'SIGNIFY', 'SIGNIFY', 'filemanager/68498c963ce0a.jpg', '68498c963ce0a.jpg', 190049, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:03:02', '2025-06-11 14:03:02', 1, 'SIGNIFY'),
(206, 'SIGNIFY', 'SIGNIFY', 'filemanager/68498c963d39f.jpg', '68498c963d39f.jpg', 523207, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:03:02', '2025-06-11 14:03:02', 1, 'SIGNIFY'),
(207, 'SIGNIFY', 'SIGNIFY', 'filemanager/68498c963d982.jpg', '68498c963d982.jpg', 400125, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:03:02', '2025-06-11 14:03:02', 1, 'SIGNIFY'),
(208, 'SILVER SHADE', 'SILVER SHADE', 'filemanager/68498d708124a.jpg', '68498d708124a.jpg', 116012, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:06:40', '2025-06-11 14:06:40', 1, 'SILVER SHADE'),
(209, 'SILVER SHADE', 'SILVER SHADE', 'filemanager/68498d7081710.jpg', '68498d7081710.jpg', 162844, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:06:40', '2025-06-11 14:06:40', 1, 'SILVER SHADE'),
(210, 'SILVER SHADE', 'SILVER SHADE', 'filemanager/68498d7081ab0.jpg', '68498d7081ab0.jpg', 174526, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:06:40', '2025-06-11 14:06:40', 1, 'SILVER SHADE'),
(211, 'TITANIUM HIM', 'TITANIUM HIM', 'filemanager/68498f1f23974.jpg', '68498f1f23974.jpg', 51227, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:13:51', '2025-06-11 14:13:51', 1, 'TITANIUM HIM'),
(212, 'TITANIUM HIM', 'TITANIUM HIM', 'filemanager/68498f1f23d31.jpg', '68498f1f23d31.jpg', 65550, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:13:51', '2025-06-11 14:13:51', 1, 'TITANIUM HIM'),
(213, 'TITANIUM HIM', 'TITANIUM HIM', 'filemanager/68498f1f24060.jpg', '68498f1f24060.jpg', 54269, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:13:51', '2025-06-11 14:13:51', 1, 'TITANIUM HIM'),
(214, 'VIOLET MUSC', 'VIOLET MUSC', 'filemanager/68498f65db16d.jpg', '68498f65db16d.jpg', 79441, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:15:01', '2025-06-11 14:15:01', 1, 'VIOLET MUSC'),
(215, 'VIOLET MUSC', 'VIOLET MUSC', 'filemanager/68498f65db52d.jpg', '68498f65db52d.jpg', 142458, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:15:01', '2025-06-11 14:15:01', 1, 'VIOLET MUSC'),
(216, 'VIOLET MUSC', 'VIOLET MUSC', 'filemanager/68498f65db8d0.jpg', '68498f65db8d0.jpg', 97377, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:15:01', '2025-06-11 14:15:01', 1, 'VIOLET MUSC'),
(217, 'WANDERER', 'WANDERER', 'filemanager/68498fa0b82c1.jpg', '68498fa0b82c1.jpg', 72945, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:16:00', '2025-06-11 14:16:00', 1, 'WANDERER'),
(218, 'WANDERER', 'WANDERER', 'filemanager/68498fa0b8824.jpg', '68498fa0b8824.jpg', 158220, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:16:00', '2025-06-11 14:16:00', 1, 'WANDERER'),
(219, 'WANDERER', 'WANDERER', 'filemanager/68498fa0b8bf6.jpg', '68498fa0b8bf6.jpg', 156689, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:16:00', '2025-06-11 14:16:00', 1, 'WANDERER'),
(220, 'WISAL', 'WISAL', 'filemanager/6849900c017bc.jpg', '6849900c017bc.jpg', 119300, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:17:48', '2025-06-11 14:17:48', 1, 'WISAL'),
(221, 'WISAL', 'WISAL', 'filemanager/6849900c01c2e.jpg', '6849900c01c2e.jpg', 183937, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:17:48', '2025-06-11 14:17:48', 1, 'WISAL'),
(222, 'WISAL', 'WISAL', 'filemanager/6849900c01fa8.jpg', '6849900c01fa8.jpg', 188961, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:17:48', '2025-06-11 14:17:48', 1, 'WISAL'),
(223, 'WISAL DHAHAB', 'WISAL DHAHAB', 'filemanager/6849904bca617.jpg', '6849904bca617.jpg', 107694, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:18:51', '2025-06-11 14:18:51', 1, 'WISAL DHAHAB'),
(224, 'WISAL DHAHAB', 'WISAL DHAHAB', 'filemanager/6849904bcaaaa.jpg', '6849904bcaaaa.jpg', 245120, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:18:51', '2025-06-11 14:18:51', 1, 'WISAL DHAHAB'),
(225, 'WISAL DHAHAB', 'WISAL DHAHAB', 'filemanager/6849904bcaf3c.jpg', '6849904bcaf3c.jpg', 254905, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:18:51', '2025-06-11 14:18:51', 1, 'WISAL DHAHAB'),
(226, 'banner rear', 'banner rear', 'filemanager/684999bfabc64.png', '684999bfabc64.png', 2332876, 'png', 'image/png', NULL, '2025-06-11 14:59:11', '2025-06-11 14:59:11', 1, 'banner rear'),
(227, 'banner rear2', 'banner rear2', 'filemanager/68499a6001516.png', '68499a6001516.png', 1483809, 'png', 'image/png', NULL, '2025-06-11 15:01:52', '2025-06-11 15:01:52', 1, 'banner rear'),
(228, 'banner rear3', 'banner rear3', 'filemanager/684d33b3b9fe6.png', '68499ad269847.png', 937770, 'png', 'image/png', NULL, '2025-06-11 15:03:46', '2025-06-14 08:32:51', 1, 'banner rear'),
(232, 'asdasd', 'asdasd', 'filemanager/684d4b9342bcd.png', '684d4b9342bcd.png', 28295, 'png', 'image/png', NULL, '2025-06-14 15:14:43', '2025-06-14 15:14:43', 1, 'others');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `slug`, `details`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'main menu', 'main-menu', NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Footer Menu 1', 'footer-menu-1', NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Footer Menu 2', 'footer-menu-2', NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `subtitle`, `target`, `link`, `level`, `parent_id`, `menu_id`, `sort`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'Home', NULL, NULL, '/', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2025-06-01 20:01:46'),
(2, 'Shop', NULL, NULL, 'shop', 1, NULL, 1, 1, 1, '2024-09-25 16:48:48', '2025-06-01 20:01:46'),
(38, 'Contact', NULL, NULL, '/contact', 1, NULL, 1, 5, 1, '2025-06-01 20:01:20', '2025-08-18 15:30:11'),
(37, 'About', NULL, NULL, '/about', 1, NULL, 1, 4, 1, '2025-06-01 19:58:27', '2025-08-18 15:29:52'),
(25, 'Monitors', NULL, NULL, '/shop?category=monitors', 2, 2, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(26, 'Mobiles', NULL, NULL, '/shop?category=mobiles', 2, 2, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(27, 'About Us', NULL, NULL, '/pages/about-us', 1, NULL, 2, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(28, 'Order Tracking', NULL, NULL, '/order-tracking', 1, NULL, 2, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(29, 'FAQs', NULL, NULL, '/pages/faq', 1, NULL, 2, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(30, 'Contact Us', NULL, NULL, '/pages/contact-us', 1, NULL, 2, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(31, 'Shipping Policy', NULL, NULL, '/pages/shipping-policy', 1, NULL, 3, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(32, 'Returns & Exchange', NULL, NULL, '/pages/exchange-and-return-policy', 1, NULL, 3, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(33, 'Privacy Policy', NULL, NULL, '/pages/privacy-policy', 1, NULL, 3, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(34, 'Terms & condition', NULL, NULL, '/pages/terms-conditions', 1, NULL, 3, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_18_140129_create_attributes_table', 1),
(6, '2024_05_18_140812_create_brands_table', 1),
(7, '2024_05_18_141703_create_categories_table', 1),
(8, '2024_05_18_141752_create_collections_table', 1),
(9, '2024_05_18_142133_create_filemanager_table', 1),
(10, '2024_05_18_142230_create_menus_table', 1),
(11, '2024_05_18_142420_create_menu_items_table', 1),
(12, '2024_05_18_143227_create_newsletters_table', 1),
(13, '2024_05_18_143629_create_pages_table', 1),
(14, '2024_05_18_143810_create_payment_methods_table', 1),
(15, '2024_05_18_144340_create_products_table', 1),
(16, '2024_05_18_144425_create_product_collections_table', 1),
(17, '2024_05_18_144517_create_roles_table', 1),
(18, '2024_05_18_144624_create_settings_table', 1),
(19, '2024_05_18_144728_create_sliders_table', 1),
(20, '2024_05_18_144939_create_values_table', 1),
(21, '2024_05_18_145043_create_variations_table', 1),
(22, '2024_05_18_145125_create_variation_attributes_table', 1),
(23, '2024_05_18_145126_create_orders_table', 1),
(24, '2024_05_18_145127_create_order_status_table', 1),
(25, '2024_05_18_145128_create_order_items_table', 1),
(26, '2024_05_21_103826_add_settings_data', 1),
(27, '2024_05_21_104016_add_role_and_user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` text DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tracking_id` text DEFAULT NULL,
  `sno` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `order_status` text NOT NULL,
  `order_notes` text DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `delivery_charges` double NOT NULL DEFAULT 0,
  `grandtotal` double DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_notes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_id`, `sno`, `customer_name`, `customer_email`, `customer_phone`, `country`, `city`, `address`, `payment_method`, `payment_status`, `order_status`, `order_notes`, `subtotal`, `delivery_charges`, `grandtotal`, `is_enable`, `created_at`, `updated_at`, `customer_notes`) VALUES
(4, '68482cbc31be7', NULL, 'Muhammad Shakeeb Raza', 'man411210@gmail.com', '34060955366', 'pakistan', 'karachi', 'Sbsbusha', '1', 'unpaid', '2', NULL, 12000, 200, 12200, 1, '2025-06-10 13:01:48', '2025-06-12 18:48:08', 'bbaha');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `sku` text DEFAULT NULL,
  `image_id` text DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `attr` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `variation_id`, `title`, `sku`, `image_id`, `quantity`, `price`, `total`, `attr`, `created_at`, `updated_at`) VALUES
(1, 1, 27, 'Lenovo Core i5 3rd Generation | 8GB Ram , 500GB Hard Drive', 'xl-red', 'http://127.0.0.1:8000/demo/laptop1.png', 1, 70000, 70000, '[{\"attribute_title\":\"size\",\"attribute_id\":1,\"values_id\":1,\"values_title\":\"xl\"},{\"attribute_title\":\"color\",\"attribute_id\":2,\"values_id\":15,\"values_title\":\"red\"}]', '2025-02-13 20:24:27', '2025-02-13 20:24:27'),
(2, 1, 19, 'Black Sleeve Zipper Style Jacket For Men', 'xl-red', 'http://127.0.0.1:8000/demo/blackacket.jpeg', 1, 3000, 3000, '[{\"attribute_title\":\"size\",\"attribute_id\":1,\"values_id\":1,\"values_title\":\"xl\"},{\"attribute_title\":\"color\",\"attribute_id\":2,\"values_id\":15,\"values_title\":\"red\"}]', '2025-02-13 20:24:27', '2025-02-13 20:24:27'),
(3, 2, 9, 'Glow & Handsome Face Cream Instant Brightness 100g', 'xl-red', 'http://127.0.0.1:8000/demo/cream2.jpeg', 1, 200, 200, '[{\"attribute_title\":\"size\",\"attribute_id\":1,\"values_id\":1,\"values_title\":\"xl\"},{\"attribute_title\":\"color\",\"attribute_id\":2,\"values_id\":15,\"values_title\":\"red\"}]', '2025-05-20 13:41:15', '2025-05-20 13:41:15'),
(4, 3, 30, 'UNTAMED (Impression of Savage )', 'l-red', 'http://127.0.0.1:8000/', 1, NULL, 0, '[{\"attribute_title\":\"size\",\"attribute_id\":1,\"values_id\":2,\"values_title\":\"l\"},{\"attribute_title\":\"color\",\"attribute_id\":2,\"values_id\":15,\"values_title\":\"red\"}]', '2025-05-24 10:47:48', '2025-05-24 10:47:48'),
(5, 4, 38, '1001 NIGHTS EDP', '100ml', 'https://therareperfumes.online/', 1, 12000, 12000, '[{\"attribute_title\":\"size\",\"attribute_id\":3,\"values_id\":3,\"values_title\":\"100ml\"}]', '2025-06-10 13:01:48', '2025-06-10 13:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `title`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Approved', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Cancel', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'Delivery Process', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 'Complete', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `shortdetails` text DEFAULT NULL,
  `longdetails` text NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `shortdetails`, `longdetails`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', 'contact-us', NULL, '<h2>Get in Touch with Us</h2><p>We’re here to help and answer any questions you might have. We look forward to hearing from you!</p><h2>Contact Information</h2><p><strong>Email: support@therareperfumes.online</strong></p><p><strong>Phone:</strong> <a href=\"tel:+44 7599967311\">+44 7599967311</a></p><p><strong>Address:</strong> Pakistan</p><h2>Business Hours</h2><p>Monday - Friday: 9:00 AM - 6:00 PM</p><p>Saturday: 10:00 AM - 4:00 PM</p><p>Sunday: Closed</p><h2>Follow Us</h2><p>Stay connected with us through social media:</p><p>[Facebook Icon] [Facebook URL]</p><p>[Instagram Icon] [Instagram URL]</p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2025-06-14 07:31:00'),
(2, 'Terms & Conditions', 'terms-conditions', NULL, '<h2>TERMS</h2><p>By accessing the website at <a href=\"https://therareperfumes.online/public/\">https://therareperfumes.online/public/</a> , you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this website are protected by applicable copyright and trademark law.</p><h2>USE LICENSE</h2><p>Permission is granted to temporarily download one copy of the materials (information or software) on The Rare Perfumes website for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not: modify or copy the materials; use the materials for any commercial purpose, or for any public display (commercial or non-commercial); attempt to decompile or reverse engineer any software contained on The Rare Perfumes website; remove any copyright or other proprietary notations from the materials; or transfer the materials to another person or \"mirror\" the materials on any other server. This license shall automatically terminate if you violate any of these restrictions and may be terminated by The Rare Perfumes at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.</p><h2>DISCLAIMER</h2><p>The materials on The Rare Perfumes website are provided on an `as is` basis. The Rare Perfumes makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, The Rare Perfumes does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to this site.</p><h2>LIMITATIONS</h2><p>In no event shall The Rare Perfumes be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials onThe Rare Perfumes website, even if The Rare Perfumes or a authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.</p><h2>ACCURACY OF MATERIALS</h2><p>The materials appearing on The Rare Perfumes website could include technical, typographical, or photographic errors. The Rare Perfumes does not warrant that any of the materials on its website are 100% accurate, complete or current. The Rare Perfumes may make changes to the materials contained on its website at any time without notice. However, The Rare Perfumes does not make any commitment to update the materials.</p><h2>PRODUCT &amp; SERVICE DESCRIPTIONS</h2><p>Whilst we try to display the colors of our products accurately on the Website, the actual colors you see will depend on your screen and we cannot guarantee that your screen`s display of any color will accurately reflect the color of the product on delivery.</p><p>All items are subject to availability. We will inform you as soon as possible if the product(s) or service(s) you have ordered are not available and we may offer an alternative product(s) or service(s) of equal or higher quality and value otherwise the order had to be canceled.</p><h2>ACCEPTANCE OF YOUR ORDER</h2><p>Please note that completion of the online checkout process does not constitute our acceptance of your order. Our acceptance of your order will take place only when we dispatch the product(s) or commencement of the services that you ordered from us.</p><p>By completing and submitting the electronic order form (or proceeding through the `checkout process`) you are making an offer to purchase goods which, if accepted by us, will result in a binding contract. Neither submitting an electronic order form nor completing the checkout process constitutes our acceptance of your order.</p><p>If you supplied us with your email address when entering your payment details (or if you have a registered account with us), we will notify you by email as soon as possible to confirm that we have received your order.</p><p>All products that you order through the Website will remain the property of The Rare Perfumes until we have received payment in full from you for those products.</p><p>If we cannot supply you with the product or service you ordered, we will not process your order. We will inform you via email or call, if you have already paid for the product or service, refund you in full as soon as reasonably possible.</p><p>The Rare Perfumes reserved the right to cancel your order in the case of but not limited to; unavailability of product, incorrectly listed price, or any other information.</p><h2>DELIVERY OF YOUR ORDER</h2><p>The Rare Perfumes products are sold on a delivery duty unpaid basis. The recipient may have to pay import duty or a formal customs entry fee prior to or on delivery. Additional taxes, fees or levies may apply according to local legislation and customers are required to check these details before placing an order for international delivery.</p><p>We will deliver to the home or office address indicated by you when you place an order. We cannot deliver to PO boxes. All deliveries must be signed for upon receipt. We will try at least twice to deliver your order at the address indicated by you.</p><p>We reserve the right to cancel your purchase in the event nobody is available to sign for receipt. You bear the risk for the products once delivery is completed.</p><p>Where possible, we try to deliver in one go. We reserve the right to split the delivery of your order, for instance (but not limited to) if part of your order is delayed or unavailable. In the event that we split your order, we will notify you of our intention to do so by sending you an e-mail to the e-mail address provided by you at the time of purchase. You will not be charged for any additional delivery costs.</p><p>We can entertain any changes to order provided if the order isn`t dispatched yet. We will not be able to accept any order change requests once the order is dispatched (neither any refund or exchange will be possible in case of delivery outside Pakistan.)</p><h2>LINKS</h2><p>We may have placed links on this Website to other websites which we think you may want to visit. We do not vet these websites and do not have any control over their contents. Except where required by applicable law, The Rare Perfumes cannot accept any liability in respect of the use of these websites.</p><h2>MODIFICATIONS</h2><p>The Rare Perfumes may revise these terms of service for its website at any time without notice. By using this website you are agreeing to be bound by the then current version of these terms of service.</p><h2>GOVERNING LAW</h2><p>These terms and conditions are governed by and construed in accordance with the laws of Pakistan and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.</p><h2>COMPLAINTS PROCESS</h2><p>We hope that you`re pleased with any purchase you`ve made or the service you`ve received from The Rare Perfumes and that you`ll never have reason to complain - but if there`s something you`re not happy with, we`d like to put matters right, so please contact us straight away:</p><h2>BY EMAIL</h2><p>support@therareperfumes.online</p><h2>BY TELEPHONE</h2><p><a href=\"tel:+44 7599967311\">+44 7599967311</a> (9am - 10pm , Monday - Saturday )</p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2025-06-14 06:35:52'),
(3, 'Frequently Asked Questions', 'faq', NULL, '<h2>HOW DO I PLACE AN ORDER?</h2><p>Ordering at https://therareperfumes.online is easy. Just select the items you want to shop, enter your shipping address and payment information, and you can place your order. If you need any assistance, give us a WhatsApp message at <a href=\"tel:+44 7599967311\">+44 7599967311</a> &nbsp;Monday to Saturday.</p><h2>HOW WILL MY ORDER BE DELIVERED TO ME?</h2><p>Your order would be delivered through reputed courier companies at your doorstep.</p><h2>HOW WILL I KNOW IF ORDER IS PLACED SUCCESSFULLY?</h2><p>Once your Order is successfully placed, you will receive a confirmation call, email, and text message from mantra.com.pk. This mail will have all the details related to your order. Order details can also be viewed at My Account -&gt; My Orders if you have placed the order on your own online.</p><h2>DO YOU TAKE ORDERS OVER THE PHONE?</h2><p>Yes, we do take orders over the WhatsApp message at <a href=\"tel:+44 7599967311\">+44 7599967311</a> . The payment mode possible for these orders is Cash on Delivery and Advance Payment only.</p><h2>I TRIED PLACING ORDER USING MY CREDIT CARD BUT IT ISN\'T WORKING. CAN YOU HELP ME PLACE AN ORDER?</h2><p>Yes, if your debit/credit card isn\'t working, we can always take your order over the WhatsApp message at <a href=\"tel:+44 7599967311\">+44 7599967311</a></p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2025-06-10 11:39:51'),
(4, 'Shipping Policy', 'shipping-policy', ' ', '\n               <h2>Shipping Policy</h2>\n                <p>Thank you for shopping at MSTORE. Below are the terms and conditions \n                that constitute our Shipping Policy.</p>\n                \n                <h2>Processing Time</h2>\n                <p>All orders are processed within [X] business days. Orders are not shipped or delivered on weekends or holidays.</p>\n                <p>If we are experiencing a high volume of orders, shipments may be delayed by a few days. Please allow additional days in transit for delivery. If there will be a significant delay in the shipment of your order, we will contact you via email or telephone.</p>\n                \n                <h2>Shipping Rates & Delivery Estimates</h2>\n                <p>Shipping charges for your order will be calculated and displayed at checkout.</p>\n                <ul>\n                    <li><strong>Standard Shipping</strong>: [estimated delivery time] - [cost]</li>\n                    <li><strong>Expedited Shipping</strong>: [estimated delivery time] - [cost]</li>\n                    <li><strong>Overnight Shipping</strong>: [estimated delivery time] - [cost]</li>\n                </ul>\n                <p>Delivery delays can occasionally occur.</p>\n                \n                <h2>Shipment to P.O. boxes or APO/FPO addresses</h2>\n                <p>[Your Company Name] ships to addresses within the U.S., U.S. Territories, and APO/FPO/DPO addresses.</p>\n                \n                <h2>Shipment Confirmation & Order Tracking</h2>\n                <p>You will receive a Shipment Confirmation email once your order has shipped containing your tracking number(s). The tracking number will be active within 24 hours.</p>\n                \n                <h2>Customs, Duties, and Taxes</h2>\n                <p>[Your Company Name] is not responsible for any customs and taxes applied to your order. All fees imposed during or after shipping are the responsibility of the customer (tariffs, taxes, etc.).</p>\n                \n                <h2>Damages</h2>\n                <p>[Your Company Name] is not liable for any products damaged or lost during shipping. If you received your order damaged, please contact the shipment carrier to file a claim.</p>\n                <p>Please save all packaging materials and damaged goods before filing a claim.</p>\n                \n                <h2>International Shipping Policy</h2>\n                <p>We currently do not ship outside the U.S. [Or provide details if you do ship internationally]</p>\n                \n                <h2>Returns Policy</h2>\n                <p>Our Return & Refund Policy provides detailed information about options and procedures for returning your order.</p>\n    \n                ', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'EXCHANGE AND RETURN POLICY', 'exchange-and-return-policy', NULL, '<h2>Exchange and Return Policy</h2><p>At The Rare Perfumes, we strive to ensure our customers are completely satisfied with their purchases. If you are not satisfied with your purchase, we are here to help.</p><h2>Return Eligibility</h2><p>To be eligible for a return, please make sure that:</p><ul><li>The product was purchased in the last 3 days</li><li>The product is in its original packaging</li><li>The product isn\'t used or damaged</li><li>You have the receipt or proof of purchase</li></ul><p>Products that do not meet these criteria will not be considered for return.</p><h2>Return Process</h2><p>To initiate a return, please follow these steps:</p><ul><li>Contact us by email: support@therareperfumes.online</li><li>Include your order number, product details, and reason for the return</li><li>We will provide you with instructions on where to send the returned product</li></ul><h2>Exchanges</h2><p>We only replace items if they are defective or damaged. If you need to exchange an item for the same product, please contact us at support@therareperfumes.online with the details of the product and the issue.</p><h2>Refunds</h2><p>Once we receive your item, we will inspect it and notify you that we have received your returned item. We will immediately notify you of the status of your refund after inspecting the item.</p><p>If your return is approved, we will initiate a refund to your original method of payment. The time frame for the refund to be processed and posted depends on your card issuer\'s policies.</p><h2>Shipping</h2><p>You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.</p><h2>Contact Us</h2><p>If you have any questions about our Exchange and Return Policy, please contact us:</p><p>[Your Company Name]<br>Email: [your.email@example.com]<br>Phone: [Your Phone Number]<br>Address: [Your Physical Address]</p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2025-06-10 11:35:41'),
(6, 'About us', 'about-us', NULL, '<h2>Welcome To The Rare Perfumes</h2><p>&nbsp;</p><h2>Our Story</h2><p>The Rare Perfumes started when we realized that many online stores are selling the Products on very higher prices . Since then, we have grown from a small shop to a thriving e-commerce platform that serves customers throughout Pakistan.</p><h2>Our Mission and Values</h2><p>Our mission is to reach every possible customer. We believe in Quality, sustainability and customer satisfaction and these principles guide everything we do.</p><p><strong>Quality:</strong> We are dedicated to providing products that meet the highest standards.</p><p><strong>Sustainability:</strong> We prioritize eco-friendly practices and sustainable sourcing.</p><p><strong>Customer Satisfaction:</strong> Our customers are at the heart of our business, and we strive to exceed their expectations every day.</p><h2>What We Offer</h2><p>We offer wide range of perfumes for every customer ,whether you are looking for Men, Women Branded Perfumes as we have something for everyone. Our products unique selling point is that we offer Original Branded Perfume at wholesale rates everyday .</p><p>Feel free to contact us at <a href=\"mailto:support@therareperfumes.online\">support@therareperfumes.online</a> &nbsp;if you have any questions or need assistance. We are here to help!</p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2025-06-10 11:32:47'),
(7, 'Privacy Policy', 'privacy-policy', NULL, '<p>Privacy Policy</p><p>Welcome to The Rare Perfumes</p><p>We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at support@therareperfumes.online</p><p>When you visit our website https://therareperfumes.online/ &nbsp;and use our services, you trust us with your personal information. We take your privacy very seriously. In this privacy policy, we seek to explain to you in the clearest way possible what information we collect, how we use it and what rights you have in relation to it. We hope you take some time to read through it carefully, as it is important. If there are any terms in this privacy policy that you do not agree with, please contact us at support@therareperfumes.online</p><p>Information We Collect</p><p>We collect personal information that you voluntarily provide to us when registering at The Rare Perfumes, expressing an interest in obtaining information about us or our products , when participating in activities on The Rare Perfumes (such as posting messages in our online forums or entering competitions, contests or giveaways) or otherwise contacting us.</p><p>How We Use Your Information</p><p>We use personal information collected via our The Rare Perfumes for a variety of business purposes described below. We process your personal information for these purposes in reliance on our legitimate business interests, in order to enter into or perform a contract with you, with your consent, and/or for compliance with our legal obligations. We indicate the specific processing grounds we rely on next to each purpose listed below.</p><p>To facilitate account creation and logon process.<br>To send administrative information to you.<br>To fulfill and manage your orders.<br>To post testimonials.<br>Request Feedback.<br>To protect our Services.<br>To enforce our terms, conditions and policies.<br>To respond to legal requests and prevent harm.<br>To manage user accounts.<br>To deliver services to the user.<br>To respond to user inquiries/offer support to users.</p><p>Sharing Your Information</p><p>We only share and disclose your information in the following situations:</p><p>Compliance with Laws.<br>Vital Interests and Legal Rights.<br>Vendors, Consultants and Other Third-Party Service Providers.<br>Business Transfers.<br>Affiliates.<br>Business Partners.<br>With your Consent.<br>Other Users.</p><p>Cookies and Other Tracking Technologies</p><p>We may use cookies and similar tracking technologies (like web beacons and pixels) to access or store information. Specific information about how we use such technologies and how you can refuse certain cookies is set out in our Cookie Policy.</p><p>Data Retention</p><p>We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy policy, unless a longer retention period is required or permitted by law (such as tax, accounting or other legal requirements).</p><p>Data Protection Rights</p><p>You have certain rights under data protection laws in relation to your personal data. These include the right to:</p><p>Request access to your personal data.<br>Request correction of your personal data.<br>Request erasure of your personal data.<br>Object to processing of your personal data.<br>Request restriction of processing your personal data.<br>Request transfer of your personal data.<br>Right to withdraw consent.</p><p>Contact Us</p><p>If you have questions or comments about this policy, you may contact our Support Team, by email at support@therareperfumes.online, or by post to:</p><p>[Your Company Name]<br>[Street Address]<br>[City, State, Zip Code]<br>[Country]</p><p>Changes to This Privacy Policy</p><p>We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory&nbsp;reasons.</p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2025-06-10 10:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `slug`, `message`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cash_on_delivery', 'Cash On Delivery Message', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Bank Transfer', 'bank_transfer', 'Bank Transfer Message', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `price` double DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `sku` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subchildcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `hover_image` text DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_popular` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `is_enable` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `price`, `selling_price`, `sku`, `category_id`, `subcategory_id`, `subchildcategory_id`, `brand_id`, `tags`, `image`, `images`, `type`, `hover_image`, `is_featured`, `is_popular`, `details`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `is_enable`, `created_at`, `updated_at`) VALUES
(24, 'ARISTOCRAT HER', 'aristocrat-her', 1200, 1500, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684820d93bc30.jpg', 'filemanager/684820d93bc30.jpg,filemanager/684820e8b7170.jpg,filemanager/684820f50dab8.jpg', NULL, 'filemanager/684820f50dab8.jpg', 1, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'ARISTOCRAT HER', NULL, 'ARISTOCRAT HER', 1, '2025-06-10 12:11:42', '2025-06-10 12:12:42'),
(22, 'AMBER MUSC', 'amber-musc', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68481d142a1e0.jpg', 'filemanager/68481d142a1e0.jpg,filemanager/68481d1fb3fc8.jpg,filemanager/68481d2a5bf7b.jpg', NULL, 'filemanager/68481d1fb3fc8.jpg', 1, 1, NULL, NULL, 'AMBER MUSC', NULL, 'AMBER MUSC', 1, '2025-06-10 11:55:30', '2025-06-10 11:56:33'),
(23, 'AMBER WOOD', 'amber-wood', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68481dbc2c378.jpg', 'filemanager/68481dbc2c378.jpg,filemanager/68481dc4b7122.jpg,filemanager/68481dce4d797.jpg', NULL, 'filemanager/68481dc4b7122.jpg', 1, 1, NULL, NULL, 'AMBER WOOD', NULL, 'AMBER WOOD', 1, '2025-06-10 11:58:12', '2025-06-10 11:59:12'),
(21, '1001 NIGHTS EDP', '1001-nights-edp', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68481c3624d1c.jpg', 'filemanager/68481c3624d1c.jpg,filemanager/68481c5f7a1a1.jpg,filemanager/68481c689bde2.jpg', NULL, 'filemanager/68481c689bde2.jpg', 1, 1, NULL, NULL, '1001 NIGHTS EDP', NULL, '1001 NIGHTS EDP', 1, '2025-06-10 11:52:19', '2025-06-10 11:53:43'),
(25, 'ARISTOCRAT HIM', 'aristocrat-him', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684822f163872.jpg', 'filemanager/684822f162fb0.jpg,filemanager/684822f16349f.jpg,filemanager/684822f163872.jpg', NULL, 'filemanager/684822f16349f.jpg', 1, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'ARISTOCRAT HIM', NULL, 'ARISTOCRAT HIM', 1, '2025-06-10 12:20:08', '2025-06-10 12:20:59'),
(26, 'ARISTOCRAT PLATINUM', 'aristocrat-platinum', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68482374387c3.jpg', 'filemanager/68482374387c3.jpg,filemanager/6848237438ca8.jpg,filemanager/68482374390ca.jpg', NULL, 'filemanager/6848237438ca8.jpg', 1, 1, NULL, NULL, 'ARISTOCRAT PLATINUM', NULL, 'ARISTOCRAT PLATINUM', 1, '2025-06-10 12:22:20', '2025-06-10 12:23:08'),
(27, 'AURUM', 'aurum', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684823ea0d0dc.jpg', 'filemanager/684823ea0c4e2.jpg,filemanager/684823ea0cac9.jpg,filemanager/684823ea0d0dc.jpg', NULL, 'filemanager/684823ea0c4e2.jpg', 1, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'AURUM', NULL, 'AURUM', 1, '2025-06-10 12:24:12', '2025-06-10 12:24:57'),
(28, 'AURUM MINIATURE', 'aurum-miniature', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6848245f4e111.jpg', 'filemanager/6848245f4d865.jpg,filemanager/6848245f4dd17.jpg,filemanager/6848245f4e111.jpg', NULL, 'filemanager/6848245f4d865.jpg', 1, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'AURUM MINIATURE', NULL, 'AURUM MINIATURE', 1, '2025-06-10 12:26:12', '2025-06-10 12:26:59'),
(29, 'AURUM SUMMER', 'aurum-summer', 14000, 16000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684824cd0ac1a.jpg', 'filemanager/684824cd0a41f.jpg,filemanager/684824cd0a84b.jpg,filemanager/684824cd0ac1a.jpg', NULL, 'filemanager/684824cd0a41f.jpg', 1, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'AURUM SUMMER', NULL, 'AURUM SUMMER', 1, '2025-06-10 12:28:03', '2025-06-10 12:29:31'),
(30, 'BLU BY AJMAL', 'blu-by-ajmal', 14000, 13000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68497fd872030.jpg', 'filemanager/68497fd872030.jpg,filemanager/68497fd87251c.jpg,filemanager/68497fd8728a4.jpg', NULL, 'filemanager/68497fd87251c.jpg', 1, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'BLU BY AJMAL', NULL, 'BLU BY AJMAL', 1, '2025-06-11 13:08:44', '2025-06-11 13:09:29'),
(31, 'BLU MINIATURE', 'blu-miniature', 342342, 234234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498036975f4.jpg', 'filemanager/68498036971e7.jpg,filemanager/68498036975f4.jpg,filemanager/6849803697949.jpg', NULL, 'filemanager/68498036971e7.jpg', 0, 1, NULL, NULL, 'BLU MINIATURE', NULL, 'BLU MINIATURE', 1, '2025-06-11 13:10:17', '2025-06-11 13:11:29'),
(32, 'CARBON', 'carbon', 2123123, 123123123, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684980b024caa.jpg', ',filemanager/684980b024caa.jpg,filemanager/684980b02508a.jpg,filemanager/684980b0253b0.jpg', NULL, 'filemanager/684980b0253b0.jpg', 0, 1, NULL, NULL, 'CARBON', NULL, 'CARBON', 1, '2025-06-11 13:11:54', '2025-06-11 13:12:39'),
(33, 'CASHMERE MUSC', 'cashmere-musc', 23234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684981008bb13.jpg', ',filemanager/684981008b5bd.jpg,filemanager/684981008bf4e.jpg,filemanager/684981008c256.jpg', NULL, 'filemanager/684981008bf4e.jpg', 0, 1, NULL, NULL, 'CASHMERE MUSC', NULL, 'CASHMERE MUSC', 1, '2025-06-11 13:13:42', '2025-06-11 13:14:25'),
(34, 'CHIVALRY', 'chivalry', 23434234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498151bb095.jpg', ',filemanager/68498151babf5.jpg,filemanager/68498151bb095.jpg,filemanager/68498151bb47c.jpg', NULL, 'filemanager/68498151babf5.jpg', 0, 0, NULL, NULL, 'CHIVALRY', NULL, 'CHIVALRY', 1, '2025-06-11 13:15:01', '2025-06-11 13:15:30'),
(35, 'CUIR MUSC', 'cuir-musc', 234234, 23424, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849819d2bc5c.jpg', ',filemanager/6849819d2b58e.jpg,filemanager/6849819d2b956.jpg,filemanager/6849819d2bc5c.jpg', NULL, 'filemanager/6849819d2b956.jpg', 0, 0, NULL, NULL, 'CUIR MUSC', NULL, 'CUIR MUSC', 1, '2025-06-11 13:16:28', '2025-06-11 13:17:15'),
(36, 'DANAT AL DUNIYA', 'danat-al-duniya', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684981fc764b9.jpg', 'filemanager/684981fc75c45.jpg,filemanager/684981fc760d7.jpg,filemanager/684981fc764b9.jpg', NULL, 'filemanager/684981fc760d7.jpg', 0, 0, NULL, NULL, 'DANAT AL DUNIYA', NULL, 'DANAT AL DUNIYA', 1, '2025-06-11 13:17:51', '2025-06-11 13:18:24'),
(37, 'ELIXIR INTENSE', 'elixir-intense', 12344, 324234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498298b8a3f.jpg', ',filemanager/68498298b8109.jpg,filemanager/68498298b8673.jpg,filemanager/68498298b8a3f.jpg', NULL, 'filemanager/68498298b8673.jpg', 0, 0, NULL, NULL, 'ELIXIR INTENSE', NULL, 'ELIXIR INTENSE', 1, '2025-06-11 13:20:31', '2025-06-11 13:21:25'),
(38, 'ELIXIR PRECIOUS', 'elixir-precious', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684982f3f1aee.jpg', 'filemanager/684982f3f1aee.jpg,filemanager/684982f3f1f04.jpg,filemanager/684982f3f2226.jpg', NULL, 'filemanager/684982f3f1f04.jpg', 0, 0, NULL, NULL, 'ELIXIR PRECIOUS', NULL, 'ELIXIR PRECIOUS', 1, '2025-06-11 13:21:58', '2025-06-11 13:22:30'),
(39, 'ELIXIR SUAVE', 'elixir-suave', 4234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684983cb54bbe.jpg', 'filemanager/684983cb547b7.jpg,filemanager/684983cb54bbe.jpg,filemanager/684983cb54fdb.jpg', NULL, 'filemanager/684983cb547b7.jpg', 0, 0, NULL, NULL, 'ELIXIR SUAVE', NULL, 'ELIXIR SUAVE', 1, '2025-06-11 13:25:37', '2025-06-11 13:26:10'),
(40, 'EVOKE HIM', 'evoke-him', 234234, 23424, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498475235bb.jpg', 'filemanager/6849847522f4f.jpg,filemanager/68498475235bb.jpg,filemanager/6849847523985.jpg', NULL, 'filemanager/6849847522f4f.jpg', 0, 0, NULL, NULL, 'EVOKE HIM', NULL, 'EVOKE HIM', 1, '2025-06-11 13:28:26', '2025-06-11 13:28:59'),
(41, 'GOLD MAN', 'gold-man', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684984ba46e78.jpg', 'filemanager/684984ba46a9e.jpg,filemanager/684984ba46e78.jpg,filemanager/684984ba471e0.jpg', NULL, 'filemanager/684984ba46a9e.jpg', 0, 0, NULL, NULL, 'GOLD MAN', NULL, 'GOLD MAN', 1, '2025-06-11 13:29:33', '2025-06-11 13:30:07'),
(42, 'GRAY', 'gray', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684984fe0dd33.jpg', 'filemanager/684984fe0d8e4.jpg,filemanager/684984fe0dd33.jpg,filemanager/684984fe0e0e8.jpg', NULL, 'filemanager/684984fe0d8e4.jpg', 0, 0, NULL, NULL, 'GRAY', NULL, 'GRAY', 1, '2025-06-11 13:30:47', '2025-06-11 13:31:16'),
(43, 'HATKORA WOOD', 'hatkora-wood', 23453, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849853f17472.jpg', 'filemanager/6849853f1702f.jpg,filemanager/6849853f17472.jpg,filemanager/6849853f177b7.jpg', NULL, 'filemanager/6849853f1702f.jpg', 0, 0, NULL, NULL, 'HATKORA WOOD', NULL, 'HATKORA WOOD', 1, '2025-06-11 13:31:51', '2025-06-11 13:32:26'),
(44, 'INCENSE WOOD', 'incense-wood', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849863f42a73.jpg', 'filemanager/6849863f42557.jpg,filemanager/6849863f42a73.jpg,filemanager/6849863f42d49.jpg', NULL, 'filemanager/6849863f42d49.jpg', 0, 0, NULL, NULL, 'INCENSE WOOD', NULL, 'INCENSE WOOD', 1, '2025-06-11 13:36:14', '2025-06-11 13:36:46'),
(45, 'KURO', 'kuro', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849868ebe096.jpg', 'filemanager/6849868ebd833.jpg,filemanager/6849868ebdc61.jpg,filemanager/6849868ebe096.jpg', NULL, 'filemanager/6849868ebd833.jpg', 0, 0, NULL, NULL, 'KURO', NULL, 'KURO', 1, '2025-06-11 13:37:23', '2025-06-11 13:37:56'),
(46, 'MIZYAAN', 'mizyaan', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684986cd7fa73.jpg', 'filemanager/684986cd7f203.jpg,filemanager/684986cd7f67f.jpg,filemanager/684986cd7fa73.jpg', NULL, 'filemanager/684986cd7f203.jpg', 0, 0, NULL, NULL, 'MIZYAAN', NULL, 'MIZYAAN', 1, '2025-06-11 13:38:24', '2025-06-11 13:39:01'),
(47, 'MUSK KHAS', 'musk-khas', 5345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684987487bbd6.jpg', 'filemanager/684987487b22b.jpg,filemanager/684987487b6e4.jpg,filemanager/684987487bbd6.jpg', NULL, 'filemanager/684987487b22b.jpg', 0, 0, NULL, NULL, 'MUSK KHAS', NULL, 'MUSK KHAS', 1, '2025-06-11 13:40:42', '2025-06-11 13:41:06'),
(48, 'NEUTRON', 'neutron', 23424, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684987f22e55d.jpg', 'filemanager/684987f22dc22.jpg,filemanager/684987f22e146.jpg,filemanager/684987f22e55d.jpg', NULL, 'filemanager/684987f22dc22.jpg', 0, 0, NULL, NULL, 'NEUTRON', NULL, 'NEUTRON', 1, '2025-06-11 13:43:18', '2025-06-11 13:43:44'),
(49, 'PATCHOULI WOOD', 'patchouli-wood', 34234, 34234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849882898a4f.jpg', 'filemanager/6849882898a4f.jpg,filemanager/6849882898e6d.jpg,filemanager/6849882899193.jpg', NULL, 'filemanager/6849882899193.jpg', 0, 0, NULL, NULL, 'PATCHOULI WOOD', NULL, 'PATCHOULI WOOD', 1, '2025-06-11 13:44:13', '2025-06-11 13:46:13'),
(50, 'RAINDROPS', 'raindrops', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684988e2f29a5.jpg', 'filemanager/684988e2f29a5.jpg,filemanager/684988e2f2f15.jpg,filemanager/684988e2f3258.jpg', NULL, 'filemanager/684988e2f3258.jpg', 0, 0, NULL, NULL, 'RAINDROPS', NULL, 'RAINDROPS', 1, '2025-06-11 13:47:16', '2025-06-11 13:47:42'),
(51, 'RAINDROPS MINIATURE', 'raindrops-miniature', 324234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498a3290b58.jpg', 'filemanager/68498a3290791.jpg,filemanager/68498a3290b58.jpg,filemanager/68498a3290ec4.jpg', NULL, 'filemanager/68498a3290791.jpg', 0, 0, NULL, NULL, 'RAINDROPS MINIATURE', NULL, 'RAINDROPS MINIATURE', 1, '2025-06-11 13:52:56', '2025-06-11 13:53:28'),
(52, 'ROSE WOOD', 'rose-wood', 234234, 234234, NULL, 45, NULL, NULL, NULL, NULL, 'filemanager/68498a6d4d4f1.jpg', 'filemanager/68498a6d4d4f1.jpg,filemanager/68498a6d4d0a8.jpg,filemanager/68498a6d4d8fd.jpg', NULL, 'filemanager/68498a6d4d0a8.jpg', 0, 0, NULL, NULL, 'ROSE WOOD', NULL, 'ROSE WOOD', 1, '2025-06-11 13:53:52', '2025-06-11 13:54:21'),
(53, 'SACRED LOVE', 'sacred-love', 23423423, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498aa65a2a8.jpg', 'filemanager/68498aa65a2a8.jpg,filemanager/68498aa6597cd.jpg,filemanager/68498aa659d8c.jpg', NULL, 'filemanager/68498aa6597cd.jpg', 0, 0, NULL, NULL, 'SACRED LOVE', NULL, 'SACRED LOVE', 1, '2025-06-11 13:54:50', '2025-06-11 13:55:23'),
(54, 'SACRED LOVE MINIATURE', 'sacred-love-miniature', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498ae02d6b2.jpg', 'filemanager/68498ae02d1cc.jpg,filemanager/68498ae02d6b2.jpg,filemanager/68498ae02da7b.jpg', NULL, 'filemanager/68498ae02d1cc.jpg', 0, 0, NULL, NULL, 'SACRED LOVE MINIATURE', NULL, 'SACRED LOVE MINIATURE', 1, '2025-06-11 13:55:49', '2025-06-11 13:56:19'),
(55, 'SANTAL WOOD', 'santal-wood', 45345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498b27b289e.jpg', 'filemanager/68498b27b289e.jpg,filemanager/68498b27b2459.jpg,filemanager/68498b27b2c0d.jpg', NULL, 'filemanager/68498b27b2459.jpg', 0, 0, NULL, NULL, 'SANTAL WOOD', NULL, 'SANTAL WOOD', 1, '2025-06-11 13:56:57', '2025-06-11 13:57:29'),
(56, 'SERENITY IN ME', 'serenity-in-me', 345345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498b5ca261c.jpg', 'filemanager/68498b5ca261c.jpg,filemanager/68498b5ca20fd.jpg,filemanager/68498b5ca2dc7.jpg', NULL, 'filemanager/68498b5ca20fd.jpg', 0, 0, NULL, NULL, 'SERENITY IN ME', NULL, 'SERENITY IN ME', 1, '2025-06-11 13:57:55', '2025-06-11 13:58:24'),
(57, 'SHADOW HER', 'shadow-her', 2342342, 23424234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498bc3d3f0f.jpg', 'filemanager/68498bc3d36d1.jpg,filemanager/68498bc3d3b43.jpg,filemanager/68498bc3d3f0f.jpg', NULL, 'filemanager/68498bc3d36d1.jpg', 0, 0, NULL, NULL, 'SHADOW HER', NULL, 'SHADOW HER', 1, '2025-06-11 13:59:20', '2025-06-11 14:00:02'),
(58, 'SHADOW HIM', 'shadow-him', 23423424, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498bfb87d38.jpg', 'filemanager/68498bfb8770d.jpg,filemanager/68498bfb87d38.jpg,filemanager/68498bfb8828b.jpg', NULL, 'filemanager/68498bfb8770d.jpg', 0, 0, 'SHADOW HIM', NULL, 'SHADOW HIM', NULL, 'SHADOW HIM', 1, '2025-06-11 14:00:29', '2025-06-11 14:01:07'),
(59, 'SHINE', 'shine', 453453, 345345, NULL, 45, NULL, NULL, NULL, NULL, 'filemanager/68498c41c3c8b.jpg', 'filemanager/68498c41c337e.jpg,filemanager/68498c41c3802.jpg,filemanager/68498c41c3c8b.jpg', NULL, 'filemanager/68498c41c337e.jpg', 0, 0, 'SHINE', NULL, 'SHINE', NULL, 'SHINE', 1, '2025-06-11 14:01:37', '2025-06-11 14:02:16'),
(60, 'SIGNIFY', 'signify', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498c963d982.jpg', 'filemanager/68498c963ce0a.jpg,filemanager/68498c963d39f.jpg,filemanager/68498c963d982.jpg', NULL, 'filemanager/68498c963ce0a.jpg', 0, 0, 'SIGNIFY', NULL, 'SIGNIFY', NULL, 'SIGNIFY', 1, '2025-06-11 14:03:02', '2025-06-11 14:03:33'),
(61, 'SILVER SHADE', 'silver-shade', 234234, 4234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498d7081710.jpg', 'filemanager/68498d708124a.jpg,filemanager/68498d7081710.jpg,filemanager/68498d7081ab0.jpg', NULL, 'filemanager/68498d708124a.jpg', 0, 0, 'SILVER SHADE', NULL, 'SILVER SHADE', NULL, 'SILVER SHADE', 1, '2025-06-11 14:06:43', '2025-06-11 14:08:31'),
(62, 'TITANIUM HIM', 'titanium-him', 345345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498f1f23d31.jpg', 'filemanager/68498f1f23974.jpg,filemanager/68498f1f23d31.jpg,filemanager/68498f1f24060.jpg', NULL, 'filemanager/68498f1f23974.jpg', 0, 0, 'TITANIUM HIM', NULL, 'TITANIUM HIM', NULL, 'TITANIUM HIM', 1, '2025-06-11 14:13:58', '2025-06-11 14:14:36'),
(63, 'VIOLET MUSC', 'violet-musc', 345345, 5345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498f65db52d.jpg', 'filemanager/68498f65db16d.jpg,filemanager/68498f65db52d.jpg,filemanager/68498f65db8d0.jpg', NULL, 'filemanager/68498f65db16d.jpg', 0, 0, NULL, NULL, 'VIOLET MUSC', NULL, 'VIOLET MUSC', 1, '2025-06-11 14:15:04', '2025-06-11 14:15:43'),
(64, 'WANDERER', 'wanderer', 234234, 342342, NULL, 45, NULL, NULL, NULL, NULL, 'filemanager/68498fa0b8824.jpg', 'filemanager/68498fa0b82c1.jpg,filemanager/68498fa0b8824.jpg,filemanager/68498fa0b8bf6.jpg', NULL, 'filemanager/68498fa0b82c1.jpg', 0, 0, 'WANDERER', NULL, 'WANDERER', NULL, 'WANDERER', 1, '2025-06-11 14:16:55', '2025-06-11 14:17:24'),
(65, 'WISAL', 'wisal', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849900c01fa8.jpg', 'filemanager/6849900c017bc.jpg,filemanager/6849900c01c2e.jpg,filemanager/6849900c01fa8.jpg', NULL, 'filemanager/6849900c017bc.jpg', 0, 0, 'WISAL', NULL, 'WISAL', NULL, 'WISAL', 1, '2025-06-11 14:17:53', '2025-06-11 14:18:22'),
(66, 'WISAL DHAHAB', 'wisal-dhahab', 234234, 32342, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849904bcaf3c.jpg', 'filemanager/6849904bca617.jpg,filemanager/6849904bcaaaa.jpg,filemanager/6849904bcaf3c.jpg', NULL, 'filemanager/6849904bca617.jpg', 0, 0, 'WISAL DHAHAB', NULL, 'WISAL DHAHAB', NULL, 'WISAL DHAHAB', 1, '2025-06-11 14:18:53', '2025-06-11 14:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_collections`
--

CREATE TABLE `product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` bigint(20) UNSIGNED NOT NULL,
  `is_enable` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_collections`
--

INSERT INTO `product_collections` (`id`, `product_id`, `collection_id`, `is_enable`, `created_at`, `updated_at`) VALUES
(62, 22, 2, 1, '2025-06-10 11:56:33', '2025-06-10 11:56:33'),
(61, 22, 1, 1, '2025-06-10 11:56:33', '2025-06-10 11:56:33'),
(57, 21, 1, 1, '2025-06-10 11:53:43', '2025-06-10 11:53:43'),
(68, 23, 2, 1, '2025-06-10 11:59:12', '2025-06-10 11:59:12'),
(67, 23, 1, 1, '2025-06-10 11:59:12', '2025-06-10 11:59:12'),
(74, 24, 2, 1, '2025-06-10 12:12:42', '2025-06-10 12:12:42'),
(73, 24, 1, 1, '2025-06-10 12:12:42', '2025-06-10 12:12:42'),
(77, 25, 1, 1, '2025-06-10 12:20:59', '2025-06-10 12:20:59'),
(78, 26, 1, 1, '2025-06-10 12:23:08', '2025-06-10 12:23:08'),
(80, 27, 1, 1, '2025-06-10 12:24:57', '2025-06-10 12:24:57'),
(82, 28, 1, 1, '2025-06-10 12:26:59', '2025-06-10 12:26:59'),
(84, 29, 1, 1, '2025-06-10 12:29:31', '2025-06-10 12:29:31'),
(86, 30, 1, 1, '2025-06-11 13:09:29', '2025-06-11 13:09:29'),
(88, 31, 1, 1, '2025-06-11 13:11:29', '2025-06-11 13:11:29'),
(89, 32, 1, 1, '2025-06-11 13:12:39', '2025-06-11 13:12:39'),
(90, 33, 1, 1, '2025-06-11 13:14:25', '2025-06-11 13:14:25'),
(91, 34, 1, 1, '2025-06-11 13:15:30', '2025-06-11 13:15:30'),
(92, 35, 1, 1, '2025-06-11 13:17:15', '2025-06-11 13:17:15'),
(93, 36, 1, 1, '2025-06-11 13:18:24', '2025-06-11 13:18:24'),
(94, 37, 1, 1, '2025-06-11 13:21:25', '2025-06-11 13:21:25'),
(95, 38, 1, 1, '2025-06-11 13:22:30', '2025-06-11 13:22:30'),
(96, 39, 1, 1, '2025-06-11 13:26:10', '2025-06-11 13:26:10'),
(97, 40, 1, 1, '2025-06-11 13:28:59', '2025-06-11 13:28:59'),
(98, 41, 1, 1, '2025-06-11 13:30:07', '2025-06-11 13:30:07'),
(99, 42, 1, 1, '2025-06-11 13:31:16', '2025-06-11 13:31:16'),
(101, 43, 1, 1, '2025-06-11 13:36:03', '2025-06-11 13:36:03'),
(102, 44, 1, 1, '2025-06-11 13:36:46', '2025-06-11 13:36:46'),
(103, 45, 1, 1, '2025-06-11 13:37:56', '2025-06-11 13:37:56'),
(104, 46, 2, 1, '2025-06-11 13:39:01', '2025-06-11 13:39:01'),
(105, 47, 1, 1, '2025-06-11 13:41:06', '2025-06-11 13:41:06'),
(106, 48, 1, 1, '2025-06-11 13:43:44', '2025-06-11 13:43:44'),
(107, 49, 1, 1, '2025-06-11 13:46:13', '2025-06-11 13:46:13'),
(108, 50, 1, 1, '2025-06-11 13:47:42', '2025-06-11 13:47:42'),
(109, 51, 1, 1, '2025-06-11 13:53:28', '2025-06-11 13:53:28'),
(110, 52, 1, 1, '2025-06-11 13:54:21', '2025-06-11 13:54:21'),
(111, 53, 2, 1, '2025-06-11 13:55:23', '2025-06-11 13:55:23'),
(112, 54, 1, 1, '2025-06-11 13:56:19', '2025-06-11 13:56:19'),
(113, 54, 2, 1, '2025-06-11 13:56:19', '2025-06-11 13:56:19'),
(114, 55, 1, 1, '2025-06-11 13:57:29', '2025-06-11 13:57:29'),
(115, 55, 2, 1, '2025-06-11 13:57:29', '2025-06-11 13:57:29'),
(116, 56, 1, 1, '2025-06-11 13:58:24', '2025-06-11 13:58:24'),
(117, 57, 1, 1, '2025-06-11 14:00:02', '2025-06-11 14:00:02'),
(118, 58, 2, 1, '2025-06-11 14:01:07', '2025-06-11 14:01:07'),
(120, 59, 2, 1, '2025-06-11 14:02:16', '2025-06-11 14:02:16'),
(121, 60, 1, 1, '2025-06-11 14:03:33', '2025-06-11 14:03:33'),
(122, 61, 1, 1, '2025-06-11 14:08:31', '2025-06-11 14:08:31'),
(123, 62, 1, 1, '2025-06-11 14:14:36', '2025-06-11 14:14:36'),
(124, 62, 2, 1, '2025-06-11 14:14:36', '2025-06-11 14:14:36'),
(125, 63, 1, 1, '2025-06-11 14:15:43', '2025-06-11 14:15:43'),
(126, 64, 1, 1, '2025-06-11 14:17:24', '2025-06-11 14:17:24'),
(127, 65, 1, 1, '2025-06-11 14:18:22', '2025-06-11 14:18:22'),
(128, 66, 1, 1, '2025-06-11 14:19:23', '2025-06-11 14:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Admin', 1, '2024-01-27 19:11:35', '2024-01-27 14:45:22', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field` text NOT NULL,
  `value` text DEFAULT NULL,
  `type` text NOT NULL DEFAULT 'text',
  `sort` int(11) NOT NULL DEFAULT 0,
  `grouping` text DEFAULT NULL,
  `section_sorting` int(11) NOT NULL DEFAULT 0,
  `group_sorting` int(11) NOT NULL DEFAULT 0,
  `section` text NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`, `type`, `sort`, `grouping`, `section_sorting`, `group_sorting`, `section`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'The Rare Perfumes', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(2, 'meta_title', 'Therareperfumes', 'text', 2, 'seo', 0, 0, 'seo', NULL, NULL),
(3, 'meta_description', 'Therareperfumes is fully customizable and appearing to your customers in accordance with what they need and what they search', 'text', 3, 'seo', 0, 0, 'seo', NULL, NULL),
(4, 'meta_keywords', 'Therareperfumes is fully customizable and appearing to your customers in accordance with what they need and what they search', 'text', 4, 'seo', 0, 0, 'seo', NULL, NULL),
(5, 'footer_credits', 'Copyright: 2024 <a href=\"#.\"><span class=\"color_red\">therareperfumes</span></a>', 'text', 5, 'theme', 3, 0, 'footer', NULL, NULL),
(6, 'phone_number', '+44 7599967311', 'text', 5, 'general', 0, 0, 'others', NULL, NULL),
(7, 'email_address', 'support@therareperfumes.online', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(8, 'address', 'Pakistan', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(9, 'domain', 'https://therareperfumes.online/public/', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(10, 'logo', 'filemanager/684950ae0c22f.jpg', 'image', 1, 'general', 0, 0, 'others', NULL, NULL),
(11, 'menu_type', 'left', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(12, 'fav_icon', 'demo/favicon.png', 'image', 1, 'general', 0, 0, 'others', NULL, NULL),
(13, 'facebook_link', '#', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(14, 'youtube_link', '#', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(15, 'twitter_link', '', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(16, 'instagram_link', '', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(17, 'admin_logo', '', 'image', 4, 'admin_settings', 0, 0, 'others', NULL, NULL),
(18, 'admin_favicon', '', 'image', 4, 'admin_settings', 0, 0, 'others', NULL, NULL),
(19, 'site_currency', 'PKR', 'text', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(20, 'topbar_title', 'Wellcome to The Rare Perfumes', 'text', 1, 'theme', 1, 0, 'header', NULL, NULL),
(21, 'site_short_details', 'therareperfumes is fully customizable and appearing to your customers in accordance with what they need and what they search Be a star of your own dream. Start your own ecommerce business right now!', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(22, 'home_page_banner', 'filemanager/683c5350bfd65.png', 'image', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(23, 'home_page_text', 'The Rare Perfumes', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(24, 'home_page_text_color', 'white', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(25, 'home_page_details', 'WE ENJOY WORKING ON THE SERVICES & PRODUCTS. WE PROVIDE AS MUCH AS YOU NEED THEM. THIS HELP US IN DELIVERING YOUR GOALS EASILY. BROWSE THROUGH THE WIDE RANGE OF SERVICES WE PROVIDE.', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(26, 'delivery_charges', '250', 'text', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(27, 'shop_banner', 'public/demo/shopbanner.jpg', 'image', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(30, 'discount_percent', '0', 'text', 1, 'shop_settings', 0, 0, 'shop', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `image_id` text DEFAULT NULL,
  `alt` text DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 1,
  `button` text DEFAULT NULL,
  `alignment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `slug`, `details`, `image_id`, `alt`, `sort`, `link`, `is_enable`, `button`, `alignment`, `created_at`, `updated_at`) VALUES
(1, 'Discover the Essence of Elegance', NULL, 'unveil your signature scent with our exclusive collection of rare perfumes.', 'filemanager/684999bfabc64.png', NULL, 1, '/shop', 1, 'Shop Now', 'right', '2024-09-25 16:48:48', '2025-06-11 15:09:14'),
(2, 'Discover the Essence of Elegance', NULL, 'unveil your signature scent with our exclusive collection of rare perfumes.', 'filemanager/68499a6001516.png', NULL, 2, '/shop', 1, 'Shop Now', 'left', '2024-09-25 16:48:48', '2025-06-11 15:07:56'),
(3, 'Discover the Essence of Elegance', NULL, 'unveil your signature scent with our exclusive collection of rare perfumes.', 'filemanager/68499ad269847.png', NULL, 3, '/shop', 1, 'Shop Now', 'left', '2024-09-25 16:48:48', '2025-06-11 15:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `profile_image` text DEFAULT NULL,
  `email_token` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `created_by`, `permissions`, `profile_image`, `email_token`) VALUES
(1, 'admin', 1, 'admin@admin.com', '2024-09-25 16:48:41', '$2y$10$shyviZdle5WFvELADcwrTeOXM7ZC9cE/toOHRM8eyI60YSy.OkjEW', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `values`
--

CREATE TABLE `values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `values`
--

INSERT INTO `values` (`id`, `title`, `attribute_id`, `created_at`, `updated_at`) VALUES
(26, '150ML', 3, '2025-06-01 19:45:55', '2025-06-12 05:21:21'),
(25, '120ML', 3, '2025-06-01 19:45:48', '2025-06-12 05:21:10'),
(24, '100ML', 3, '2025-06-01 19:45:39', '2025-06-12 05:20:46'),
(3, '90ML', 3, NULL, '2025-06-12 05:20:38'),
(27, '75ML', 3, '2025-06-11 09:44:15', '2025-06-11 10:23:04'),
(28, '60ML', 3, '2025-06-11 09:44:21', '2025-06-11 10:22:58'),
(29, '50ML', 3, '2025-06-11 09:44:25', '2025-06-11 10:22:52'),
(30, '200ML', 3, '2025-06-12 05:22:29', '2025-06-12 05:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `product_id`, `sku`, `quantity`, `price`, `image`, `created_at`, `updated_at`) VALUES
(37, 20, '200 ml', 17, 10000, NULL, '2025-06-01 20:15:38', '2025-06-01 20:15:48'),
(36, 19, '100ml', 15, 17000, NULL, '2025-06-01 20:10:34', '2025-06-01 20:10:34'),
(35, 18, '100ml', 12, 12000, NULL, '2025-06-01 20:04:55', '2025-06-01 20:04:55'),
(34, 17, '100ml', 10, 49680, NULL, '2025-06-01 19:46:22', '2025-06-01 19:46:39'),
(38, 21, '100ml', 10, 12000, NULL, '2025-06-10 11:52:48', '2025-06-10 11:52:59'),
(39, 22, '300 ml', 10, 12000, NULL, '2025-06-10 11:55:52', '2025-06-10 11:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `variation_attributes`
--

CREATE TABLE `variation_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `value_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_attributes`
--

INSERT INTO `variation_attributes` (`id`, `variation_id`, `attribute_id`, `value_id`, `value`, `created_at`, `updated_at`) VALUES
(70, 37, 3, 25, '200 ml', '2025-06-01 20:15:38', '2025-06-01 20:15:38'),
(69, 36, 3, 3, '100ml', '2025-06-01 20:10:34', '2025-06-01 20:10:34'),
(68, 35, 3, 3, '100ml', '2025-06-01 20:04:55', '2025-06-01 20:04:55'),
(67, 34, 3, 3, '100ml', '2025-06-01 19:46:22', '2025-06-01 19:46:22'),
(71, 38, 3, 3, '100ml', '2025-06-10 11:52:48', '2025-06-10 11:52:48'),
(72, 39, 3, 26, '300 ml', '2025-06-10 11:55:52', '2025-06-10 11:55:52'),
(73, 40, 3, 26, '300 ml', '2025-06-10 11:58:37', '2025-06-10 11:58:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `filemanager`
--
ALTER TABLE `filemanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_parent_id_index` (`parent_id`),
  ADD KEY `menu_items_menu_id_index` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_collections`
--
ALTER TABLE `product_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_collections_product_id_foreign` (`product_id`),
  ADD KEY `product_collections_collection_id_foreign` (`collection_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_created_by_foreign` (`created_by`),
  ADD KEY `roles_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `values`
--
ALTER TABLE `values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `variation_attributes`
--
ALTER TABLE `variation_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_attributes_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_attributes_value_id_foreign` (`value_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filemanager`
--
ALTER TABLE `filemanager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `product_collections`
--
ALTER TABLE `product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `values`
--
ALTER TABLE `values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `variation_attributes`
--
ALTER TABLE `variation_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
