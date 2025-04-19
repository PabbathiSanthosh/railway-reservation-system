-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 12:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `TrainID` int(11) DEFAULT NULL,
  `ScheduleID` int(11) DEFAULT NULL,
  `BookingStatus` varchar(50) NOT NULL,
  `BookingDate` date NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `UserID`, `TrainID`, `ScheduleID`, `BookingStatus`, `BookingDate`, `TotalAmount`) VALUES
(6, 1, 1, 1, 'Confirmed', '2025-04-19', 500.00),
(7, 1, 1, 1, 'Confirmed', '2025-04-19', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `RouteID` int(11) NOT NULL,
  `SourceStationID` int(11) DEFAULT NULL,
  `DestinationStationID` int(11) DEFAULT NULL,
  `Distance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`RouteID`, `SourceStationID`, `DestinationStationID`, `Distance`) VALUES
(1, 1, 2, 150.00),
(2, 1, 2, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `ScheduleID` int(11) NOT NULL,
  `TrainID` int(11) DEFAULT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `DaysOfOperation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`ScheduleID`, `TrainID`, `DepartureTime`, `ArrivalTime`, `DaysOfOperation`) VALUES
(1, 1, '08:00:00', '12:00:00', 'Monday, Wednesday, Friday');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `SeatID` int(11) NOT NULL,
  `TrainID` int(11) DEFAULT NULL,
  `SeatNumber` varchar(10) NOT NULL,
  `ClassType` varchar(50) NOT NULL,
  `AvailabilityStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `StationID` int(11) NOT NULL,
  `StationName` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`StationID`, `StationName`, `Location`) VALUES
(1, 'Station A', 'Location A'),
(2, 'Station B', 'Location B');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `TrainID` int(11) NOT NULL,
  `TrainNumber` varchar(10) NOT NULL,
  `TrainName` varchar(255) DEFAULT NULL,
  `RouteID` int(11) DEFAULT NULL,
  `ScheduleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`TrainID`, `TrainNumber`, `TrainName`, `RouteID`, `ScheduleID`) VALUES
