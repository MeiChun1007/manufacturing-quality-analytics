-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2026 at 04:06 PM
-- Server version: 10.11.19-MariaDB-cll-lve
-- PHP Version: 8.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yolotech_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_data_entry`
--

CREATE TABLE `rx7f8_data_entry` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT '',
  `date` datetime DEFAULT NULL,
  `week` varchar(255) DEFAULT '0',
  `component` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `vendor` text DEFAULT NULL,
  `operator` int(11) DEFAULT 0,
  `total` int(11) DEFAULT 0,
  `work_order_no` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `lot` varchar(255) DEFAULT NULL,
  `resort_nc` varchar(255) DEFAULT NULL,
  `reference_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_data_entry_nc`
--

CREATE TABLE `rx7f8_data_entry_nc` (
  `id` int(11) UNSIGNED NOT NULL,
  `entry_id` int(11) UNSIGNED NOT NULL,
  `nc_category` text DEFAULT NULL,
  `nc_type` text DEFAULT NULL,
  `nc_quantity` int(11) DEFAULT 0,
  `nc_percentage` decimal(15,2) DEFAULT 0.00,
  `ordering` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_data_entry_nc_images`
--

CREATE TABLE `rx7f8_data_entry_nc_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `nc_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(512) NOT NULL,
  `uploaded_by` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `ordering` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_nc_category`
--

CREATE TABLE `rx7f8_nc_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT '',
  `category` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_nc_category`
--

INSERT INTO `rx7f8_nc_category` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `category`) VALUES
(1, 1, 1, NULL, NULL, 899, 899, '', '', '', '', '', 'CASTING'),
(2, 1, 2, NULL, NULL, 899, 899, '', '', '', '', '', 'DEBURRING'),
(3, 1, 3, NULL, NULL, 899, 899, '', '', '', '', '', 'ED-COAT / PAINTING'),
(4, 1, 4, NULL, NULL, 899, 899, '', '', '', '', '', 'MACHINING'),
(5, 1, 5, NULL, NULL, 899, 899, '', '', '', '', '', 'OTHERS'),
(6, 1, 6, NULL, NULL, 899, 899, '', '', '', '', '', 'CAMERA / BLOW'),
(7, 1, 7, NULL, NULL, 899, 899, '', '', '', '', '', 'PIN GAUGE'),
(8, 1, 8, NULL, NULL, 899, 899, '', '', '', '', '', 'KOKESHI');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_nc_types`
--

