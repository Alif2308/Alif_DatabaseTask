-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2024 at 09:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddltrain`
--

-- --------------------------------------------------------

--
-- Table structure for table `piclist`
--

CREATE TABLE `piclist` (
  `TableNumber` int(11) NOT NULL,
  `TablePIC` varchar(75) DEFAULT NULL,
  `ChairNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specification`
--

CREATE TABLE `specification` (
  `TableID` char(36) NOT NULL DEFAULT uuid(),
  `TableNumber` int(11) DEFAULT NULL,
  `ChairNumber` int(11) DEFAULT NULL,
  `TablePIC` varchar(75) NOT NULL,
  `TableType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`TableID`, `TableNumber`, `ChairNumber`, `TablePIC`, `TableType`) VALUES
('3418ba9c-5f7d-11ef-bc78-9828a636baef', 1, 1, 'Doni', 'Luxury'),
('3418dbe7-5f7d-11ef-bc78-9828a636baef', 1, 2, 'Doni', 'Luxury'),
('90142e95-5f7d-11ef-bc78-9828a636baef', 2, 1, 'Doni', 'VIP'),
('90143be5-5f7d-11ef-bc78-9828a636baef', 2, 2, 'Haidar', 'VIP');

-- --------------------------------------------------------

--
-- Table structure for table `tabledetail`
--

CREATE TABLE `tabledetail` (
  `TableType` varchar(50) NOT NULL,
  `Faclities` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabledetail`
--

INSERT INTO `tabledetail` (`TableType`, `Faclities`) VALUES
('Luxury', '2 Chair'),
('VIP', '4 Chair');

-- --------------------------------------------------------

--
-- Table structure for table `tableorder`
--

CREATE TABLE `tableorder` (
  `TableOrderID` int(11) NOT NULL,
  `TableID` char(36) DEFAULT NULL,
  `MenuName` varchar(75) NOT NULL,
  `QuantityOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tableorder`
--

INSERT INTO `tableorder` (`TableOrderID`, `TableID`, `MenuName`, `QuantityOrder`) VALUES
(1, '3418ba9c-5f7d-11ef-bc78-9828a636baef', 'Seafood fried Rice ', 1),
(2, '3418dbe7-5f7d-11ef-bc78-9828a636baef', 'Steak Medium Rare', 1),
(3, '90142e95-5f7d-11ef-bc78-9828a636baef', 'French Fries', 2),
(4, '90143be5-5f7d-11ef-bc78-9828a636baef', 'Pizza', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `piclist`
--
ALTER TABLE `piclist`
  ADD PRIMARY KEY (`TableNumber`);

--
-- Indexes for table `specification`
--
ALTER TABLE `specification`
  ADD PRIMARY KEY (`TableID`),
  ADD KEY `TableType` (`TableType`),
  ADD KEY `TableNumber` (`TableNumber`);

--
-- Indexes for table `tabledetail`
--
ALTER TABLE `tabledetail`
  ADD PRIMARY KEY (`TableType`);

--
-- Indexes for table `tableorder`
--
ALTER TABLE `tableorder`
  ADD PRIMARY KEY (`TableOrderID`),
  ADD UNIQUE KEY `TableID` (`TableID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tableorder`
--
ALTER TABLE `tableorder`
  MODIFY `TableOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `specification`
--
ALTER TABLE `specification`
  ADD CONSTRAINT `specification_ibfk_1` FOREIGN KEY (`TableType`) REFERENCES `tabledetail` (`TableType`);

--
-- Constraints for table `tableorder`
--
ALTER TABLE `tableorder`
  ADD CONSTRAINT `tableorder_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `specification` (`TableID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