(1, 'EXP123', 'Express Train', 1, 1),
(2, 'EXP123', 'Express Train', 1, 1),
(3, 'EXP123', 'Express Train', 1, 1),
(4, 'EXP123', 'Express Train', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `PasswordHash`, `PhoneNumber`, `Address`, `CreatedAt`, `DateOfBirth`, `Gender`, `Status`) VALUES
(1, 'John Doe', 'johndoe@example.com', '', NULL, NULL, '2025-04-19 09:25:03', NULL, NULL, NULL),
(2, 'santhosh', 'santhosh@example.com', 'pass123', '9876543210', 'Kadapa, Andhra Pradesh', '2025-04-19 09:34:50', NULL, NULL, NULL),
(3, 'JohnDoe', 'johndoe@example.com', 'pass123', '1234567890', '123 Main St, Cityville, CA', '2025-04-19 09:54:37', NULL, NULL, NULL),
(4, 'JaneSmith', 'janesmith@example.com', 'pass123', '2345678901', '456 Oak St, Townsville, TX', '2025-04-19 09:54:37', NULL, NULL, NULL),
(5, 'RobertBrown', 'robertbrown@example.com', 'pass123', '3456789012', '789 Pine St, Villagetown, FL', '2025-04-19 09:54:37', NULL, NULL, NULL),
(6, 'EmilyDavis', 'emilydavis@example.com', 'pass123', '4567890123', '101 Maple St, Hamlet, NY', '2025-04-19 09:54:37', NULL, NULL, NULL),
(7, 'MichaelJohnson', 'michaeljohnson@example.com', 'pass123', '5678901234', '202 Birch St, Metropolis, IL', '2025-04-19 09:54:37', NULL, NULL, NULL),
(8, 'john_doe', 'john.doe@example.com', 'pass1234', '9876543211', 'Hyderabad, Telangana', '2025-04-19 09:55:04', NULL, NULL, NULL),
(9, 'jane_smith', 'jane.smith@example.com', 'pass5678', '9876543212', 'Chennai, Tamil Nadu', '2025-04-19 09:55:04', NULL, NULL, NULL),
(10, 'alice_jones', 'alice.jones@example.com', 'pass1122', '9876543213', 'Bangalore, Karnataka', '2025-04-19 09:55:04', NULL, NULL, NULL),
(11, 'bob_brown', 'bob.brown@example.com', 'pass9988', '9876543214', 'Mumbai, Maharashtra', '2025-04-19 09:55:04', NULL, NULL, NULL),
(12, 'carol_white', 'carol.white@example.com', 'pass4455', '9876543215', 'Delhi, NCR', '2025-04-19 09:55:04', NULL, NULL, NULL),
(13, 'john_doe', 'john.doe@example.com', 'hashedpassword123', '9876543211', 'Hyderabad, Telangana', '2025-04-19 09:57:13', '1990-05-15', 'Male', 'Active'),
(14, 'jane_smith', 'jane.smith@example.com', 'hashedpassword456', '9876543212', 'Bangalore, Karnataka', '2025-04-19 09:57:13', '1992-08-25', 'Female', 'Inactive'),
(15, 'mike_lee', 'mike.lee@example.com', 'hashedpassword789', '9876543213', 'Chennai, Tamil Nadu', '2025-04-19 09:57:13', '1988-11-03', 'Male', 'Active'),
(16, 'alice_brown', 'alice.brown@example.com', 'hashedpassword101', '9876543214', 'Mumbai, Maharashtra', '2025-04-19 09:57:13', '1995-01-22', 'Female', 'Active'),
(17, 'bob_white', 'bob.white@example.com', 'hashedpassword202', '9876543215', 'Delhi, India', '2025-04-19 09:57:13', '1994-12-30', 'Male', 'Inactive'),
(18, 'john_doe', 'john.doe@example.com', 'hashedpassword123', '9876543211', 'Hyderabad, Telangana', '2025-04-19 09:57:49', '1990-05-15', 'Male', 'Active'),
(19, 'jane_smith', 'jane.smith@example.com', 'hashedpassword456', '9876543212', 'Bangalore, Karnataka', '2025-04-19 09:57:49', '1992-08-25', 'Female', 'Inactive'),
(20, 'mike_lee', 'mike.lee@example.com', 'hashedpassword789', '9876543213', 'Chennai, Tamil Nadu', '2025-04-19 09:57:49', '1988-11-03', 'Male', 'Active'),
(21, 'alice_brown', 'alice.brown@example.com', 'hashedpassword101', '9876543214', 'Mumbai, Maharashtra', '2025-04-19 09:57:49', '1995-01-22', 'Female', 'Active'),
(22, 'bob_white', 'bob.white@example.com', 'hashedpassword202', '9876543215', 'Delhi, India', '2025-04-19 09:57:49', '1994-12-30', 'Male', 'Inactive'),
(23, 'john_doe', 'john.doe@example.com', 'hashedpassword123', '9876543211', 'Hyderabad, Telangana', '2025-04-19 09:58:41', '1990-05-15', 'Male', 'Active'),
(24, 'jane_smith', 'jane.smith@example.com', 'hashedpassword456', '9876543212', 'Bangalore, Karnataka', '2025-04-19 09:58:41', '1992-08-25', 'Female', 'Inactive'),
(25, 'mike_lee', 'mike.lee@example.com', 'hashedpassword789', '9876543213', 'Chennai, Tamil Nadu', '2025-04-19 09:58:41', '1988-11-03', 'Male', 'Active'),
(26, 'alice_brown', 'alice.brown@example.com', 'hashedpassword101', '9876543214', 'Mumbai, Maharashtra', '2025-04-19 09:58:41', '1995-01-22', 'Female', 'Active'),
(27, 'bob_white', 'bob.white@example.com', 'hashedpassword202', '9876543215', 'Delhi, India', '2025-04-19 09:58:41', '1994-12-30', 'Male', 'Inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TrainID` (`TrainID`),
  ADD KEY `ScheduleID` (`ScheduleID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`RouteID`),
  ADD KEY `SourceStationID` (`SourceStationID`),
  ADD KEY `DestinationStationID` (`DestinationStationID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`ScheduleID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `TrainID` (`TrainID`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`StationID`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`TrainID`),
  ADD KEY `RouteID` (`RouteID`),
  ADD KEY `ScheduleID` (`ScheduleID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `ScheduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `SeatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `StationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `train`
--
ALTER TABLE `train`
  MODIFY `TrainID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`SourceStationID`) REFERENCES `station` (`StationID`),
  ADD CONSTRAINT `route_ibfk_2` FOREIGN KEY (`DestinationStationID`) REFERENCES `station` (`StationID`);

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`);

--
-- Constraints for table `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`),
  ADD CONSTRAINT `train_ibfk_2` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
