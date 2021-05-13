-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 04:24 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gadgetbadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer1`
--

CREATE TABLE `buyer1` (
  `bID` int(11) NOT NULL,
  `bName` varchar(255) NOT NULL,
  `bAddress` varchar(255) NOT NULL,
  `bEmail` varchar(255) NOT NULL,
  `bDate` varchar(255) NOT NULL,
  `pNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer1`
--

INSERT INTO `buyer1` (`bID`, `bName`, `bAddress`, `bEmail`, `bDate`, `pNo`) VALUES
(41, 'Samantha Perera', 'Colombo Road, Kurunegala', 'samanthaperera@gmail.com', '20-01-2021', '0761234567'),
(42, 'Kamal Sirisena', 'Kandy Road, Colombo', 'kamalsirisena@gmail.com', '14-03-2021', '0767654321'),
(43, 'Suneth Yapa', 'Kaduwela Road, Malabe', 'sunethyapa@gmail.com', '22-01-2021', '0785836495'),
(44, 'Nilan Dammika', 'Dambulla Road, Anuradhapura', 'nilandammika@gmail.com', '02-03-2021', '0751249658'),
(45, 'Uthpala Wijekoon', 'Kurunegala Road, Gampaha', 'uthpalawijekoon@gmail.com', '30-04-2021', '0775314967'),
(46, 'Nayomi Perera', 'Baththaramulla, Colombo', 'nayomiperera@gmail.com', '16-05-2021', '0743218965');

-- --------------------------------------------------------

--
-- Table structure for table `investor`
--

CREATE TABLE `investor` (
  `fid` int(11) NOT NULL,
  `ftype` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fsource` varchar(20) CHARACTER SET latin1 NOT NULL,
  `famount` float NOT NULL,
  `fdate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pay1`
--

CREATE TABLE `pay1` (
  `pyId` int(11) NOT NULL,
  `pyDes` varchar(20) NOT NULL,
  `pyDate` varchar(20) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

CREATE TABLE `product1` (
  `pId` int(11) NOT NULL,
  `pName` varchar(50) NOT NULL,
  `pDate` varchar(20) NOT NULL,
  `pPrice` varchar(20) NOT NULL,
  `pDes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE `research` (
  `rId` int(11) NOT NULL,
  `rName` varchar(20) NOT NULL,
  `pName` varchar(200) NOT NULL,
  `rDate` varchar(20) NOT NULL,
  `rDes` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer1`
--
ALTER TABLE `buyer1`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `investor`
--
ALTER TABLE `investor`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `pay1`
--
ALTER TABLE `pay1`
  ADD PRIMARY KEY (`pyId`);

--
-- Indexes for table `product1`
--
ALTER TABLE `product1`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `research`
--
ALTER TABLE `research`
  ADD PRIMARY KEY (`rId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer1`
--
ALTER TABLE `buyer1`
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `investor`
--
ALTER TABLE `investor`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pay1`
--
ALTER TABLE `pay1`
  MODIFY `pyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product1`
--
ALTER TABLE `product1`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `research`
--
ALTER TABLE `research`
  MODIFY `rId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
