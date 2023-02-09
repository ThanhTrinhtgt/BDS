-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 09, 2023 at 09:44 AM
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
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `value` varchar(254) NOT NULL,
  `key` varchar(100) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `value`, `key`, `desc`) VALUES
(1, 'Dự án', '', 'KEY_TYPE_SEARCH', ''),
(2, 'Nhà đất bán', '', 'KEY_TYPE_SEARCH', ''),
(3, 'Nhà cho thuê', '', 'KEY_TYPE_SEARCH', ''),
(4, 'Tin rao', 'tin-rao', 'KEY_TYPE_MENU', ''),
(5, 'Tin tuc', 'tin-tuc', 'KEY_TYPE_MENU', ''),
(6, 'Lien he', 'lien-he', 'KEY_TYPE_MENU', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `seo_name` varchar(254) NOT NULL,
  `short_desc` text NOT NULL,
  `desc` text NOT NULL,
  `sort` int(10) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `name`, `seo_name`, `short_desc`, `desc`, `sort`, `type`) VALUES
(1, 'Sốt đất bình dương', 'sot-dat-binh-duong', 'tin tức cực hot sốt đất tại bình dương', '<p>12r 121 fasf 12r12 f1f1w 12r12412412</p>\n', 1, 0),
(2, 'Tin tức đất Hà Tĩnh ', 'ha-tinh-sot-dat', '', '\r\nfasdfasd f2f13ffsafasfa\r\n\r\n\r\n', 1, 0),
(3, 'Tin tức đất Hà Giang ', 'ha-giang-sot-dat', 'tại đây đang rất ', '<p>fasdfasd&nbsp;<em>f2f13<u>ffsafasfa 12 csaf ấ</u></em></p>\n', 1, 0),
(6, 'Novuland đang dần hồi phục', 'novuland-hoi-phuc', ' 1r212  ấ', '<p>&nbsp;r12f 1f12</p>\n', 1, 0);

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
-- Table structure for table `real-estate`
--

CREATE TABLE `real-estate` (
  `id` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `short_desc` text NOT NULL,
  `desc` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `area` float NOT NULL DEFAULT 0,
  `unit` varchar(10) NOT NULL,
  `sort` int(10) NOT NULL,
  `type` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `real-estate`
--

INSERT INTO `real-estate` (`id`, `name`, `short_desc`, `desc`, `price`, `area`, `unit`, `sort`, `type`) VALUES
(1, 'Nhà mặt tiền đường Lý Phục Man', '', '<p>12r 12 zxc fasfas</p>\n', 0, 0, '', 1, 0),
(2, 'Tin tức đất Hà Giang ', 'tại đây đang rất ', '<p>fasfasf 2r122</p>\n', 0, 0, '', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
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
-- Indexes for table `real-estate`
--
ALTER TABLE `real-estate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real-estate`
--
ALTER TABLE `real-estate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
