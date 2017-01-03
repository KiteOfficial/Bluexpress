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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Contact` varchar(12) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ID` bigint(20) NOT NULL,
  `Total_Price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`FirstName`, `LastName`, `Contact`, `Email`, `ID`, `Total_Price`) VALUES
('Joenel', 'Cardinal', '123', '123@123', 1, '96000.00'),
('joenel', 'cardinal', '123213', 'joeneltgs@yahoo.com', 2, '144000.00'),
('asda', 'asd', '123', 'asdasd@yahasdas', 3, '144000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
