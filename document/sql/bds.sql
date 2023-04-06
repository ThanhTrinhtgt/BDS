-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2023 at 04:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bds`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `banner_key` varchar(30) NOT NULL,
  `banner_group_id` int(11) NOT NULL DEFAULT 0,
  `seo_name` varchar(254) NOT NULL,
  `short_desc` varchar(254) NOT NULL,
  `desc` text NOT NULL,
  `img_url` varchar(254) NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banner-group`
--

CREATE TABLE `banner-group` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `banner_group_key` varchar(30) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `value` varchar(254) NOT NULL,
  `key` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `sort` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `img_url` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(254) NOT NULL,
  `level` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `province_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `module` varchar(50) NOT NULL,
  `img_url` varchar(254) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `img_url` varchar(254) NOT NULL,
  `seo_name` varchar(254) NOT NULL,
  `short_desc` text NOT NULL,
  `desc` text NOT NULL,
  `sort` int(10) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `date_add` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE `node` (
  `id` int(11) NOT NULL,
  `url` varchar(254) NOT NULL,
  `type` varchar(20) NOT NULL,
  `key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `real-estate`
--

CREATE TABLE `real-estate` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `seo_name` varchar(50) NOT NULL,
  `short_desc` text NOT NULL,
  `desc` text NOT NULL,
  `province_id` int(11) NOT NULL DEFAULT 0,
  `district_id` int(11) NOT NULL DEFAULT 0,
  `ward_id` int(11) NOT NULL DEFAULT 0,
  `address_no` varchar(150) NOT NULL,
  `address` varchar(350) DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `area` float NOT NULL DEFAULT 0,
  `unit` varchar(10) NOT NULL,
  `unit_area` varchar(20) DEFAULT NULL COMMENT 'đơn vị của diện tích m2, ha,...',
  `legally` varchar(100) NOT NULL,
  `num_bedroom` tinyint(4) NOT NULL,
  `num_toilet` tinyint(4) NOT NULL,
  `num_floor` tinyint(4) NOT NULL,
  `img_url` varchar(254) NOT NULL,
  `sort` int(10) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT 1,
  `feature` tinyint(3) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `province_id` int(10) UNSIGNED DEFAULT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner-group`
--
ALTER TABLE `banner-group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seo_name` (`seo_name`);

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `real-estate`
--
ALTER TABLE `real-estate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banner-group`
--
ALTER TABLE `banner-group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real-estate`
--
ALTER TABLE `real-estate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
