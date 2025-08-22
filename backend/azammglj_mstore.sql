-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 13, 2025 at 08:04 AM
-- Server version: 10.6.20-MariaDB-cll-lve-log
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azammglj_mstore`
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
(1, 'size', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'color', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Men\'s Fashion', 'mens-fashion', NULL, 'demo/cat_men.png', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'T-Shirts', 't-shirts', NULL, NULL, 1, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Mens Pants Trousers', 'mens-pants-trousers', NULL, NULL, 1, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 'Shoes', 'shoes', NULL, NULL, 1, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'Health & Beauty', 'health-beauty', NULL, 'demo/cat_woman.png', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 'Makeup', 'makeup', NULL, NULL, 5, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 'Skin Care', 'skin-care', NULL, NULL, 5, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, 'Beauty Tools', 'beauty-tools', NULL, NULL, 5, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, 'Women\'s Fashion', 'womens-fashion', NULL, 'demo/cat__woman2.png', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, 'Unstitched Fabric', 'unstitched-fabric', NULL, NULL, 9, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, 'Kurtas & Shalwar Kameez', 'kurtas-shalwar-kameez', NULL, NULL, 9, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, 'Tops', 'tops', NULL, NULL, 9, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, 'Mother & Baby', 'mother-baby', NULL, 'demo/cat__woman2.png', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, 'Milk Formula', 'milk-formula', NULL, NULL, 13, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(15, 'Diapering & Potty', 'diapering-potty', NULL, NULL, 13, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(16, 'Feeding', 'feeding', NULL, NULL, 13, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(17, 'Groceries & Pets', 'groceries-pets', NULL, 'demo/Groceries_Pets.png', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(18, 'Fresh Produce', 'fresh-produce', NULL, NULL, 17, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(19, 'Breakfast', 'breakfast', NULL, NULL, 17, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(20, 'Beverages', 'beverages', NULL, NULL, 17, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(21, 'Home & Lifestyle', 'home-lifestyle', NULL, 'demo/HomeLifestyle.png', NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(22, 'Bath', 'bath', NULL, NULL, 21, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(23, 'Bedding', 'bedding', NULL, NULL, 21, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(24, 'Furniture', 'furniture', NULL, NULL, 21, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(25, 'Electronic Devices', 'electronic-devices', NULL, '', NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(26, 'Laptops', 'laptops', NULL, NULL, 25, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(27, 'Monitors', 'monitors', NULL, NULL, 25, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(28, 'Mobiles', 'mobiles', NULL, NULL, 25, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(29, 'Electronic Accessories', 'electronic-accessories', NULL, '', NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(30, 'Mobile Accessories', 'mobile-accessories', NULL, NULL, 29, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(31, 'Headphones & Headsets', 'headphones-headsets', NULL, NULL, 29, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(32, 'Wearable Technology', 'wearable-technology', NULL, NULL, 29, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(33, 'TV & Home Appliances', 'tv-home-appliances', NULL, '', NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(34, 'Air Conditioners', 'air-conditioners', NULL, NULL, 33, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(35, 'Televisions', 'televisions', NULL, NULL, 33, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(36, 'Refrigerators', 'refrigerators', NULL, NULL, 33, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(37, 'Sports & Outdoor', 'sports-o', NULL, '', NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(38, 'Exercise & Fitness', 'exercise-fitness', NULL, NULL, 37, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(39, 'Sports Nutrition', 'sports-nutrition', NULL, NULL, 37, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(40, 'Team Sports', 'team-sports', NULL, NULL, 37, NULL, 0, NULL, 1, NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(6, 'New Sale Offer', 'sale', '', 1, NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(1, 'Mens', 'mens', 'favourite pieces from Mens Collections', 2, NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Womens', 'womens', 'favourite pieces from Womens Collections', 3, NULL, NULL, NULL, NULL, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Kids', 'kids', 'favourite pieces from Kids Collections', 4, NULL, NULL, NULL, NULL, 1, 0, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 'Accessories', 'accessories', 'favourite pieces from Accessories Collections', 4, NULL, NULL, NULL, NULL, 1, 0, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'shoes', 'shoes', 'favourite pieces from Shoes Collections', 4, NULL, NULL, NULL, NULL, 1, 0, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 'GirlsShortsSummer', 'GirlsShortsSummer', 'filemanager/GirlsShortsSummer.jpeg', 'GirlsShortsSummer.jpeg', 241693, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(2, 'GirlsShortsSummer_hover', 'GirlsShortsSummer_hover', 'filemanager/GirlsShortsSummer_hover.jpeg', 'GirlsShortsSummer_hover.jpeg', 125155, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(3, 'Groceries_Pets', 'Groceries_Pets', 'filemanager/Groceries_Pets.png', 'Groceries_Pets.png', 1417947, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(4, 'HomeLifestyle', 'HomeLifestyle', 'filemanager/HomeLifestyle.png', 'HomeLifestyle.png', 1441175, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(5, 'banner1', 'banner1', 'filemanager/banner1.jpg', 'banner1.jpg', 164261, 'jpg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(6, 'banner1', 'banner1', 'filemanager/banner1.png', 'banner1.png', 141685, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(7, 'blackacket', 'blackacket', 'filemanager/blackacket.jpeg', 'blackacket.jpeg', 109547, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(8, 'blackjacket_hover', 'blackjacket_hover', 'filemanager/blackjacket_hover.jpeg', 'blackjacket_hover.jpeg', 146705, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(9, 'blue pent', 'blue pent', 'filemanager/blue pent.jpeg', 'blue pent.jpeg', 102917, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(10, 'bluejacket', 'bluejacket', 'filemanager/bluejacket.jpeg', 'bluejacket.jpeg', 175565, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(11, 'bluejacket_hover', 'bluejacket_hover', 'filemanager/bluejacket_hover.jpeg', 'bluejacket_hover.jpeg', 164806, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(12, 'bluepent', 'bluepent', 'filemanager/bluepent.jpeg', 'bluepent.jpeg', 109037, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(13, 'cat__woman2', 'cat__woman2', 'filemanager/cat__woman2.png', 'cat__woman2.png', 1820866, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(14, 'cat_men', 'cat_men', 'filemanager/cat_men.png', 'cat_men.png', 1454138, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(15, 'cat_woman', 'cat_woman', 'filemanager/cat_woman.png', 'cat_woman.png', 1789638, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(16, 'cottonstylishshortstops', 'cottonstylishshortstops', 'filemanager/cottonstylishshortstops.jpeg', 'cottonstylishshortstops.jpeg', 92577, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(17, 'cottonstylishshortstops_hover', 'cottonstylishshortstops_hover', 'filemanager/cottonstylishshortstops_hover.jpeg', 'cottonstylishshortstops_hover.jpeg', 92315, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(18, 'cream', 'cream', 'filemanager/cream.jpeg', 'cream.jpeg', 119829, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(19, 'cream2', 'cream2', 'filemanager/cream2.jpeg', 'cream2.jpeg', 158639, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(20, 'cream2_hover', 'cream2_hover', 'filemanager/cream2_hover.jpeg', 'cream2_hover.jpeg', 117270, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(21, 'cream_hover', 'cream_hover', 'filemanager/cream_hover.jpeg', 'cream_hover.jpeg', 123222, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(22, 'favicon', 'favicon', 'filemanager/favicon.png', 'favicon.png', 1691, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(23, 'kurti', 'kurti', 'filemanager/kurti.jpeg', 'kurti.jpeg', 134897, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(24, 'kurti_hover', 'kurti_hover', 'filemanager/kurti_hover.jpeg', 'kurti_hover.jpeg', 129041, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(25, 'laptop', 'laptop', 'filemanager/laptop.png', 'laptop.png', 867618, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(26, 'laptop1', 'laptop1', 'filemanager/laptop1.png', 'laptop1.png', 629011, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(27, 'laptop1_hover', 'laptop1_hover', 'filemanager/laptop1_hover.png', 'laptop1_hover.png', 1186353, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(28, 'logo', 'logo', 'filemanager/logo.png', 'logo.png', 12818, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(29, 'makeup', 'makeup', 'filemanager/makeup.png', 'makeup.png', 1346068, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(30, 'makeup_hover', 'makeup_hover', 'filemanager/makeup_hover.png', 'makeup_hover.png', 802789, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(31, 'omega', 'omega', 'filemanager/omega.png', 'omega.png', 353230, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(32, 'omega_hover', 'omega_hover', 'filemanager/omega_hover.png', 'omega_hover.png', 1453534, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(33, 'pent', 'pent', 'filemanager/pent.jpeg', 'pent.jpeg', 122945, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(34, 'pent_hver', 'pent_hver', 'filemanager/pent_hver.jpeg', 'pent_hver.jpeg', 109256, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(35, 'ring', 'ring', 'filemanager/ring.png', 'ring.png', 680272, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(36, 'ring_hover', 'ring_hover', 'filemanager/ring_hover.png', 'ring_hover.png', 789458, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(37, 'shopbanner', 'shopbanner', 'filemanager/shopbanner.jpg', 'shopbanner.jpg', 74011, 'jpg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(38, 'slider1', 'slider1', 'filemanager/slider1.jpg', 'slider1.jpg', 238352, 'jpg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(39, 'slider2', 'slider2', 'filemanager/slider2.jpg', 'slider2.jpg', 171098, 'jpg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(40, 'slider3', 'slider3', 'filemanager/slider3.jpg', 'slider3.jpg', 129477, 'jpg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(41, 'sport', 'sport', 'filemanager/sport.png', 'sport.png', 1308065, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(42, 'tech', 'tech', 'filemanager/tech.png', 'tech.png', 794273, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(43, 'watch1', 'watch1', 'filemanager/watch1.jpeg', 'watch1.jpeg', 186194, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(44, 'watch1_hover', 'watch1_hover', 'filemanager/watch1_hover.jpeg', 'watch1_hover.jpeg', 194549, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(45, 'watch2', 'watch2', 'filemanager/watch2.jpeg', 'watch2.jpeg', 186194, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(46, 'watch2_hover', 'watch2_hover', 'filemanager/watch2_hover.jpeg', 'watch2_hover.jpeg', 173679, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others'),
(47, 'watch_hover', 'watch_hover', 'filemanager/watch_hover.jpeg', 'watch_hover.jpeg', 203203, 'jpeg', 'image/jpeg', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48', 1, 'others');

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
(1, 'Home', NULL, NULL, '/', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Shop', NULL, NULL, 'shop', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Men', NULL, NULL, '/shop?category=mens-fashion', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 'T-Shirts', NULL, NULL, '/shop?category=t-shirts', 2, 3, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'Mens Pants Trousers', NULL, NULL, '/shop?category=mens-pants-trousers', 2, 3, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 'Shoes', NULL, NULL, '/shop?category=shoes', 2, 3, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 'Women', NULL, NULL, '/shop?category=womens-fashion', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, 'Unstitched Fabric', NULL, NULL, '/shop?category=unstitched-fabric', 2, 7, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, 'Kurtas & Shalwar Kameez', NULL, NULL, '/shop?category=kurtas-shalwar-kameez', 2, 7, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, 'Tops', NULL, NULL, '/shop?category=tops', 2, 7, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, 'Health & Beauty', NULL, NULL, '/shop?category=health-beauty', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, 'Makeup', NULL, NULL, '/shop?category=unstitched-fabric', 2, 11, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, 'Skin Care', NULL, NULL, '/shop?category=skin-care', 2, 11, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, 'Beauty Tools', NULL, NULL, '/shop?category=beauty-tools', 2, 11, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(15, 'Mother & Baby', NULL, NULL, '/shop?category=mother-baby', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(16, 'Milk Formula', NULL, NULL, '/shop?category=milk-formula', 2, 15, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(17, 'Diapering & Potty', NULL, NULL, '/shop?category=diapering-potty', 2, 15, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(18, 'Feeding', NULL, NULL, '/shop?category=feeding', 2, 15, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(19, 'Home & Lifestyle', NULL, NULL, '/shop?category=home-lifestyle', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(20, 'Bath', NULL, NULL, '/shop?category=bath', 2, 19, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(21, 'Bedding', NULL, NULL, '/shop?category=bedding', 2, 19, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(22, 'Furniture', NULL, NULL, '/shop?category=furniture', 2, 19, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(23, 'Electronic Devices', NULL, NULL, '/shop?category=electronic-devices', 1, NULL, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(24, 'Laptops', NULL, NULL, '/shop?category=laptops', 2, 23, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(25, 'Monitors', NULL, NULL, '/shop?category=monitors', 2, 23, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(26, 'Mobiles', NULL, NULL, '/shop?category=mobiles', 2, 23, 1, 0, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
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
  `shortdetails` text NOT NULL,
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
(1, 'Contact Us', 'contact-us', ' ', '\n                <h2>Get in Touch with Us</h2>\n                <p>We’re here to help and answer any questions you might have. We look forward to hearing from you!</p>\n                <h2>Contact Information</h2>\n                <p><b>Email:</b> [your.email@example.com] </p>\n                <p><b>Phone:</b> [Your Phone Number] </p>\n                <p><b>Address:</b> [Your Physical Address, if applicable </p>\n                <h2>Business Hours </h2>\n                <p> Monday - Friday: 9:00 AM - 6:00 PM </p>\n                <p>Saturday: 10:00 AM - 4:00 PM </p>\n                <p>Sunday: Closed </p>\n\n                <h2>Follow Us </h2>\n                <p>Stay connected with us through social media:</p>\n\n                <p>[Facebook Icon] [Facebook URL] </p>\n                <p>[Twitter Icon] [Twitter URL] </p>\n                <p>[Instagram Icon] [Instagram URL] </p>\n                <p>[LinkedIn Icon] [LinkedIn URL] </p>\n                ', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Terms & Conditions', 'terms-conditions', ' ', '\n                  <h2> TERMS </h2>\n                   <p> By accessing the website at http://www.mstore.com/, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this website are protected by applicable copyright and trademark law.</p>\n\n           <h2> USE LICENSE </h2>\n            <p> Permission is granted to temporarily download one copy of the materials (information or software) on MSTORE`s website for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not:\n            modify or copy the materials;\n            use the materials for any commercial purpose, or for any public display (commercial or non-commercial);\n            attempt to decompile or reverse engineer any software contained on MSTORE`s website;\n            remove any copyright or other proprietary notations from the materials; or\n            transfer the materials to another person or \"mirror\" the materials on any other server.\n            This license shall automatically terminate if you violate any of these restrictions and may be terminated by MSTORE at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format. </p>\n\n           <h2> DISCLAIMER </h2>\n            <p>The materials on MSTORE`s website are provided on an `as is` basis. MSTORE makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.\n            Further, MSTORE does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to this site. </p>\n\n\n            <h2>LIMITATIONS </h2>\n            <p>In no event shall MSTORE be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on MSTORE`s website, even if MSTORE or a MSTORE authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you. </p>\n\n           <h2> ACCURACY OF MATERIALS </h2>\n            <p>The materials appearing on MSTORE`s website could include technical, typographical, or photographic errors. MSTORE does not warrant that any of the materials on its website are 100% accurate, complete or current. MSTORE may make changes to the materials contained on its website at any time without notice. However, MSTORE does not make any commitment to update the materials. </p>\n\n           <h2> PRODUCT & SERVICE DESCRIPTIONS </h2>\n            <p> Whilst we try to display the colors of our products accurately on the Website, the actual colors you see will depend on your screen and we cannot guarantee that your screen`s display of any color will accurately reflect the color of the product on delivery. </p>\n\n          <p>  All items are subject to availability. We will inform you as soon as possible if the product(s) or service(s) you have ordered are not available and we may offer an alternative product(s) or service(s) of equal or higher quality and value otherwise the order had to be canceled. </p>\n\n           <h2> ACCEPTANCE OF YOUR ORDER </h2>\n           <p> Please note that completion of the online checkout process does not constitute our acceptance of your order. Our acceptance of your order will take place only when we dispatch the product(s) or commencement of the services that you ordered from us. </p>\n           \n           <p>\n            By completing and submitting the electronic order form (or proceeding through the `checkout process`) you are making an offer to purchase goods which, if accepted by us, will result in a binding contract. Neither submitting an electronic order form nor completing the checkout process constitutes our acceptance of your order. </p>\n\n            <p>If you supplied us with your email address when entering your payment details (or if you have a registered account with us), we will notify you by email as soon as possible to confirm that we have received your order. </p>\n\n            <p>All products that you order through the Website will remain the property of MSTORE until we have received payment in full from you for those products. </p>\n\n            <p>If we cannot supply you with the product or service you ordered, we will not process your order. We will inform you via email or call, if you have already paid for the product or service, refund you in full as soon as reasonably possible. </p>\n\n           <p> MSTORE reserved the right to cancel your order in the case of but not limited to; unavailability of product, incorrectly listed price, or any other information. </p>\n\n            <h2>DELIVERY OF YOUR ORDER </h2>\n            <p>MSTORE products are sold on a delivery duty unpaid basis. The recipient may have to pay import duty or a formal customs entry fee prior to or on delivery. Additional taxes, fees or levies may apply according to local legislation and customers are required to check these details before placing an order for international delivery. </p>\n\n          <p>We will deliver to the home or office address indicated by you when you place an order.\n            We cannot deliver to PO boxes. All deliveries must be signed for upon receipt. We will try at least twice to deliver your order at the address indicated by you.</p>\n\n            <p>We reserve the right to cancel your purchase in the event nobody is available to sign for receipt.\n            You bear the risk for the products once delivery is completed.</p>\n\n           <p> Where possible, we try to deliver in one go. We reserve the right to split the delivery of your order, for instance (but not limited to) if part of your order is delayed or unavailable. In the event that we split your order, we will notify you of our intention to do so by sending you an e-mail to the e-mail address provided by you at the time of purchase. You will not be charged for any additional delivery costs.</p>\n\n            <p>We can entertain any changes to order provided if the order isn`t dispatched yet. We will not be able to accept any order change requests once the order is dispatched (neither any refund or exchange will be possible in case of delivery outside Pakistan.) </p>\n\n            <h2>LINKS</h2>\n            <p>We may have placed links on this Website to other websites which we think you may want to visit. We do not vet these websites and do not have any control over their contents. Except where required by applicable law, MSTORE cannot accept any liability in respect of the use of these websites.</p>\n\n            <h2>MODIFICATIONS</h2>\n            <p>MSTORE may revise these terms of service for its website at any time without notice. By using this website you are agreeing to be bound by the then current version of these terms of service.</p>\n\n            <h2>GOVERNING LAW</h2>\n            <p>These terms and conditions are governed by and construed in accordance with the laws of Pakistan and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.</p>\n\n            <h2>COMPLAINTS PROCESS </h2>\n            <p>We hope that you`re pleased with any purchase you`ve made or the service you`ve received from MSTORE and that you`ll never have reason to complain - but if there`s something you`re not happy with, we`d like to put matters right, so please contact us straight away: </p>\n\n            <h2>BY EMAIL </h2>\n            <p> eshop@mstore.com </p>\n\n            <h2>BY TELEPHONE </h2>\n            <p> 021 111 112 111 (9am - 10pm , Monday - Saturday ) </p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Frequently Asked Questions', 'faq', ' ', '\n               <h2> HOW DO I PLACE AN ORDER? </h2>\n               <p> Ordering at mantra.com.pk is easy. Just select the items you want to shop, enter your shipping address and payment information, and you can place your order. If you need any assistance, give us a call at +92311-1111111 Monday to Saturday. </p>\n\n               <h2> HOW WILL MY ORDER BE DELIVERED TO ME? </h2>\n               <p> Your order would be delivered through reputed courier companies at your doorstep. </p>\n\n               <h2> HOW WILL I KNOW IF ORDER IS PLACED SUCCESSFULLY? </h2>\n               <p> Once your Order is successfully placed, you will receive a confirmation call, email, and text message from mantra.com.pk. This mail will have all the details related to your order. Order details can also be viewed at My Account -> My Orders if you have placed the order on your own online. </p>\n\n               <h2> DO YOU TAKE ORDERS OVER THE PHONE? </h2>\n               <p> Yes, we do take orders over the phone. The payment mode possible for these orders is Cash on Delivery only. </p>\n\n               <h2> I TRIED PLACING ORDER USING MY CREDIT CARD BUT IT ISN\'T WORKING. CAN YOU HELP ME PLACE AN ORDER?</h2>\n\n               <p> Yes, if your debit/credit card isn\'t working, we can always take your order over the phone. Do call us at +92311-1111111. </p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 'Shipping Policy', 'shipping-policy', ' ', '\n               <h2>Shipping Policy</h2>\n                <p>Thank you for shopping at MSTORE. Below are the terms and conditions \n                that constitute our Shipping Policy.</p>\n                \n                <h2>Processing Time</h2>\n                <p>All orders are processed within [X] business days. Orders are not shipped or delivered on weekends or holidays.</p>\n                <p>If we are experiencing a high volume of orders, shipments may be delayed by a few days. Please allow additional days in transit for delivery. If there will be a significant delay in the shipment of your order, we will contact you via email or telephone.</p>\n                \n                <h2>Shipping Rates & Delivery Estimates</h2>\n                <p>Shipping charges for your order will be calculated and displayed at checkout.</p>\n                <ul>\n                    <li><strong>Standard Shipping</strong>: [estimated delivery time] - [cost]</li>\n                    <li><strong>Expedited Shipping</strong>: [estimated delivery time] - [cost]</li>\n                    <li><strong>Overnight Shipping</strong>: [estimated delivery time] - [cost]</li>\n                </ul>\n                <p>Delivery delays can occasionally occur.</p>\n                \n                <h2>Shipment to P.O. boxes or APO/FPO addresses</h2>\n                <p>[Your Company Name] ships to addresses within the U.S., U.S. Territories, and APO/FPO/DPO addresses.</p>\n                \n                <h2>Shipment Confirmation & Order Tracking</h2>\n                <p>You will receive a Shipment Confirmation email once your order has shipped containing your tracking number(s). The tracking number will be active within 24 hours.</p>\n                \n                <h2>Customs, Duties, and Taxes</h2>\n                <p>[Your Company Name] is not responsible for any customs and taxes applied to your order. All fees imposed during or after shipping are the responsibility of the customer (tariffs, taxes, etc.).</p>\n                \n                <h2>Damages</h2>\n                <p>[Your Company Name] is not liable for any products damaged or lost during shipping. If you received your order damaged, please contact the shipment carrier to file a claim.</p>\n                <p>Please save all packaging materials and damaged goods before filing a claim.</p>\n                \n                <h2>International Shipping Policy</h2>\n                <p>We currently do not ship outside the U.S. [Or provide details if you do ship internationally]</p>\n                \n                <h2>Returns Policy</h2>\n                <p>Our Return & Refund Policy provides detailed information about options and procedures for returning your order.</p>\n    \n                ', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'EXCHANGE AND RETURN POLICY', 'exchange-and-return-policy', ' ', '\n                 <h2>Exchange and Return Policy</h2>\n                    <p>At MSTORE, we strive to ensure our customers are completely satisfied with their purchases. If you are not satisfied with your purchase, we are here to help.</p>\n                    \n                    <h2>Return Eligibility</h2>\n                    <p>To be eligible for a return, please make sure that:</p>\n                    <ul>\n                        <li>The product was purchased in the last [X] days</li>\n                        <li>The product is in its original packaging</li>\n                        <li>The product isn\'t used or damaged</li>\n                        <li>You have the receipt or proof of purchase</li>\n                    </ul>\n                    <p>Products that do not meet these criteria will not be considered for return.</p>\n                    \n                    <h2>Return Process</h2>\n                    <p>To initiate a return, please follow these steps:</p>\n                    <ul>\n                        <li>Contact us by email: [your.email@example.com]</li>\n                        <li>Include your order number, product details, and reason for the return</li>\n                        <li>We will provide you with instructions on where to send the returned product</li>\n                    </ul>\n                    \n                    <h2>Exchanges</h2>\n                    <p>We only replace items if they are defective or damaged. If you need to exchange an item for the same product, please contact us at [your.email@example.com] with the details of the product and the issue.</p>\n                    \n                    <h2>Refunds</h2>\n                    <p>Once we receive your item, we will inspect it and notify you that we have received your returned item. We will immediately notify you of the status of your refund after inspecting the item.</p>\n                    <p>If your return is approved, we will initiate a refund to your original method of payment. The time frame for the refund to be processed and posted depends on your card issuer\'s policies.</p>\n                    \n                    <h2>Shipping</h2>\n                    <p>You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.</p>\n                    \n                    <h2>Contact Us</h2>\n                    <p>If you have any questions about our Exchange and Return Policy, please contact us:</p>\n                    <p class=\'contact-info\'>\n                        [Your Company Name]<br>\n                        Email: [your.email@example.com]<br>\n                        Phone: [Your Phone Number]<br>\n                        Address: [Your Physical Address]\n                    </p>\n                ', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 'About us', 'about-us', ' ', '\n                <h2>Welcome To MSTORE</h2>\n                <p>MSTORE is fully customizable and appearing to your customers in accordance with what \n                they need and what they search Be a star of your own dream.Start your own ecommerce business \n                right now!</p>\n\n                <h2>Our Story</h2>\n                <p>MSTORE started when [founder\'s name or \'we\'] realized that [describe the problem you set out to solve]. Since then, we have grown from a small [type of business, e.g., family-run business] to a [describe current state, e.g., thriving e-commerce platform] \n                that serves customers worldwide.</p>\n\n                <h2>Our Mission and Values </h2>\n                <p> Our mission is to [your mission statement]. We believe in [core values, e.g., quality, sustainability, customer satisfaction], and these principles guide everything we do.</p>\n\n                <p><b>Quality:</b> We are dedicated to providing products that meet the highest standards.</p>\n                <p><b>Sustainability:</b> We prioritize eco-friendly practices and sustainable sourcing.</p>\n                <p><b>Customer Satisfaction:</b> Our customers are at the heart of our business, and we strive to exceed their expectations every day.</p>\n\n                <h2>What We Offer</h2>\n                <p>[Brief description of your products/services]. Whether you are looking for [example product 1], [example product 2], or [example product 3], we have something for everyone. Our products are [unique selling points, e.g., handcrafted, ethically sourced, made from the finest materials].\n                </p>\n\n                <h2>Join Our Community</h2>\n                <p>We invite you to join our community of satisfied customers. [Call to action, e.g., Browse our latest collection,Sign up for our newsletter, Follow us on social media]. </p>\n                \n                <p>Feel free to contact us at [contact information] if you have any questions or need assistance. We are here to help!\n                </p>\n\n                ', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 'Privacy Policy', 'privacy-policy', ' ', '\n                 <h2>Privacy Policy</h2>\n                <p>Welcome to MSTORE</p>\n                <p>We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at [your.email@example.com].</p>\n                <p>When you visit our website [Your Website URL], and use our services, you trust us with your personal information. We take your privacy very seriously. In this privacy policy, we seek to explain to you in the clearest way possible what information we collect, how we use it and what rights you have in relation to it. We hope you take some time to read through it carefully, as it is important. If there are any terms in this privacy policy that you do not agree with, please discontinue use of our Sites and our services.</p>\n\n                <h2>Information We Collect</h2>\n                <p>We collect personal information that you voluntarily provide to us when registering at the [Website Name], expressing an interest in obtaining information about us or our products and services, when participating in activities on the [Website Name] (such as posting messages in our online forums or entering competitions, contests or giveaways) or otherwise contacting us.</p>\n\n                <h2>How We Use Your Information</h2>\n                <p>We use personal information collected via our [Website Name] for a variety of business purposes described below. We process your personal information for these purposes in reliance on our legitimate business interests, in order to enter into or perform a contract with you, with your consent, and/or for compliance with our legal obligations. We indicate the specific processing grounds we rely on next to each purpose listed below.</p>\n                <ul>\n                    <li>To facilitate account creation and logon process.</li>\n                    <li>To send administrative information to you.</li>\n                    <li>To fulfill and manage your orders.</li>\n                    <li>To post testimonials.</li>\n                    <li>Request Feedback.</li>\n                    <li>To protect our Services.</li>\n                    <li>To enforce our terms, conditions and policies.</li>\n                    <li>To respond to legal requests and prevent harm.</li>\n                    <li>To manage user accounts.</li>\n                    <li>To deliver services to the user.</li>\n                    <li>To respond to user inquiries/offer support to users.</li>\n                </ul>\n\n                <h2>Sharing Your Information</h2>\n                <p>We only share and disclose your information in the following situations:</p>\n                <ul>\n                    <li>Compliance with Laws.</li>\n                    <li>Vital Interests and Legal Rights.</li>\n                    <li>Vendors, Consultants and Other Third-Party Service Providers.</li>\n                    <li>Business Transfers.</li>\n                    <li>Affiliates.</li>\n                    <li>Business Partners.</li>\n                    <li>With your Consent.</li>\n                    <li>Other Users.</li>\n                </ul>\n\n                <h2>Cookies and Other Tracking Technologies</h2>\n                <p>We may use cookies and similar tracking technologies (like web beacons and pixels) to access or store information. Specific information about how we use such technologies and how you can refuse certain cookies is set out in our Cookie Policy.</p>\n\n                <h2>Data Retention</h2>\n                <p>We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy policy, unless a longer retention period is required or permitted by law (such as tax, accounting or other legal requirements).</p>\n\n                <h2>Data Protection Rights</h2>\n                <p>You have certain rights under data protection laws in relation to your personal data. These include the right to:</p>\n                <ul>\n                    <li>Request access to your personal data.</li>\n                    <li>Request correction of your personal data.</li>\n                    <li>Request erasure of your personal data.</li>\n                    <li>Object to processing of your personal data.</li>\n                    <li>Request restriction of processing your personal data.</li>\n                    <li>Request transfer of your personal data.</li>\n                    <li>Right to withdraw consent.</li>\n                </ul>\n\n                <h2>Contact Us</h2>\n                <p>If you have questions or comments about this policy, you may contact our Data Protection Officer (DPO), by email at [your.email@example.com], or by post to:</p>\n                <p>[Your Company Name]<br>\n                [Street Address]<br>\n                [City, State, Zip Code]<br>\n                [Country]</p>\n\n                <h2>Changes to This Privacy Policy</h2>\n                <p>We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory reasons.</p>', NULL, NULL, NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 'Men’s Denim sky blue jeans', 'men-s-denim-sky-blue-jeans', 1449, 1549, 'xl-red', 1, NULL, NULL, NULL, NULL, 'demo/pent.jpeg', 'demo/pent.jpeg', NULL, 'demo/pent_hver.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'cotton stylish shortstops', 'cotton-stylish-shirtstops', 2000, 2500, 'xl-red', 11, NULL, NULL, NULL, NULL, 'demo/GirlsShortsSummer.jpeg', 'demo/GirlsShortsSummer.jpeg', NULL, 'demo/GirlsShortsSummer_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Girls Ladies Stylish Fashion Classy Neck Top', 'girls-ladies-stylish-fashion-classsy-neck-top', 1400, 2000, 'xl-red', 11, NULL, NULL, NULL, NULL, 'demo/kurti.jpeg', 'demo/kurti.jpeg', NULL, 'demo/kurti_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 'Girls Shorts Summer', 'girls-shorts-summer', 1000, 13, 'xl-red', 11, NULL, NULL, NULL, NULL, 'demo/cottonstylishshortstops.jpeg', 'demo/cottonstylishshortstops.jpeg', NULL, 'demo/cottonstylishshortstops_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 'Glow & Handsome Face Cream Instant Brightness 100g', 'glow-handsome-face-cream-instant-brightness-100g', 200, 280, 'xl-red', 1, NULL, NULL, NULL, NULL, 'demo/cream2.jpeg', 'demo/cream2.jpeg', NULL, 'demo/cream2_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 'Glow & Handsome Face Cream', 'glow-handsome-face-cream', 300, 480, 'xl-red', 5, NULL, NULL, NULL, NULL, 'demo/cream.jpeg', 'demo/cream.jpeg', NULL, 'demo/cream_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 'Joefox new men\'s watch', 'joefox-new-men-s-watch', 6000, 7000, 'xl-red', 1, NULL, NULL, NULL, NULL, 'demo/watch1.jpeg', 'demo/watch1.jpeg', NULL, 'demo/watch1_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, 'Joefox men\'s watch', 'joefox-men-s-watch', 15000, 17000, 'xl-red', 1, NULL, NULL, NULL, NULL, 'demo/watch2.jpeg', 'demo/watch2.jpeg', NULL, 'demo/watch2_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, 'White Liner Blue Jacket, front open zipper type - Stylish and Versatile Outerwear for Men Premium quality', 'white-liner-blue-jacket-front-open-zipper-type-stylish-and-versatile-outerwear-for-men-premium-quality', 3000, 3500, 'xl-red', 1, NULL, NULL, NULL, NULL, 'demo/bluejacket.jpeg', 'demo/bluejacket.jpeg', NULL, 'demo/bluejacket_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, 'Black Sleeve Zipper Style Jacket For Men', 'black-sleeve-zipper-style-jacket-for-men', 3000, 3500, 'xl-red', 1, NULL, NULL, NULL, NULL, 'demo/blackacket.jpeg', 'demo/blackacket.jpeg', NULL, 'demo/blackjacket_hover.jpeg', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, 'Woman ring', 'woman-ring', 500, 900, 'xl-red', 9, NULL, NULL, NULL, NULL, 'demo/ring.png', 'demo/ring.png', NULL, 'demo/ring_hover.png', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, 'Girl Wonderful Smoke Tube Lipstick | Pack Of 4', 'girl-wonderful-smoke-tube-lipstick-pack-of-4', 700, 900, 'xl-red', 6, NULL, NULL, NULL, NULL, 'demo/makeup.png', 'demo/makeup.png', NULL, 'demo/makeup_hover.png', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, 'Omega 3 Fish Oil 90 Caps', 'omega-3-fish-oil-90-caps', 4700, 4900, 'xl-red', 39, NULL, NULL, NULL, NULL, 'demo/omega.png', 'demo/omega.png', NULL, 'demo/omega_hover.png', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, 'Lenovo Core i5 3rd Generation | 8GB Ram , 500GB Hard Drive', 'lenovo-core-i5-3rd-generation-8gb-ram-500gb-hard-drive', 70000, 90000, 'xl-red', 26, NULL, NULL, NULL, NULL, 'demo/laptop1.png', 'demo/laptop1.png', NULL, 'demo/laptop1_hover.png', 1, 0, NULL, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n            </p>', NULL, NULL, NULL, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 1, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 1, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 1, 5, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 2, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 2, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 3, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 3, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, 4, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, 4, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, 4, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, 5, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, 5, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, 5, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, 5, 5, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(15, 6, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(16, 6, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(17, 6, 6, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(18, 7, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(19, 7, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(20, 7, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(21, 7, 5, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(22, 7, 6, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(23, 8, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(24, 8, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(25, 8, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(26, 9, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(27, 9, 5, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(28, 9, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(29, 9, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(30, 10, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(31, 10, 5, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(32, 10, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(33, 10, 6, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(34, 11, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(35, 11, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(36, 11, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(37, 12, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(38, 12, 5, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(39, 13, 6, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(40, 13, 3, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(41, 13, 4, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(42, 14, 6, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(43, 14, 1, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(44, 14, 2, 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 'site_title', 'MSTORE', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(2, 'meta_title', 'MSTORE', 'text', 2, 'seo', 0, 0, 'seo', NULL, NULL),
(3, 'meta_description', 'MSTORE is fully customizable and appearing to your customers in accordance with what they need and what they search', 'text', 3, 'seo', 0, 0, 'seo', NULL, NULL),
(4, 'meta_keywords', 'MSTORE is fully customizable and appearing to your customers in accordance with what they need and what they search', 'text', 4, 'seo', 0, 0, 'seo', NULL, NULL),
(5, 'footer_credits', 'Copyright: 2024 <a href=\"#.\"><span class=\"color_red\">MSTORE</span></a>', 'text', 5, 'theme', 3, 0, 'footer', NULL, NULL),
(6, 'phone_number', '03112239342', 'text', 5, 'general', 0, 0, 'others', NULL, NULL),
(7, 'email_address', 'lara@commerce.com', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(8, 'address', 'Address Will come here.', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(9, 'domain', 'www.laracommerce.com', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(10, 'logo', 'demo/logo.png', 'image', 1, 'general', 0, 0, 'others', NULL, NULL),
(11, 'menu_type', 'left', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(12, 'fav_icon', 'demo/favicon.png', 'image', 1, 'general', 0, 0, 'others', NULL, NULL),
(13, 'facebook_link', '#', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(14, 'youtube_link', '#', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(15, 'twitter_link', '', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(16, 'instagram_link', '', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(17, 'admin_logo', '', 'image', 4, 'admin_settings', 0, 0, 'others', NULL, NULL),
(18, 'admin_favicon', '', 'image', 4, 'admin_settings', 0, 0, 'others', NULL, NULL),
(19, 'site_currency', 'PKR', 'text', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(20, 'topbar_title', 'Welcome To MSTORE', 'text', 1, 'theme', 1, 0, 'header', NULL, NULL),
(21, 'site_short_details', 'MSTORE is fully customizable and appearing to your customers in accordance with what they need and what they search Be a star of your own dream. Start your own ecommerce business right now!', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(22, 'home_page_banner', 'demo/banner1.jpg', 'image', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(23, 'home_page_text', 'MSTORE', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(24, 'home_page_text_color', 'white', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(25, 'home_page_details', 'WE ENJOY WORKING ON THE SERVICES & PRODUCTS. WE PROVIDE AS MUCH AS YOU NEED THEM. THIS HELP US IN DELIVERING YOUR GOALS EASILY. BROWSE THROUGH THE WIDE RANGE OF SERVICES WE PROVIDE.', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(26, 'delivery_charges', '200', 'text', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(27, 'shop_banner', 'demo/shopbanner.jpg', 'image', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL);

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
(1, 'New Fashion style', NULL, 'We design and developed theme that are amazingly Unique', 'demo/slider1.jpg', NULL, 1, '/shop', 1, 'Shop Now', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Beautiful Designs', NULL, 'The Website is all you need to build outstanding online shop', 'demo/slider2.jpg', NULL, 2, '/shop', 1, 'Shop Now', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'Inhale Designs', NULL, 'Special discount for this month Flat 30% Off', 'demo/slider3.jpg', NULL, 3, '/shop', 1, 'Shop Now', NULL, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 'xl', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'l', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 'm', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 's', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, '24', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, '26', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, '28', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, '30', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, '20', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, '22', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, '1', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, '2', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, '3', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, '4', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(15, 'red', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(16, 'blue', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(17, 'green', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(18, 'pink', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(19, 'white', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(20, 'black', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(21, 'brown', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(22, 'dark brown', 2, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 1, 'xl-red', 5, 1449, 'demo/pent.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 1, 'l-blue', 5, 1449, 'demo/pent.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 2, 'xl-red', 5, 2000, 'demo/GirlsShortsSummer.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 2, 'l-blue', 5, 2000, 'demo/GirlsShortsSummer.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 3, 'xl-red', 5, 1400, 'demo/kurti.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 3, 'l-blue', 5, 1400, 'demo/kurti.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 4, 'xl-red', 5, 1000, 'demo/cottonstylishshortstops.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, 4, 'l-blue', 5, 1000, 'demo/cottonstylishshortstops.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, 5, 'xl-red', 5, 200, 'demo/cream2.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, 5, 'l-blue', 5, 200, 'demo/cream2.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, 6, 'xl-red', 5, 300, 'demo/cream.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, 6, 'l-blue', 5, 300, 'demo/cream.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, 7, 'xl-red', 5, 6000, 'demo/watch1.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, 7, 'l-blue', 5, 6000, 'demo/watch1.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(15, 8, 'xl-red', 5, 15000, 'demo/watch2.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(16, 8, 'l-blue', 5, 15000, 'demo/watch2.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(17, 9, 'xl-red', 5, 3000, 'demo/bluejacket.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(18, 9, 'l-blue', 5, 3000, 'demo/bluejacket.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(19, 10, 'xl-red', 5, 3000, 'demo/blackacket.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(20, 10, 'l-blue', 5, 3000, 'demo/blackacket.jpeg', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(21, 11, 'xl-red', 5, 500, 'demo/ring.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(22, 11, 'l-blue', 5, 500, 'demo/ring.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(23, 12, 'xl-red', 5, 700, 'demo/makeup.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(24, 12, 'l-blue', 5, 700, 'demo/makeup.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(25, 13, 'xl-red', 5, 4700, 'demo/omega.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(26, 13, 'l-blue', 5, 4700, 'demo/omega.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(27, 14, 'xl-red', 5, 70000, 'demo/laptop1.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(28, 14, 'l-blue', 5, 70000, 'demo/laptop1.png', '2024-09-25 16:48:48', '2024-09-25 16:48:48');

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
(1, 1, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 1, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(3, 2, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(4, 2, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(5, 3, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(6, 3, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(7, 4, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(8, 4, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(9, 5, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(10, 5, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(11, 6, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(12, 6, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(13, 7, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(14, 7, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(15, 8, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(16, 8, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(17, 9, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(18, 9, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(19, 10, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(20, 10, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(21, 11, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(22, 11, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(23, 12, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(24, 12, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(25, 13, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(26, 13, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(27, 14, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(28, 14, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(29, 15, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(30, 15, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(31, 16, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(32, 16, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(33, 17, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(34, 17, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(35, 18, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(36, 18, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(37, 19, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(38, 19, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(39, 20, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(40, 20, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(41, 21, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(42, 21, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(43, 22, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(44, 22, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(45, 23, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(46, 23, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(47, 24, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(48, 24, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(49, 25, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(50, 25, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(51, 26, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(52, 26, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(53, 27, 1, 1, 'xl', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(54, 27, 2, 15, 'red', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(55, 28, 1, 2, 'l', '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(56, 28, 2, 16, 'blue', '2024-09-25 16:48:48', '2024-09-25 16:48:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filemanager`
--
ALTER TABLE `filemanager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_collections`
--
ALTER TABLE `product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `variation_attributes`
--
ALTER TABLE `variation_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
