-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2016 at 03:31 PM
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
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `EmailAdd` varchar(100) NOT NULL,
  `Facebook` varchar(200) NOT NULL,
  `Contact_Smart` varchar(12) NOT NULL,
  `Contact_Globe` varchar(12) NOT NULL,
  `Contact_Tel` varchar(11) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `CName` varchar(200) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Map` varchar(1000) NOT NULL,
  `ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`EmailAdd`, `Facebook`, `Contact_Smart`, `Contact_Globe`, `Contact_Tel`, `Address`, `CName`, `Fname`, `LName`, `Map`, `ID`) VALUES
('BluExpress@Beii.com', 'https://www.facebook.com/AwardExpressPH/', '09123456789', '09987654321', '834 6807', 'Unit G 5/F Westgate Tower Madrigal Business Park, Ayala Alabang\r\nMuntinlupa City\r\nHighlights info row image\r\n834 6807', 'BluExpress', 'Monaliza', 'SampleLastName', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3864.9103934558734!2d120.97861291402299!3d14.374596286430833!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d3e493d412d3%3A0xfc11adf996131246!2sBlu+Express+Industries+Inc.!5e0!3m2!1sen!2sph!4v1481680420772" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
