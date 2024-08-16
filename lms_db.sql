-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2024 at 02:53 PM
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
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `address`, `contact`, `created_at`, `username`, `password`) VALUES
(2, 'Yashodip Jain', 'Zenda Chawk, Kapdane', '9511757691', '2024-04-21 09:59:45', 'yash', '$2y$10$WgL2d2fzi6IiGiTfXvdBluTLlMroU8zBtIcRut7SzOB6j9i/LbA4K'),
(7, 'Chirag Jain', 'Amrutdham, Nashik', '7219081068', '2024-04-21 11:04:16', 'chirag', '$2y$10$7LJ/MM/dbyATWaAFTjeqXefC63N.0VAQ3y96KaVPG9wCNreqXflJ.'),
(8, 'Atish Bagad', 'Parola, Jalgaon', '9898878700', '2024-04-22 10:33:40', 'atish', '$2y$10$1HZTpNX2Z10QTbciVc6rse6DYIfc4cwLthbCtLtgUBbxt3qrUdbB2'),
(9, 'Harshali Deore', 'Umrane, Nashik', '9988776655', '2024-04-23 15:48:59', 'harshu', '$2y$10$Bwv4Mu.xL1Dd9nPxb9PcR.C2E.Z80v3siHnRv9SOqu4sWu3bWIcPC'),
(10, 'Pradosh Mandawade', 'Malegaon, Nashik', '7676898900', '2024-04-24 14:13:47', 'pradosh', '$2y$10$2vgCXqctd4fV.FuP88QDxufRbiZKQGDegUNvxYvBsCR9WPRS5Zt56');

-- --------------------------------------------------------

--
-- Table structure for table `expenditures`
--

CREATE TABLE `expenditures` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenditures`
--

INSERT INTO `expenditures` (`id`, `user_id`, `item_id`, `transaction_id`, `qty`, `created_at`) VALUES
(25, 1, 4, 57, 1, '2024-04-25 16:50:34'),
(26, 1, 5, 58, 1, '2024-04-25 16:53:36'),
(27, 1, 4, 61, 1, '2024-04-25 17:14:49'),
(29, 1, 6, 64, 1, '2024-04-25 17:28:20'),
(30, 1, 6, 65, 1, '2024-04-25 17:50:01'),
(31, 1, 4, 66, 1, '2024-04-25 17:55:23'),
(32, 1, 6, 63, 1, '2024-04-25 18:07:21'),
(33, 1, 6, 67, 1, '2024-04-25 18:09:19'),
(34, 1, 6, 68, 1, '2024-04-25 18:12:49'),
(35, 1, 5, 69, 1, '2024-04-25 18:17:49'),
(36, 1, 6, 74, 1, '2024-04-26 15:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `unit`, `stock`, `created_at`) VALUES
(4, 'Ariel Wash Powder', 'Pack', 2, '2024-04-25 16:29:45'),
(5, 'Tide Wash Powder', 'Pack', 2, '2024-04-25 16:30:40'),
(6, 'Classic Powder', 'Pack', 94, '2024-04-25 17:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

CREATE TABLE `laundry` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `kilo` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `comments` varchar(255) NOT NULL,
  `date0` datetime DEFAULT NULL,
  `date1` datetime DEFAULT NULL,
  `date2` datetime DEFAULT NULL,
  `date3` datetime DEFAULT NULL,
  `date4` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundry`
--