CREATE TABLE `rx7f8_nc_types` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT '',
  `category` int(11) UNSIGNED DEFAULT 0,
  `nc` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_nc_types`
--

INSERT INTO `rx7f8_nc_types` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `category`, `nc`) VALUES
(1, -2, 1, NULL, NULL, 899, 899, '', '', '', '', '', 1, '7.51 PEEL OFF'),
(2, -2, 2, NULL, NULL, 899, 899, '', '', '', '', '', 2, 'CLAMPING MARK'),
(3, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'AIR HOLE'),
(4, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'AXLE WIDTH'),
(5, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'BROKEN'),
(6, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'BULGING'),
(7, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'COLD SHOT'),
(8, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'DIE SET DIRTY'),
(9, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'EROSION'),
(10, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'FLOW LINE'),
(11, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'GALLING'),
(12, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'POROSITY'),
(13, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'SINK IN'),
(14, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'WORDING NC'),
(15, -2, 0, NULL, NULL, 0, 0, '', '', '', '', '', 1, 'OTHER CASTING NC'),
(16, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 2, 'OVER BUFFING'),
(17, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'BURR'),
(18, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'DUST'),
(19, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'EXTRA MATERIAL'),
(20, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'FILLING MARK'),
(21, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'GATING UNCLEAR'),
(22, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'MILLING UNCLEAR'),
(23, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'PARTING LINE'),
(24, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'PUCHING UNCLEAR'),
(25, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'SCRATCHES (B)'),
(26, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'TUMBLING MARK'),
(27, -2, 0, NULL, NULL, 0, 0, '', '', '', '', '', 2, 'OTHER DEBURRING NC'),
(28, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'AIR TRAP'),
(29, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'BLISTER'),
(30, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'CARBON STAIN'),
(31, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'COLOUR TONE'),
(32, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'DUST MARK (OVEN)'),
(33, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'DUST MARK / RAISED MATERIAL'),
(34, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'GLUE MARK'),
(35, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'HAIR MARK'),
(36, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'LUMP'),
(37, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'ORANGE SKIN'),
(38, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'OVER ETCHING / PIN HOLES'),
(39, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'ROUGH SURFACE'),
(40, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'RUBBING MARK'),
(41, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'TOUCHING PART'),
(42, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'WATER MARK'),
(43, -2, 0, NULL, NULL, 0, 0, '', '', '', '', '', 3, 'OTHER COATING NC'),
(44, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'CHAMFER NC'),
(45, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'CLAMPING MARK'),
(46, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'COOLANT'),
(47, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'DENTED (W)'),
(48, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'MACHINING BURR'),
(49, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'MACHINING LINE'),
(50, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'MILLING PEEL OFF'),
(51, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'OFFSET'),
(52, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'OVERCUT'),
(53, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'UNCUT'),
(54, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 8, 'MISS PROCESS / NO TAPPING '),
(55, -2, 0, NULL, NULL, 0, 0, '', '', '', '', '', 4, 'OTHER MACHINING NC'),
(56, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 5, 'DENTED (B)'),
(57, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 5, 'SCRATCHES (W)'),
(58, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 5, 'CORROSION'),
(59, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 5, 'DIRTY / OILY'),
(60, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 5, 'OTHERS'),
(61, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 6, 'CAMERA POROSITY'),
(62, 0, 0, NULL, NULL, 0, 0, '', '', '', '', '', 6, 'MISS PROCESS'),
(63, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 6, 'CAMERA DOUBLE HOLE'),
(64, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 6, 'CAMERA OFFSET'),
(65, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 6, 'CAMERA CHIPS'),
(66, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 6, 'CAMERA DIRTY / OILY'),
(67, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 6, 'CAMERA BURR'),
(68, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 7, 'AXLE WIDTH'),
(69, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 7, 'BAND WIDTH 2.51'),
(70, 1, 0, NULL, NULL, 0, 0, '', '', '', '', '', 7, 'OIL LINE HOLE NO-GO'),
(71, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 7, 'Ø 3.62 NO-GO NC'),
(72, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 7, 'Ø 5.15 NO-GO NC'),
(73, 1, 0, NULL, NULL, 899, 899, '', '', '', '', '', 7, 'Ø 12.01 NO-GO NC'),
(74, 1, 3, NULL, NULL, 899, 899, '', '', '', '', '', 7, 'HEIGHT GAUGE NC'),
(75, 1, 4, NULL, NULL, 899, 899, '', '', '', '', '', 7, 'CONCENTRICITY NC'),
(76, 1, 5, NULL, NULL, 899, 899, '', '', '', '', '', 3, 'NC COATING'),
(77, 1, 6, NULL, NULL, 899, 899, '', '', '', '', '', 8, 'MIXED MODEL'),
(78, 1, 7, NULL, NULL, 899, 899, '', '', '', '', '', 1, 'CRACK LINE'),
(79, 1, 8, NULL, NULL, 899, 899, '', '', '', '', '', 5, 'OLD MONTH CODE'),
(80, 1, 9, NULL, NULL, 899, 899, '', '', '', '', '', 1, 'HEAT CHECK'),
(81, 1, 10, NULL, NULL, 899, 899, '', '', '', '', '', 3, 'WHITE DOT'),
(82, 1, 11, NULL, NULL, 899, 899, '', '', '', '', '', 8, 'SHORTAGE'),
(83, 1, 12, NULL, NULL, 899, 899, '', '', '', '', '', 5, 'DIMENSION NC'),
(84, 1, 13, NULL, NULL, 899, 899, '', '', '', '', '', 3, 'NC PAINTING'),
(85, 1, 14, NULL, NULL, 899, 899, '', '', '', '', '', 2, 'BUFFING LINE '),
(86, 1, 15, NULL, NULL, 899, 899, '', '', '', '', '', 4, '22.6 STEP NC '),
(87, 1, 16, NULL, NULL, 899, 899, '', '', '', '', '', 3, 'SILICONE MARK'),
(88, 1, 17, NULL, NULL, 899, 899, '', '', '', '', '', 5, 'MICROMETER NC');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_product_catalogs`
--

