-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2016 at 03:32 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beii`
--

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE `customerorder` (
  `ID` int(255) NOT NULL,
  `Product` varchar(50) NOT NULL,
  `Quantity` int(255) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `Order_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerorder`
--

INSERT INTO `customerorder` (`ID`, `Product`, `Quantity`, `Price`, `Order_ID`) VALUES
(1, '2 in 1 Wood Plaque', 31, '4800.00', 1),
(1, 'Hand Shape Wood with Frosted Glass', 30, '3200.00', 2),
(2, '2 in 1 Wood Plaque', 30, '4800.00', 3),
(3, '2 in 1 Wood Plaque', 30, '4800.00', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