INSERT INTO `laundry` (`id`, `transaction_id`, `customer_id`, `kilo`, `type`, `status`, `comments`, `date0`, `date1`, `date2`, `date3`, `date4`, `created_at`) VALUES
(20, 38, 8, 1, 2, '1', 'None', '2024-04-24 18:53:50', NULL, NULL, NULL, NULL, '2024-04-22 17:24:57'),
(22, 39, 2, 4, 2, '3', 'Carefully Premium Clothes', '2024-04-24 18:53:34', '2024-04-24 18:54:29', '2024-04-25 10:37:46', NULL, NULL, '2024-04-23 11:10:53'),
(23, 40, 2, 5, 2, '1', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-23 11:17:39'),
(24, 41, 8, 1, 2, '2', 'Please Press After Laundry.', '2024-04-24 18:53:44', '2024-04-25 10:37:34', NULL, NULL, NULL, '2024-04-23 11:19:20'),
(25, 51, 9, 6, 2, '1', 'Do not use warm water', '2024-04-25 10:37:41', NULL, NULL, NULL, NULL, '2024-04-25 10:35:42'),
(26, 53, 7, 1, 2, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:04:59'),
(27, 54, 7, 2, 3, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:09:14'),
(28, 55, 10, 1, 2, '0', 'Use Easy Liquid', NULL, NULL, NULL, NULL, NULL, '2024-04-25 11:12:10'),
(31, 57, 7, 1, 2, '0', 'Do not wash with warm water.', NULL, NULL, NULL, NULL, NULL, '2024-04-25 16:50:41'),
(32, 58, 10, 1, 3, '0', 'Use warm water.', NULL, NULL, NULL, NULL, NULL, '2024-04-25 16:53:42'),
(33, 61, 2, 1, 2, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:14:57'),
(34, 64, 2, 1, 2, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:28:38'),
(35, 65, 2, 1, 2, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:50:09'),
(36, 66, 2, 1, 3, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:55:30'),
(37, 63, 8, 1, 3, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 18:07:28'),
(38, 67, 8, 1, 3, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 18:09:38'),
(39, 68, 8, 1, 3, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-25 18:13:01'),
(40, 69, 9, 2, 2, '0', 'Use Gutter Water', NULL, NULL, NULL, NULL, NULL, '2024-04-25 18:17:59'),
(41, 74, 10, 1, 3, '0', 'None', NULL, NULL, NULL, NULL, NULL, '2024-04-26 15:18:56');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `logs` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `logs`, `type`, `created_at`) VALUES
(1, 1, 'admin| Logged in', 'Login', '2024-03-28 19:17:52'),
(2, 1, 'YASH JAIN| New Customer was added', 'Adding Customer', '2024-03-28 19:19:22'),
(3, 1, 'New Transaction was added', 'Adding Transaction', '2024-03-28 19:19:34'),
(4, 1, 'Transaction 1 cancelled successfully!', 'Transaction Cancel', '2024-03-28 19:21:15'),
(5, 1, 'atish| New Staff was added', 'Adding Staff', '2024-03-28 19:22:20'),
(6, 1, 'New Transaction was added', 'Adding Transaction', '2024-03-28 19:22:36'),
(7, 1, 'adminUser has logged out', 'Logout', '2024-03-28 19:23:04'),
(11, 1, 'admin| Logged in', 'Login', '2024-03-28 19:23:51'),
(12, 1, 'shirt| New Item was added', 'Adding Item', '2024-03-28 19:24:18'),
(13, 1, 'pant| New Item was added', 'Adding Item', '2024-03-28 19:24:29'),
(14, 1, '5 Stock was added', 'Stock In', '2024-03-28 19:24:38'),
(15, 1, 'Adding Expenditures', 'Added item to transaction', '2024-03-28 19:24:52'),
(16, 1, 'kurta| New Item was added', 'Adding Item', '2024-03-28 19:27:08'),
(17, 1, 'admin| Logged in', 'Login', '2024-03-29 11:34:32'),
(18, 1, 'adminUser has logged out', 'Logout', '2024-03-29 11:39:18'),
(21, 1, 'admin| Logged in', 'Login', '2024-03-29 11:48:23'),
(22, 1, '1| was added', 'Adding Laundry', '2024-03-29 11:48:40'),
(23, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-03-29 11:48:51'),
(24, 1, 'New Transaction was added', 'Adding Transaction', '2024-03-29 11:49:17'),
(25, 1, 'Adding Expenditures', 'Added item to transaction', '2024-03-29 11:49:28'),
(26, 1, '1| was added', 'Adding Laundry', '2024-03-29 11:49:40'),
(27, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-03-29 11:49:47'),
(28, 1, '5| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-03-29 11:50:25'),
(29, 1, '4| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-03-29 11:50:31'),
(30, 1, 'Transaction 3 cancelled successfully!', 'Transaction Cancel', '2024-03-29 11:50:36'),
(31, 1, '5| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-03-29 11:50:59'),
(32, 1, '4| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-03-29 11:51:27'),
(33, 1, 'adminUser has logged out', 'Logout', '2024-03-29 11:52:30'),
(34, 1, 'admin| Logged in', 'Login', '2024-03-29 11:52:38'),
(35, 1, 'New Transaction was added', 'Adding Transaction', '2024-03-29 11:53:44'),
(36, 1, 'Adding Expenditures', 'Added item to transaction', '2024-03-29 11:53:53'),
(37, 1, '1| was added', 'Adding Laundry', '2024-03-29 11:54:01'),
(38, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-03-29 11:54:06'),
(39, 1, '6| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-03-29 11:54:37'),
(40, 1, '6| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-03-29 11:54:42'),
(41, 1, '4| Transaction was updated to Folding by admin.', 'Update Transaction', '2024-03-29 11:54:47'),
(42, 1, '4| Transaction was updated to Ready for Pickup by admin.', 'Update Transaction', '2024-03-29 11:55:05'),
(43, 1, 'admin| Logged in', 'Login', '2024-04-01 14:37:33'),
(44, 1, 'adminUser has logged out', 'Logout', '2024-04-01 14:38:59'),
(54, 1, 'admin| Logged in', 'Login', '2024-04-01 14:43:00'),
(55, 1, '6| Transaction was updated to Order Claimed by admin.', 'Update Transaction', '2024-04-01 14:46:06'),
(56, 1, 'Atul| New Staff was added', 'Adding Staff', '2024-04-01 14:46:40'),
(57, 1, 'pant| New Price was added', 'Adding Price', '2024-04-01 14:57:37'),
(58, 1, '1| Price was removed', 'Removing Price', '2024-04-01 14:57:47'),
(59, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-01 14:57:56'),
(60, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-01 14:58:07'),
(61, 1, '2| was added', 'Adding Laundry', '2024-04-01 14:58:18'),
(62, 1, '5| Item was removed', 'Removing Expenditures', '2024-04-01 14:58:27'),
(63, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-01 14:58:35'),
(64, 1, '6| Item was removed', 'Removing Expenditures', '2024-04-01 14:58:53'),
(65, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-01 14:59:15'),
(66, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-04-01 14:59:22'),
(67, 1, 'adminUser has logged out', 'Logout', '2024-04-01 14:59:53'),
(68, 1, 'admin| Logged in', 'Login', '2024-04-01 22:01:34'),
(69, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-01 22:01:57'),
(70, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-01 22:02:06'),
(71, 1, '2| was added', 'Adding Laundry', '2024-04-01 22:02:19'),
(72, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-04-01 22:02:25'),
(73, 1, '10| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-04-01 22:02:46'),
(74, 1, '10| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-04-01 22:02:51'),
(75, 1, 'adminUser has logged out', 'Logout', '2024-04-01 22:09:04'),
(83, 1, 'admin| Logged in', 'Login', '2024-04-13 10:22:32'),
(84, 1, 'adminUser has logged out', 'Logout', '2024-04-13 10:23:58'),
(85, 1, 'admin| Logged in', 'Login', '2024-04-13 10:24:33'),
(86, 1, 'adminUser has logged out', 'Logout', '2024-04-13 10:25:37'),
(87, 1, 'admin| Logged in', 'Login', '2024-04-20 10:17:10'),
(88, 1, 'adminUser has logged out', 'Logout', '2024-04-20 10:19:13'),
(89, 1, 'admin| Logged in', 'Login', '2024-04-21 09:38:30'),
(90, 1, 'admin| Logged in', 'Login', '2024-04-21 09:48:58'),
(108, NULL, 'Atish Bagad| New Customer was added', 'Adding Customer', '2024-04-22 10:33:40'),
(131, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-22 16:25:08'),
(132, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-22 16:44:02'),
(133, 1, '2| was added', 'Adding Laundry', '2024-04-22 16:47:23'),
(134, 1, '2| was added', 'Adding Laundry', '2024-04-22 16:52:12'),
(135, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-22 16:53:20'),
(136, 1, '2| was added', 'Adding Laundry', '2024-04-22 16:58:43'),
(137, 1, '2| was added', 'Adding Laundry', '2024-04-22 17:04:27'),
(138, 1, '15| Laundry was removed', 'Removing Laundry', '2024-04-22 17:10:56'),
(139, 1, '2| was added', 'Adding Laundry', '2024-04-22 17:11:05'),
(140, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-22 17:13:36'),
(141, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-22 17:13:47'),
(142, 1, '2| was added', 'Adding Laundry', '2024-04-22 17:13:55'),
(143, 1, 'Transaction 36 cancelled successfully!', 'Transaction Cancel', '2024-04-22 17:16:50'),
(144, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-22 17:18:52'),
(145, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-22 17:18:59'),
(146, 1, '2| was added', 'Adding Laundry', '2024-04-22 17:19:08'),
(147, 1, '8 added a new pending transaction', 'New Pending Transaction', '2024-04-22 17:23:04'),
(148, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-22 17:24:42'),
(149, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-22 17:24:49'),
(150, 1, '2| was added', 'Adding Laundry', '2024-04-22 17:24:57'),
(151, 1, '8 added a new pending transaction', 'New Pending Transaction', '2024-04-22 17:25:03'),
(152, 1, 'yashUser has logged out', 'Logout', '2024-04-23 11:08:49'),
(153, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-23 11:10:11'),
(154, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-23 11:10:21'),
(155, 1, '2| was added', 'Adding Laundry', '2024-04-23 11:10:30'),
(156, 1, '21| Laundry was removed', 'Removing Laundry', '2024-04-23 11:10:43'),
(157, 1, '2| was added', 'Adding Laundry', '2024-04-23 11:10:53'),
(158, 1, '2 added a new pending transaction', 'New Pending Transaction', '2024-04-23 11:11:05'),
(159, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-23 11:17:20'),
(160, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-23 11:17:28'),
(161, 1, '2| was added', 'Adding Laundry', '2024-04-23 11:17:39'),
(162, 1, '2 added a new pending transaction', 'New Pending Transaction', '2024-04-23 11:17:45'),
(163, 1, 'yashUser has logged out', 'Logout', '2024-04-23 11:18:46'),
(164, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-23 11:19:01'),
(165, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-23 11:19:07'),
(166, 1, '2| was added', 'Adding Laundry', '2024-04-23 11:19:20'),
(167, 1, '8 added a new pending transaction', 'New Pending Transaction', '2024-04-23 11:19:27'),
(168, 1, 'atishUser has logged out', 'Logout', '2024-04-23 14:49:12'),
(169, 1, 'Harshali Deore| New Customer was added', 'Adding Customer', '2024-04-23 15:48:59'),
(170, 1, 'harshuUser has logged out', 'Logout', '2024-04-23 15:49:45'),
(171, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-23 16:07:58'),
(172, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-23 16:09:35'),
(173, 1, 'Transaction 43 cancelled successfully!', 'Transaction Cancel', '2024-04-23 16:10:32'),
(174, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-23 16:23:04'),
(175, 1, 'Transaction 44 cancelled successfully!', 'Transaction Cancel', '2024-04-23 16:23:27'),
(176, 1, 'yashUser has logged out', 'Logout', '2024-04-24 14:12:02'),
(177, 1, 'Pradosh Mandawade| New Customer was added', 'Adding Customer', '2024-04-24 14:13:47'),
(178, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-24 14:14:18'),
(179, 1, 'Transaction 45 cancelled successfully!', 'Transaction Cancel', '2024-04-24 14:14:28'),
(180, 1, 'pradoshUser has logged out', 'Logout', '2024-04-24 14:14:53'),
(181, 1, 'yashUser has logged out', 'Logout', '2024-04-24 18:42:40'),
(182, 1, 'admin| Logged in', 'Login', '2024-04-24 18:46:10'),
(183, 1, '22| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-04-24 18:53:34'),
(184, 1, '24| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-04-24 18:53:44'),
(185, 1, '20| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-04-24 18:53:50'),
(186, 1, '22| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-04-24 18:54:29'),
(187, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-24 19:02:15'),
(188, 1, 'Transaction 46 cancelled successfully!', 'Transaction Cancel', '2024-04-24 19:02:34'),
(189, 1, 'ABC XYZ| New Customer was added', 'Adding Customer', '2024-04-24 19:22:48'),
(190, 1, '11| Customer was removed', 'Removing Customer', '2024-04-24 19:22:56'),
(191, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-24 20:02:44'),
(192, 1, 'Transaction 47 cancelled successfully!', 'Transaction Cancel', '2024-04-24 20:03:56'),
(193, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-24 20:04:11'),
(194, 1, 'Transaction 48 cancelled successfully!', 'Transaction Cancel', '2024-04-24 22:54:52'),
(195, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-24 22:55:00'),
(196, 1, 'Transaction 49 cancelled successfully!', 'Transaction Cancel', '2024-04-24 22:56:53'),
(197, 1, 'New Order was added', 'Adding Order', '2024-04-24 22:57:00'),
(198, 1, 'Transaction 50 cancelled successfully!', 'Transaction Cancel', '2024-04-24 22:57:06'),
(199, 1, 'admin| Logged in', 'Login', '2024-04-25 10:10:43'),
(200, 1, 'New Order was added', 'Adding Order', '2024-04-25 10:29:23'),
(201, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 10:35:30'),
(202, 1, '2| was added', 'Adding Laundry', '2024-04-25 10:35:42'),
(203, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 10:35:54'),
(204, 1, '24| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-04-25 10:37:34'),
(205, 1, '25| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-04-25 10:37:41'),
(206, 1, '22| Transaction was updated to Folding by admin.', 'Update Transaction', '2024-04-25 10:37:46'),
(207, 1, 'SHIRT| New Price was added', 'Adding Price', '2024-04-25 10:39:05'),
(208, 1, 'PANT| Price was updated', 'Updating Price', '2024-04-25 10:39:22'),
(209, 1, 'adminUser has logged out', 'Logout', '2024-04-25 10:50:42'),
(210, 1, 'harshuUser has logged out', 'Logout', '2024-04-25 11:03:49'),
(211, 1, 'admin| Logged in', 'Login', '2024-04-25 11:04:12'),
(212, 1, 'New Order was added', 'Adding Order', '2024-04-25 11:04:23'),
(213, 1, 'Transaction 52 cancelled successfully!', 'Transaction Cancel', '2024-04-25 11:04:34'),
(214, 1, 'New Order was added', 'Adding Order', '2024-04-25 11:04:42'),
(215, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 11:04:49'),
(216, 1, '2| was added', 'Adding Laundry', '2024-04-25 11:04:59'),
(217, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 11:07:27'),
(218, 1, 'New Order was added', 'Adding Order', '2024-04-25 11:08:35'),
(219, 1, '1 Stock was added', 'Stock In', '2024-04-25 11:08:57'),
(220, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 11:09:05'),
(221, 1, '3| was added', 'Adding Laundry', '2024-04-25 11:09:14'),
(222, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 11:10:31'),
(223, 1, 'New Order was added', 'Adding Order', '2024-04-25 11:11:29'),
(224, 1, '4 Stock was added', 'Stock In', '2024-04-25 11:11:47'),
(225, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 11:11:58'),
(226, 1, '2| was added', 'Adding Laundry', '2024-04-25 11:12:10'),
(227, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 11:12:16'),
(228, 1, 'adminUser has logged out', 'Logout', '2024-04-25 11:12:27'),
(229, 1, 'pradoshUser has logged out', 'Logout', '2024-04-25 11:13:12'),
(230, 1, 'admin| Logged in', 'Login', '2024-04-25 11:13:26'),
(231, 1, '2| Staff was removed', 'Removing Staff', '2024-04-25 11:14:00'),
(232, 1, '3| Staff was removed', 'Removing Staff', '2024-04-25 11:14:06'),
(233, 1, 'VEDANT| New Staff was added', 'Adding Staff', '2024-04-25 11:14:31'),
(234, 1, 'adminUser has logged out', 'Logout', '2024-04-25 11:16:31'),
(237, 1, 'admin| Logged in', 'Login', '2024-04-25 11:18:22'),
(238, 1, '4| Staff was removed', 'Removing Staff', '2024-04-25 11:19:03'),
(239, 1, 'vedant| New Staff was added', 'Adding Staff', '2024-04-25 11:19:26'),
(240, 1, 'yashUser has logged out', 'Logout', '2024-04-25 16:27:55'),
(241, 5, 'vedant| Logged in', 'Login', '2024-04-25 16:28:22'),
(242, 5, 'vedantUser has logged out', 'Logout', '2024-04-25 16:28:37'),
(243, 1, 'admin| Logged in', 'Login', '2024-04-25 16:28:44'),
(244, 1, '1| Item was removed', 'Removing Supply', '2024-04-25 16:28:54'),
(245, 1, '2| Item was removed', 'Removing Supply', '2024-04-25 16:29:00'),
(246, 1, '3| Item was removed', 'Removing Supply', '2024-04-25 16:29:05'),
(247, 1, 'Ariel Wash Powder| New Item was added', 'Adding Item', '2024-04-25 16:29:45'),
(248, 1, 'Ariel Wash Powder| Item was updated', 'Updating Item', '2024-04-25 16:29:59'),
(249, 1, 'Tide Wash Powder| New Item was added', 'Adding Item', '2024-04-25 16:30:40'),
(250, 1, 'New Order was added', 'Adding Order', '2024-04-25 16:30:56'),
(251, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 16:39:42'),
(252, 1, '2| was added', 'Adding Laundry', '2024-04-25 16:39:54'),
(253, 1, '3| was added', 'Adding Laundry', '2024-04-25 16:40:09'),
(254, 1, 'Transaction 56 cancelled successfully!', 'Transaction Cancel', '2024-04-25 16:49:44'),
(255, 1, 'New Order was added', 'Adding Order', '2024-04-25 16:50:11'),
(256, 1, 'Adding Expenditures', 'Added item to order', '2024-04-25 16:50:34'),
(257, 1, '2| was added', 'Adding Laundry', '2024-04-25 16:50:41'),
(258, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 16:50:47'),
(259, 1, 'New Order was added', 'Adding Order', '2024-04-25 16:53:12'),
(260, 1, 'Adding Expenditures', 'Added item to order', '2024-04-25 16:53:36'),
(261, 1, '3| was added', 'Adding Laundry', '2024-04-25 16:53:42'),
(262, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 16:53:47'),
(263, 1, 'admin| Logged in', 'Login', '2024-04-25 16:59:50'),
(264, 1, 'New Order was added', 'Adding Order', '2024-04-25 17:04:19'),
(265, 1, 'Transaction 59 cancelled successfully!', 'Transaction Cancel', '2024-04-25 17:04:30'),
(266, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:14:18'),
(267, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:14:34'),
(268, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 17:14:49'),
(269, 1, '2| was added', 'Adding Laundry', '2024-04-25 17:14:57'),
(270, 1, '2 added a new pending transaction', 'New Pending Transaction', '2024-04-25 17:15:04'),
(271, 1, 'yashUser has logged out', 'Logout', '2024-04-25 17:19:24'),
(272, 1, 'admin| Logged in', 'Login', '2024-04-25 17:19:37'),
(273, 1, 'adminUser has logged out', 'Logout', '2024-04-25 17:20:04'),
(274, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:21:25'),
(275, 1, 'Transaction 62 cancelled successfully!', 'Transaction Cancel', '2024-04-25 17:21:50'),
(276, 1, 'yashUser has logged out', 'Logout', '2024-04-25 17:21:57'),
(277, 1, 'admin| Logged in', 'Login', '2024-04-25 17:22:18'),
(278, 1, 'Classic| New Item was added', 'Adding Item', '2024-04-25 17:22:49'),
(279, 1, 'Classic Powder| Item was updated', 'Updating Item', '2024-04-25 17:23:04'),
(280, 1, 'Classic Powder| Item was updated', 'Updating Item', '2024-04-25 17:23:19'),
(281, 1, 'Transaction 60 cancelled successfully!', 'Transaction Cancel', '2024-04-25 17:23:34'),
(282, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:27:50'),
(283, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:27:59'),
(284, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 17:28:05'),
(285, 1, '28| Item was removed', 'Removing Expenditures', '2024-04-25 17:28:12'),
(286, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 17:28:20'),
(287, 1, '2| was added', 'Adding Laundry', '2024-04-25 17:28:39'),
(288, 1, '2 added a new pending transaction', 'New Pending Transaction', '2024-04-25 17:48:54'),
(289, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:49:48'),
(290, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 17:50:01'),
(291, 1, '2| was added', 'Adding Laundry', '2024-04-25 17:50:09'),
(292, 1, '2 added a new pending transaction', 'New Pending Transaction', '2024-04-25 17:50:21'),
(293, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 17:55:17'),
(294, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 17:55:23'),
(295, 1, '3| was added', 'Adding Laundry', '2024-04-25 17:55:30'),
(296, 1, '2 added a new pending order', 'New Pending Order', '2024-04-25 17:55:36'),
(297, 1, 'admin| Logged in', 'Login', '2024-04-25 17:58:06'),
(298, 1, 'adminUser has logged out', 'Logout', '2024-04-25 17:58:39'),
(299, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 18:07:21'),
(300, 1, '3| was added', 'Adding Laundry', '2024-04-25 18:07:28'),
(301, 1, '8 added a new pending order', 'New Pending Order', '2024-04-25 18:07:35'),
(302, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-25 18:09:11'),
(303, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-25 18:09:19'),
(304, 1, '3| was added', 'Adding Laundry', '2024-04-25 18:09:38'),
(305, 1, '8 added a new pending order', 'New Pending Order', '2024-04-25 18:09:45'),
(306, 1, 'admin| Logged in', 'Login', '2024-04-25 18:10:44'),
(307, 1, 'New Order was added', 'Adding Order', '2024-04-25 18:10:56'),
(308, 1, 'Adding Expenditures', 'Added item to order', '2024-04-25 18:12:49'),
(309, 1, '3| was added', 'Adding Laundry', '2024-04-25 18:13:01'),
(310, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 18:13:14'),
(311, 1, 'New Order was added', 'Adding Order', '2024-04-25 18:17:33'),
(312, 1, 'Adding Expenditures', 'Added item to order', '2024-04-25 18:17:49'),
(313, 1, '2| was added', 'Adding Laundry', '2024-04-25 18:17:59'),
(314, 1, '1 added a new pending order', 'New Pending Order', '2024-04-25 18:18:04'),
(315, 1, 'yashUser has logged out', 'Logout', '2024-04-25 18:21:42'),
(316, 1, 'admin| Logged in', 'Login', '2024-04-25 18:21:53'),
(317, 1, 'atishUser has logged out', 'Logout', '2024-04-25 18:24:27'),
(318, 1, 'yashUser has logged out', 'Logout', '2024-04-25 18:25:35'),
(319, 1, 'admin| Logged in', 'Login', '2024-04-25 18:26:00'),
(320, 1, 'adminUser has logged out', 'Logout', '2024-04-25 18:26:03'),
(321, 1, 'admin| Logged in', 'Login', '2024-04-25 18:26:23'),
(322, 1, 'adminUser has logged out', 'Logout', '2024-04-25 18:26:25'),
(323, 5, 'vedant| Logged in', 'Login', '2024-04-25 18:26:53'),
(324, 5, 'vedantUser has logged out', 'Logout', '2024-04-25 18:26:57'),
(325, 1, 'admin| Logged in', 'Login', '2024-04-25 18:27:40'),
(326, 1, 'adminUser has logged out', 'Logout', '2024-04-25 18:27:43'),
(327, 1, 'admin| Logged in', 'Login', '2024-04-25 18:28:05'),
(328, 1, 'adminUser has logged out', 'Logout', '2024-04-25 18:28:07'),
(329, 1, 'admin| Logged in', 'Login', '2024-04-25 18:28:38'),
(330, 1, 'adminUser has logged out', 'Logout', '2024-04-25 18:28:41'),
(331, 1, 'admin| Logged in', 'Login', '2024-04-25 18:28:57'),
(332, 1, 'adminUser has logged out', 'Logout', '2024-04-25 18:28:59'),
(333, 1, 'yashUser has logged out', 'Logout', '2024-04-26 10:58:51'),
(334, 1, 'yashUser has logged out', 'Logout', '2024-04-26 14:18:59'),
(335, 1, 'yashUser has logged out', 'Logout', '2024-04-26 14:30:53'),
(336, 1, 'yashUser has logged out', 'Logout', '2024-04-26 14:33:29'),
(337, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-26 14:41:21'),
(338, 1, 'Transaction 70 cancelled successfully!', 'Transaction Cancel', '2024-04-26 14:41:50'),
(339, 1, 'yashUser has logged out', 'Logout', '2024-04-26 14:43:44'),
(340, 1, 'admin| Logged in', 'Login', '2024-04-26 14:44:19'),
(341, 1, 'adminUser has logged out', 'Logout', '2024-04-26 14:46:24'),
(342, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-26 14:46:50'),
(343, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-26 14:46:59'),
(344, 1, 'Transaction 72 cancelled successfully!', 'Transaction Cancel', '2024-04-26 14:54:49'),
(345, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-26 14:55:38'),
(346, 1, 'Transaction 73 cancelled successfully!', 'Transaction Cancel', '2024-04-26 14:58:28'),
(347, 1, 'yashUser has logged out', 'Logout', '2024-04-26 15:04:51'),
(348, 1, 'admin| Logged in', 'Login', '2024-04-26 15:05:14'),
(349, 1, 'Transaction 71 cancelled successfully!', 'Transaction Cancel', '2024-04-26 15:07:46'),
(350, 1, 'adminUser has logged out', 'Logout', '2024-04-26 15:07:52'),
(351, 1, 'yashUser has logged out', 'Logout', '2024-04-26 15:16:44'),
(352, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-26 15:18:38'),
(353, 1, 'Adding Expenditures', 'Added item to transaction', '2024-04-26 15:18:48'),
(354, 1, '3| was added', 'Adding Laundry', '2024-04-26 15:18:56'),
(355, 1, '10 added a new pending order', 'New Pending Order', '2024-04-26 15:19:35'),
(356, 1, 'New Transaction was added', 'Adding Transaction', '2024-04-26 15:20:47'),
(357, 1, 'Transaction 75 cancelled successfully!', 'Transaction Cancel', '2024-04-26 15:22:03'),
(358, 1, 'pradoshUser has logged out', 'Logout', '2024-04-26 15:22:08');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `name`, `unit`, `price`, `created_at`) VALUES
(2, 'PANT', 'Unit', 21.00, '2024-04-01 14:57:37'),
(3, 'SHIRT', 'Unit', 30.00, '2024-04-25 10:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `customer_id`, `total`, `amount`, `status`, `created_at`) VALUES
(38, 1, 8, 7.00, 7.00, 'completed', '2024-04-22 17:24:42'),
(39, 1, 2, 28.00, 28.00, 'completed', '2024-04-23 11:10:11'),
(40, 1, 2, 35.00, 35.00, 'completed', '2024-04-23 11:17:20'),
(41, 1, 8, 7.00, 7.00, 'completed', '2024-04-23 11:19:01'),
(51, 1, 9, 42.00, 42.00, 'completed', '2024-04-25 10:29:23'),
(53, 1, 7, 21.00, 21.00, 'completed', '2024-04-25 11:04:42'),
(54, 1, 7, 60.00, 60.00, 'completed', '2024-04-25 11:08:35'),
(55, 1, 10, 21.00, 21.00, 'completed', '2024-04-25 11:11:29'),
(57, 1, 7, 21.00, 21.00, 'completed', '2024-04-25 16:50:11'),
(58, 1, 10, 30.00, 30.00, 'completed', '2024-04-25 16:53:12'),
(61, 1, 2, 21.00, 21.00, 'completed', '2024-04-25 17:14:34'),
(63, 1, 8, 35.40, 30.00, 'completed', '2024-04-25 17:27:50'),
(64, 1, 2, 24.78, 21.00, 'completed', '2024-04-25 17:27:59'),
(65, 1, 2, 24.78, 21.00, 'completed', '2024-04-25 17:49:48'),
(66, 1, 2, 35.40, 30.00, 'completed', '2024-04-25 17:55:16'),
(67, 1, 8, 35.40, 30.00, 'completed', '2024-04-25 18:09:11'),
(68, 1, 8, 30.00, 30.00, 'completed', '2024-04-25 18:10:56'),
(69, 1, 9, 49.56, 42.00, 'completed', '2024-04-25 18:17:33'),
(74, 1, 10, 35.40, 30.00, 'completed', '2024-04-26 15:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`, `created_at`) VALUES
(1, 'admin', '$2y$10$WgL2d2fzi6IiGiTfXvdBluTLlMroU8zBtIcRut7SzOB6j9i/LbA4K', '0', '2024-03-28 19:15:18'),
(5, 'vedant', '$2y$10$YgzzX8ISYZBftmjkq0./ru.jz6uApWI.TyqEsPEoat6v6.2YTVKIq', '1', '2024-04-25 11:19:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `expenditures`
--
ALTER TABLE `expenditures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laundry`
--
ALTER TABLE `laundry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD CONSTRAINT `expenditures_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenditures_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenditures_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundry_ibfk_2` FOREIGN KEY (`type`) REFERENCES `prices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