CREATE TABLE `rx7f8_product_catalogs` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `component` varchar(255) DEFAULT '',
  `model_name` varchar(255) DEFAULT '',
  `vendor` varchar(255) DEFAULT '',
  `normal_hours_output` int(11) DEFAULT NULL,
  `ot_hours_output` int(11) DEFAULT NULL,
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_product_catalogs`
--

INSERT INTO `rx7f8_product_catalogs` (`id`, `asset_id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `component`, `model_name`, `vendor`, `normal_hours_output`, `ot_hours_output`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`) VALUES
(53, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLM4100 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(54, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLM4100 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(55, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLM4100 R (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(56, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT200 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(57, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT200 L (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(58, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT200 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(59, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT200 R (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(60, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT220 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(61, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT220 L (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(62, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT220 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(63, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT220 R (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(64, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT400 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(65, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT400 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(66, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT420 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(67, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT420 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(68, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT501 L (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(69, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT501 R (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(70, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT620 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(71, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT620 L (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(72, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT620 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(73, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLMT620 R (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(74, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLS7000 L ', '', 2500, 350, '', '', '', '', ''),
(75, 0, 1, 0, NULL, NULL, 0, 0, '2', 'BLS7000 R', '', 2500, 350, '', '', '', '', ''),
(76, 0, 1, 0, NULL, NULL, 0, 0, '2', 'STEF515 8R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(77, 0, 1, 0, NULL, NULL, 0, 0, '2', 'STEF515 8R (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(78, 0, 1, 0, NULL, NULL, 0, 0, '2', 'ST-EF515 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(79, 0, 1, 0, NULL, NULL, 0, 0, '2', 'ST-EF515 L (MACHINING)', '', 2500, 350, '', '', '', '', ''),
(80, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRM315 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(81, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRM447 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(82, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT200 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(83, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT410 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(84, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT420 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(85, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT520 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(86, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT520 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(87, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT600 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(88, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRMT620 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(89, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRRS405 L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(90, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRRS405 L (MACHINING)', '', 1000, 130, '', '', '', '', ''),
(91, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRU6030 LF (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(92, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRU6030 LF (MACHINING)', '', 1000, 130, '', '', '', '', ''),
(93, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRU6030 LR (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(94, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRU6030 LR (MACHINING)', '', 1000, 130, '', '', '', '', ''),
(95, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRU6030 R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(96, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRUR300 LF(ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(97, 0, 1, 0, NULL, NULL, 0, 0, '3', 'BRUR300 LR (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(98, 0, 1, 0, NULL, NULL, 0, 0, '4', 'RDU6000OL (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(99, 0, 1, 0, NULL, NULL, 0, 0, '5', 'RDU4000IL (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(100, 0, 1, 0, NULL, NULL, 0, 0, '5', 'RDU6000IL (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(101, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU2000BM (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(102, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU2000BM (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(103, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU4000BM (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(104, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU4020BM (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(105, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU6000BM (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(106, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU6010BM (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(107, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU6020BM (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(108, 0, 1, 0, NULL, NULL, 0, 0, '6', 'RDU8000BM (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(109, 0, 1, 0, NULL, NULL, 0, 0, '7', 'SMRT62DA (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(110, 0, 1, 0, NULL, NULL, 0, 0, '7', 'RTCL750DA (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(111, 0, 1, 0, NULL, NULL, 0, 0, '7', 'RTCL750DA (MACHINING)', '', 4500, 600, '', '', '', '', ''),
(112, 0, 1, 0, NULL, NULL, 0, 0, '8', 'BLU4030LM L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(113, 0, 1, 0, NULL, NULL, 0, 0, '8', 'STU4030LM L (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(114, 0, 1, 0, NULL, NULL, 0, 0, '8', 'STU4030LM R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(115, 0, 1, 0, NULL, NULL, 0, 0, '8', 'STU2030LM R (ED-COAT)', '', 4500, 600, '', '', '', '', ''),
(116, 0, 1, 0, NULL, NULL, 0, 0, '9', 'PDM8240 L (ANODIZING)', '', 1200, 160, '', '', '', '', ''),
(117, 0, 1, 0, NULL, NULL, 0, 0, '9', 'PDM8240 L (MACHINING)', '', 1200, 160, '', '', '', '', ''),
(118, 0, 1, 0, NULL, NULL, 0, 0, '9', 'PDM8240 R (ANODIZING)', '', 1200, 160, '', '', '', '', ''),
(119, 0, 1, 0, NULL, NULL, 0, 0, '9', 'PDM8240 R (MACHINING)', '', 1200, 160, '', '', '', '', ''),
(120, 0, 1, 0, NULL, NULL, 0, 0, '10', 'BEARING PEDESTAL', '', 1800, 240, '', '', '', '', ''),
(121, 187, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM L1', '', 4500, 600, '', '', '', '', ''),
(122, 186, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM L2', '', 4500, 600, '', '', '', '', ''),
(123, 185, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM L3', '', 4500, 600, '', '', '', '', ''),
(124, 184, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM L4', '', 4500, 600, '', '', '', '', ''),
(125, 183, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM L5', '', 4500, 600, '', '', '', '', ''),
(126, 182, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM L6', '', 4500, 600, '', '', '', '', ''),
(127, 181, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM R1', '', 4500, 600, '', '', '', '', ''),
(128, 180, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM R2', '', 4500, 600, '', '', '', '', ''),
(129, 179, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM R3', '', 4500, 600, '', '', '', '', ''),
(130, 178, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM R4', '', 4500, 600, '', '', '', '', ''),
(131, 177, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM R5', '', 4500, 600, '', '', '', '', ''),
(132, 176, 1, 0, NULL, NULL, 899, 899, '11', 'JOINT CNR BTM R6', '', 4500, 600, '', '', '', '', ''),
(133, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLM4100 R', '', 11000, 1500, '', '', '', '', ''),
(134, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT200 L', '', 11000, 1500, '', '', '', '', ''),
(135, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT200 R', '', 11000, 1500, '', '', '', '', ''),
(136, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT220 L', '', 11000, 1500, '', '', '', '', ''),
(137, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT220 R', '', 11000, 1500, '', '', '', '', ''),
(138, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT501 L', '', 11000, 1500, '', '', '', '', ''),
(139, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT501 R', '', 11000, 1500, '', '', '', '', ''),
(140, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT620 L', '', 11000, 1500, '', '', '', '', ''),
(141, 0, 1, 0, NULL, NULL, 0, 0, '12', 'BLMT620 R', '', 11000, 1500, '', '', '', '', ''),
(142, 0, 1, 0, NULL, NULL, 0, 0, '12', 'STEF515 L', '', 11000, 1500, '', '', '', '', ''),
(143, 0, 1, 0, NULL, NULL, 0, 0, '12', 'STEF515 8R', '', 11000, 1500, '', '', '', '', ''),
(144, 175, 1, 0, NULL, NULL, 899, 899, '12', 'RDU2000BM (MISS PROCESS)', '', 7500, 1000, '', '', '', '', ''),
(145, 174, 0, 0, NULL, NULL, 899, 899, '13', 'BLM4100 R', '', 4500, 600, '', '', '', '', ''),
(146, 173, 0, 0, NULL, NULL, 899, 899, '13', 'BLMT200 L', '', 4500, 600, '', '', '', '', ''),
(147, 172, 0, 0, NULL, NULL, 899, 899, '13', 'BLMT200 R', '', 4500, 600, '', '', '', '', ''),
(148, 171, 0, 0, NULL, NULL, 899, 899, '13', 'BLMT220 L', '', 4500, 600, '', '', '', '', ''),
(149, 170, 0, 0, NULL, NULL, 899, 899, '13', 'BLMT220 R', '', 4500, 600, '', '', '', '', ''),
(150, 169, 0, 0, NULL, NULL, 899, 899, '13', 'STEF515 L', '', 4500, 600, '', '', '', '', ''),
(151, 168, 0, 0, NULL, NULL, 899, 899, '13', 'STEF515 8R', '', 4500, 600, '', '', '', '', ''),
(152, 167, 0, 0, NULL, NULL, 899, 899, '13', 'BRRS405 L', '', 4500, 600, '', '', '', '', ''),
(153, 166, 0, 0, NULL, NULL, 899, 899, '13', 'BRU6030 LF', '', 4500, 600, '', '', '', '', ''),
(154, 165, 0, 0, NULL, NULL, 899, 899, '13', 'BRU6030 LR', '', 4500, 600, '', '', '', '', ''),
(155, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT200 L (12.01 AXLE WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(156, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT200 R (12.01 AXLE WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(157, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT200 L (2.51 BAND WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(158, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT200 R (2.51 BAND WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(159, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT220 L (12.01 AXLE WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(160, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT220 R (12.01 AXLE WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(161, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT220 L (2.51 BAND WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(162, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLMT220 R (2.51 BAND WIDTH)', '', 15000, 2000, '', '', '', '', ''),
(163, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLS7000 L (SLITTING)', '', 15000, 2000, '', '', '', '', ''),
(164, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BLS7000 R (SLITTING)', '', 15000, 2000, '', '', '', '', ''),
(165, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BRMT200 L (OIL LINE HOLE)', '', 15000, 2000, '', '', '', '', ''),
(166, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BRMT410 L (OIL LINE HOLE)', '', 15000, 2000, '', '', '', '', ''),
(167, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BRMT420 L (OIL LINE HOLE)', '', 15000, 2000, '', '', '', '', ''),
(168, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BRMT600 L (OIL LINE HOLE)', '', 15000, 2000, '', '', '', '', ''),
(169, 0, 1, 0, NULL, NULL, 0, 0, '14', 'BRMT620 L (OIL LINE HOLE)', '', 15000, 2000, '', '', '', '', ''),
(170, 159, 1, 0, NULL, NULL, 899, 899, '14', 'SMRT62DA (Ø 5.25 HOLES)', '', 4500, 600, '', '', '', '', ''),
(171, 158, 1, 0, NULL, NULL, 899, 899, '14', 'RTCL750DA (Ø 5.25 HOLES)', '', 4500, 600, '', '', '', '', ''),
(172, 0, 1, 0, NULL, NULL, 0, 0, '14', 'RDU6000BM (MIX MODEL RDU8000BM)', '', 7500, 1000, '', '', '', '', ''),
(173, 0, 1, 0, NULL, NULL, 0, 0, '14', 'RDU6000BM (HEIGHT GAUGE)', '', 7500, 1000, '', '', '', '', ''),
(174, 157, 1, 0, NULL, NULL, 899, 899, '14', 'RDU6000BM (Ø 12.01 HOLE)', '', 7500, 1000, '', '', '', '', ''),
(175, 164, 1, 0, NULL, NULL, 899, 899, '14', 'RDU6020BM (MIX MODEL RDU6010BM)', '', 7500, 1000, '', '', '', '', ''),
(176, 0, 1, 0, NULL, NULL, 0, 0, '14', 'RDU6020BM (HEIGHT GAUGE)', '', 7500, 1000, '', '', '', '', ''),
(177, 0, 1, 0, NULL, NULL, 0, 0, '14', 'RDU6020BM (CONCENTRICITY)', '', 7500, 1000, '', '', '', '', ''),
(178, 156, 1, 0, NULL, NULL, 899, 899, '14', 'RDU6020BM (Ø12.01 HOLE)', '', 7500, 1000, '', '', '', '', ''),
(179, 155, 1, 0, NULL, NULL, 899, 899, '14', 'RDU6020BM (Ø 3.60 HOLE)', '', 7500, 1000, '', '', '', '', ''),
(180, 154, 1, 0, NULL, NULL, 899, 899, '14', 'RDU6020BM (Ø 5.15 HOLE)', '', 7500, 1000, '', '', '', '', ''),
(181, 189, 1, 1, NULL, NULL, 899, 899, '15', 'CSRS410011', '', NULL, NULL, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_product_components`
--

CREATE TABLE `rx7f8_product_components` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `component_name` varchar(255) DEFAULT '',
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_product_components`
--

INSERT INTO `rx7f8_product_components` (`id`, `asset_id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `component_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`) VALUES
(1, 120, -2, 1, NULL, NULL, 899, 899, 'BEARING_PEDAL', '', '', '', '', ''),
(2, 121, 1, 2, NULL, NULL, 899, 899, 'MASTER CYLINDER', '', '', '', '', ''),
(3, 122, 1, 3, NULL, NULL, 899, 899, 'CALIPER', '', '', '', '', ''),
(4, 123, 1, 4, NULL, NULL, 899, 899, 'OUTER LINK', '', '', '', '', ''),
(5, 139, 1, 5, NULL, NULL, 899, 899, 'INNER LINK', '', '', '', '', ''),
(6, 145, 1, 6, NULL, NULL, 899, 899, 'BRACKET MEMBER', '', '', '', '', ''),
(7, 146, 1, 7, NULL, NULL, 899, 899, 'DISC ADAPTER', '', '', '', '', ''),
(8, 147, 1, 8, NULL, NULL, 899, 899, 'LEVER MEMBER', '', '', '', '', ''),
(9, 148, 1, 9, NULL, NULL, 899, 899, 'PEDAL BODY', '', '', '', '', ''),
(10, 149, 1, 10, NULL, NULL, 899, 899, 'BOSCH', '', '', '', '', ''),
(11, 150, 1, 11, NULL, NULL, 899, 899, 'TKR', '', '', '', '', ''),
(12, 151, 1, 12, NULL, NULL, 899, 899, 'CAMERA SORTING', '', '', '', '', ''),
(13, 152, 0, 13, NULL, NULL, 899, 899, 'BLOW', '', '', '', '', ''),
(14, 153, 1, 14, NULL, NULL, 899, 899, 'PIN GAUGE', '', '', '', '', ''),
(15, 188, 1, 15, NULL, NULL, 899, 899, 'SPIDER', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_usergroups`
--

CREATE TABLE `rx7f8_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_usergroups`
--

INSERT INTO `rx7f8_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 26, 'Public'),
(2, 1, 4, 23, 'Registered'),
(3, 2, 7, 12, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 2, 13, 16, 'Manager'),
(7, 6, 14, 15, 'Administrator'),
(8, 1, 24, 25, 'Super Users'),
(9, 1, 2, 3, 'Guest'),
(10, 2, 17, 18, 'Operator'),
(11, 2, 19, 20, 'Vendor'),
(12, 2, 21, 22, 'Vendor Manager'),
(13, 2, 5, 6, 'API Sync');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_users`
--

CREATE TABLE `rx7f8_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail` tinyint(4) DEFAULT 0,
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_users`
--

INSERT INTO `rx7f8_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`, `authProvider`) VALUES
(899, 'Developer', 'developer', 'developer@testing.com', '$2y$12$8am9XIGv9rFV5E9Sgbw7Ve7kqWRw.8tgJzA1.FDupCNEU6u1tImtG', 0, 1, '2026-07-15 09:58:23', '2026-10-14 07:15:53', '0', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(900, 'VENDOR A', 'vendor_a', 'vendor_a@testing.com', '$2y$12$2n2.VgTDumuMb.BRQDoOUubZTyKXdPoaEhtzJhD5spbyBX.shkjIO', 0, 0, '2026-07-16 03:27:48', '2026-09-09 08:11:06', '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(910, 'Alpha', 'alpha', 'alpha@testing.com', '$2y$12$0s5.d4UW2ol4NYy/NxpwzuA.aVqLYWaTPho5rrbkVK1FQQBj7Mmfa', 0, 0, '2026-07-16 04:25:47', '2026-08-28 04:38:30', '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(912, 'Beta', 'beta', 'beta@testing.com', '$2y$12$uYos1fX5LnADiAaxaQd9nOhsx7ALyMog4.15K.Qup355ywOYxmig6', 0, 0, '2026-07-20 04:25:29', '2026-09-10 01:31:13', '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(917, 'VENDOR', 'vendor', 'vendor@testing.com', '$2y$12$QieVmIO56ICZHjGpkcO3NeERBkvVMeO4iBwhdTgveESt8JEq/6m4y', 0, 0, '2026-07-28 06:57:00', '2026-10-14 07:58:39', '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(918, 'VENDOR B', 'vendor_b', 'vendor_b@testing.com', '$2y$12$obq5.N.3thbZ8u7YQlz5Q.MtWRTGvMWJNdlK4J4YQcPWb1Wo05wWW', 0, 0, '2026-07-28 07:00:21', NULL, '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(919, 'VENDOR C', 'vendor_c', 'vendor_c@testing.com', '$2y$12$Cxnz6D2B8Fc0pRL3F.qp4uBuRXE/3GqQld4MgzMCVQhY4cu1s0Foi', 0, 0, '2026-07-28 07:00:47', NULL, '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(920, 'VENDOR D', 'vendor_d', 'vendor_d@testing.com', '$2y$12$7BuvEnbDMgSjNggPtLt3KOcq22YywS5S8B0QJJQpifSIlhNbilsMK', 0, 0, '2026-07-28 07:01:22', NULL, '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(921, 'VENDOR E', 'vendor_e', 'vendor_e@testing.com', '$2y$12$VbiTxpHybGK2dpumlnWyeOqFkljM9bMDe2.Xzx8u9aH1H0aTf0tei', 0, 0, '2026-07-28 07:01:48', NULL, '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, ''),
(922, 'VENDOR F', 'vendor_f', 'vendor_f@testing.com', '$2y$12$usT0p.dXMNpXGguFCvl5SO0h6hgYq71b9wK09y8Telr3j7CeLVKbi', 0, 0, '2026-07-28 07:02:25', NULL, '', '{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}', NULL, 0, '', '', 0, '');
-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_user_usergroup_map`
--

CREATE TABLE `rx7f8_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_user_usergroup_map`
--

INSERT INTO `rx7f8_user_usergroup_map` (`user_id`, `group_id`) VALUES
(899, 8),
(899, 13),
(900, 11),
(910, 6),
(910, 10),
(912, 10),
(917, 12),
(918, 11),
(919, 11),
(920, 11),
(921, 11),
(922, 11);

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_vendor_access`
--

CREATE TABLE `rx7f8_vendor_access` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `main_vendor` int(11) UNSIGNED DEFAULT NULL,
  `vendors` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_vendor_access`
--

INSERT INTO `rx7f8_vendor_access` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `main_vendor`, `vendors`) VALUES
(1, 1, 1, NULL, NULL, 899, 899, 917, '920,919,922,921,918,900');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_vendor_details`
--

CREATE TABLE `rx7f8_vendor_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `vendor` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_vendor_details`
--

INSERT INTO `rx7f8_vendor_details` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `remark`, `vendor`) VALUES
(1, 1, 1, NULL, NULL, 899, 899, '', '', '', '', '', '1', '900'),
(2, 1, 2, NULL, NULL, 899, 899, '', '', '', '', '', '2', '900'),
(3, 1, 3, NULL, NULL, 899, 899, '', '', '', '', '', '3', '900'),
(4, 1, 4, NULL, NULL, 899, 899, '', '', '', '', '', '4', '900'),
(5, 1, 5, NULL, NULL, 899, 899, '', '', '', '', '', '1', '918'),
(6, 1, 6, NULL, NULL, 899, 899, '', '', '', '', '', '2', '918'),
(7, 1, 7, NULL, NULL, 899, 899, '', '', '', '', '', '3', '918'),
(8, 1, 8, NULL, NULL, 899, 899, '', '', '', '', '', '4', '918'),
(9, -2, 9, NULL, NULL, 899, 899, '', '', '', '', '', '', '900'),
(10, 1, 10, NULL, NULL, 911, 911, '', '', '', '', '', '1', '920'),
(11, 1, 11, NULL, NULL, 911, 911, '', '', '', '', '', '2', '920'),
(12, 1, 12, NULL, NULL, 911, 911, '', '', '', '', '', '3', '920'),
(13, 1, 13, NULL, NULL, 911, 911, '', '', '', '', '', '4', '920'),
(14, 1, 14, NULL, NULL, 911, 911, '', '', '', '', '', '1', '919'),
(15, 1, 15, NULL, NULL, 911, 911, '', '', '', '', '', '2', '919'),
(16, 1, 16, NULL, NULL, 911, 911, '', '', '', '', '', '3', '919'),
(17, 1, 17, NULL, NULL, 911, 911, '', '', '', '', '', '4', '919'),
(18, 1, 18, NULL, NULL, 911, 911, '', '', '', '', '', '1', '921'),
(19, 1, 19, NULL, NULL, 911, 911, '', '', '', '', '', '2', '921'),
(20, 1, 20, NULL, NULL, 911, 911, '', '', '', '', '', '3', '921'),
(21, 1, 21, NULL, NULL, 911, 911, '', '', '', '', '', '4', '921'),
(22, 1, 22, NULL, NULL, 911, 911, '', '', '', '', '', '1', '922'),
(23, 1, 23, NULL, NULL, 911, 911, '', '', '', '', '', '2', '922'),
(24, 1, 24, NULL, NULL, 911, 911, '', '', '', '', '', '3', '922'),
(25, 1, 25, NULL, NULL, 911, 911, '', '', '', '', '', '4', '922');

-- --------------------------------------------------------

--
-- Table structure for table `rx7f8_vendor_remarks`
--

CREATE TABLE `rx7f8_vendor_remarks` (
  `id` int(11) UNSIGNED NOT NULL,
  `state` tinyint(1) DEFAULT 1,
  `ordering` int(11) DEFAULT 0,
  `checked_out` int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `modified_by` int(11) DEFAULT 0,
  `custom_field_1` varchar(255) DEFAULT '',
  `custom_field_2` varchar(255) DEFAULT '',
  `custom_field_3` varchar(255) DEFAULT '',
  `custom_field_4` varchar(255) DEFAULT '',
  `custom_field_5` varchar(255) DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rx7f8_vendor_remarks`
--

INSERT INTO `rx7f8_vendor_remarks` (`id`, `state`, `ordering`, `checked_out`, `checked_out_time`, `created_by`, `modified_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `remark`, `note`) VALUES
(1, 1, 1, NULL, NULL, 899, 899, '', '', '', '', '', 'FRESH', NULL),
(2, 1, 2, NULL, NULL, 899, 899, '', '', '', '', '', 'SNE', 'STRIPPING & ED-COAT'),
(3, 1, 3, NULL, NULL, 899, 899, '', '', '', '', '', 'PR', 'PURCHASE RETURN'),
(4, 1, 4, NULL, NULL, 899, 899, '', '', '', '', '', 'DROP PART', NULL),
(12, -2, 5, NULL, NULL, 899, 899, '', '', '', '', '', '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rx7f8_data_entry`
--
ALTER TABLE `rx7f8_data_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `rx7f8_data_entry_date` (`date`),
  ADD KEY `rx7f8_data_entry_week` (`week`),
  ADD KEY `rx7f8_data_entry_total` (`total`);

--
-- Indexes for table `rx7f8_data_entry_nc`
--
ALTER TABLE `rx7f8_data_entry_nc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entry_id` (`entry_id`);

--
-- Indexes for table `rx7f8_data_entry_nc_images`
--
ALTER TABLE `rx7f8_data_entry_nc_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nc_id` (`nc_id`);

--
-- Indexes for table `rx7f8_nc_category`
--
ALTER TABLE `rx7f8_nc_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`);

--
-- Indexes for table `rx7f8_nc_types`
--
ALTER TABLE `rx7f8_nc_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `idx_category` (`category`);

--
-- Indexes for table `rx7f8_product_catalogs`
--
ALTER TABLE `rx7f8_product_catalogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`);

--
-- Indexes for table `rx7f8_product_components`
--
ALTER TABLE `rx7f8_product_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`);

--
-- Indexes for table `rx7f8_usergroups`
--
ALTER TABLE `rx7f8_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`);

--
-- Indexes for table `rx7f8_users`
--
ALTER TABLE `rx7f8_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_username` (`username`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `rx7f8_user_usergroup_map`
--
ALTER TABLE `rx7f8_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `rx7f8_vendor_access`
--
ALTER TABLE `rx7f8_vendor_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `idx_main_vendor` (`main_vendor`);

--
-- Indexes for table `rx7f8_vendor_details`
--
ALTER TABLE `rx7f8_vendor_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`);

--
-- Indexes for table `rx7f8_vendor_remarks`
--
ALTER TABLE `rx7f8_vendor_remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified_by` (`modified_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rx7f8_data_entry`
--
ALTER TABLE `rx7f8_data_entry`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rx7f8_data_entry_nc`
--
ALTER TABLE `rx7f8_data_entry_nc`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rx7f8_data_entry_nc_images`
--
ALTER TABLE `rx7f8_data_entry_nc_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rx7f8_nc_category`
--
ALTER TABLE `rx7f8_nc_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rx7f8_nc_types`
--
ALTER TABLE `rx7f8_nc_types`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `rx7f8_product_catalogs`
--
ALTER TABLE `rx7f8_product_catalogs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `rx7f8_product_components`
--
ALTER TABLE `rx7f8_product_components`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rx7f8_usergroups`
--
ALTER TABLE `rx7f8_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rx7f8_users`
--
ALTER TABLE `rx7f8_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `rx7f8_vendor_access`
--
ALTER TABLE `rx7f8_vendor_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rx7f8_vendor_details`
--
ALTER TABLE `rx7f8_vendor_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rx7f8_vendor_remarks`
--
ALTER TABLE `rx7f8_vendor_remarks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rx7f8_data_entry_nc_images`
--
ALTER TABLE `rx7f8_data_entry_nc_images`
  ADD CONSTRAINT `fk_nc_images_entry` FOREIGN KEY (`nc_id`) REFERENCES `rx7f8_data_entry_nc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
