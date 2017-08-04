-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2017 at 04:08 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yatayat`
--

-- --------------------------------------------------------

--
-- Table structure for table `ba_1_kha_5464`
--

CREATE TABLE `ba_1_kha_5464` (
  `id` int(11) NOT NULL,
  `seatname` varchar(5) DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ba_1_kha_5464`
--

INSERT INTO `ba_1_kha_5464` (`id`, `seatname`, `status`) VALUES
(1, '1A', 0),
(2, '1B', 1),
(3, '2A', 0),
(4, '2B', 1),
(5, '3A', 0),
(6, '3B', 1),
(7, '4A', 0),
(8, '4B', 1),
(9, '5A', 1),
(10, '5B', 1),
(11, '6A', 1),
(12, '6B', 1),
(13, '7A', 1),
(14, '7B', 1),
(15, '8A', 1),
(16, '8B', 1),
(17, '9A', 1),
(18, '9B', 1),
(19, '10A', 1),
(20, '10B', 1),
(21, '11A', 1),
(22, '11B', 1),
(23, '12A', 1),
(24, '12B', 1),
(25, '13A', 1),
(26, '13B', 1),
(27, '14A', 1),
(28, '14B', 1),
(29, 'L1', 1),
(30, 'L2', 1),
(31, 'L3', 1),
(32, 'L4', 1),
(33, 'L5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ba_1_kha_7886`
--

CREATE TABLE `ba_1_kha_7886` (
  `id` int(11) NOT NULL,
  `seatname` varchar(5) DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ba_1_kha_7886`
--

INSERT INTO `ba_1_kha_7886` (`id`, `seatname`, `status`) VALUES
(1, '1A', 0),
(2, '1B', 1),
(3, '2A', 0),
(4, '2B', 1),
(5, '3A', 0),
(6, '3B', 0),
(7, '4A', 0),
(8, '4B', 1),
(9, '5A', 1),
(10, '5B', 1),
(11, '6A', 1),
(12, '6B', 1),
(13, '7A', 1),
(14, '7B', 1),
(15, '8A', 1),
(16, '8B', 1),
(17, '9A', 1),
(18, '9B', 1),
(19, '10A', 1),
(20, '10B', 1),
(21, '11A', 1),
(22, '11B', 1),
(23, '12A', 1),
(24, '12B', 1),
(25, '13A', 1),
(26, '13B', 1),
(27, '14A', 1),
(28, '14B', 1),
(29, 'L1', 1),
(30, 'L2', 1),
(31, 'L3', 1),
(32, 'L4', 1),
(33, 'L5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `ticket_no` int(255) NOT NULL,
  `book_date` date NOT NULL,
  `book_time` varchar(10) NOT NULL,
  `customer_email` varchar(30) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `booked_seats` varchar(20) NOT NULL,
  `amount` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`ticket_no`, `book_date`, `book_time`, `customer_email`, `bus_number`, `booked_seats`, `amount`) VALUES
(1, '2017-07-20', '15:15 PM', '1@1.com', 'ba_1_kha_7886', '1A,2A', 1000),
(2, '2017-07-20', '15:15 PM', '1@1.com', 'ba_1_kha_7886', '1A,2A', 1000),
(4, '2017-07-20', '04:42 PM', '1@1.com', 'ba_1_kha_7886', '2B', 500),
(5, '2017-07-20', '04:43 PM', '1@1.com', 'ba_1_kha_7886', '1B', 500),
(6, '2017-07-20', '04:43 PM', '1@1.com', 'ba_1_kha_7886', '2A,1A', 1000),
(7, '2017-07-20', '04:51 PM', '1@1.com', 'ba_1_kha_7886', '2B,1B,3A', 1500),
(8, '2017-07-27', '05:43 PM', '1@1.com', 'ba_1_kha_7886', '2B', 500),
(9, '2017-08-04', '11:23 AM', '1@1.com', 'ba_1_kha_5464', '3B', 550);

-- --------------------------------------------------------

--
-- Table structure for table `bpoints`
--

CREATE TABLE `bpoints` (
  `id` int(11) NOT NULL,
  `route_id` int(255) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `boarding_points` varchar(255) NOT NULL,
  `time` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpoints`
--

INSERT INTO `bpoints` (`id`, `route_id`, `schedule_id`, `boarding_points`, `time`) VALUES
(1, 1, 2, 'Gongabu Bus Station', '5:30 am'),
(2, 1, 2, 'Kalanki', '6:10 am'),
(3, 1, 3, 'Gongabus Bus Station', '10:00 am'),
(4, 1, 3, 'Kalanki', '10:45 am');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email_id` varchar(15) NOT NULL,
  `bus_number` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  `comment_date` varchar(20) NOT NULL,
  `remark` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `username`, `email_id`, `bus_number`, `description`, `comment_date`, `remark`) VALUES
(1, '', '1@1.com', 'ba_1_kha_7886', 'Very good', '2017-06-08', '1'),
(2, '', '1@1.com', 'ba_1_kha_5464', 'Very Bad', '2017-07-10', '0'),
(3, '', '1@1.com', 'ba_1_kha_7886', 'Service was good and bus was luxurious', '2017-07-25', '1'),
(4, '', '1@1.com', 'ba_1_kha_7886', 'i recommend this bus to other', '2017-07-17', '1'),
(5, 'suzzan', '1@1.com', 'ba_1_kha_5464', 'service was satisfactory ', '2017/08/04', '0'),
(6, 'suzzan', '1@1.com', 'ba_1_kha_5464', 'very very bad facility', '2017/08/04', '0'),
(7, 'suzzan', '', 'ba_1_kha_7886', 'Satisfied', '2017/08/04', '1');

-- --------------------------------------------------------

--
-- Table structure for table `current_location`
--

CREATE TABLE `current_location` (
  `id` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `recorded_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Dumping data for table `current_location`
--

INSERT INTO `current_location` (`id`, `lat`, `lon`, `recorded_datetime`) VALUES
(1, 27.665569, 85.280549, '2017-05-29 06:00:00'),
(2, 27.609606, 85.181672, '2017-05-29 06:30:00'),
(3, 27.556049, 85.107514, '2017-05-29 07:00:00'),
(4, 27.487847, 85.033356, '2017-05-29 07:30:00'),
(5, 27.482974, 84.860322, '2017-05-29 08:00:00'),
(6, 27.595002, 84.673554, '2017-05-29 08:30:00'),
(7, 27.663137, 84.437348, '2017-05-29 09:00:00'),
(8, 27.71421, 84.335724, '2017-05-29 09:30:00'),
(9, 27.677732, 84.201142, '2017-05-29 10:00:00'),
(10, 27.616907, 84.017121, '2017-05-29 10:30:00'),
(11, 27.597436, 83.871552, '2017-05-29 11:00:00'),
(12, 27.568223, 83.717744, '2017-05-29 11:30:00'),
(13, 27.626641, 83.60788, '2017-05-29 12:00:00'),
(14, 27.668002, 83.500764, '2017-05-29 12:30:00'),
(15, 27.711778, 83.443035, '2017-05-29 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `no` int(5) NOT NULL,
  `total_seats` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `myview`
--
CREATE TABLE `myview` (
`name` varchar(15)
,`status` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(255) NOT NULL,
  `bus_number` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `bus_number`, `email`, `rate`) VALUES
(1, 'ba_1_kha_7886', '1@1.com', 4),
(2, 'ba_1_kha_7886', '2@2.com', 3),
(3, 'ba_1_kha_5464', '1@1.com', 1.5),
(4, 'ba_1_kha_5464', '2@2.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(200) NOT NULL,
  `route_name` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `route_name`, `source`, `destination`) VALUES
(1, 'ktm-btl', 'Kathmandu', 'Butwal'),
(2, 'ktm-brt', 'Kathmandu', 'Biratnagar');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(22) NOT NULL,
  `bus_name` varchar(20) NOT NULL,
  `bus_number` varchar(15) NOT NULL,
  `departure_date` date NOT NULL,
  `departure` varchar(15) NOT NULL,
  `departure_time` varchar(10) NOT NULL,
  `destination` varchar(15) NOT NULL,
  `destination_time` varchar(15) NOT NULL,
  `travel_type` varchar(15) NOT NULL,
  `fare` int(5) NOT NULL,
  `available_seats` int(100) NOT NULL,
  `total_seats` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `bus_name`, `bus_number`, `departure_date`, `departure`, `departure_time`, `destination`, `destination_time`, `travel_type`, `fare`, `available_seats`, `total_seats`) VALUES
(2, 'Makalu Deluxe', 'ba_1_kha_5464', '2017-08-10', 'Kathmandu', '5:30 am', 'Butwal', '2:30 pm', 'Day', 550, 33, '33'),
(3, 'Lumbini Deluxe', 'ba_1_kha_7886', '2017-08-10', 'Kathmandu', '10:00 am', 'Butwal', '5:00 pm', 'Day', 500, 5, '33'),
(11, 'Lumbini Deluxe', 'ba_1_kha_7886', '2017-08-10', 'Butwal', '10:00 am', 'Kathmandu', '5:00 pm', 'Day', 500, 33, '33');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `name` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`name`, `status`) VALUES
('sujan', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `password` varchar(15) NOT NULL,
  `address` varchar(25) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`, `address`, `type`) VALUES
(1, 'admin', 'admin@admin.com', '0123456789', 'admin', 'kathmandu', 'admin'),
(2, 'suzzan', '1@1.com', '11111111111111', '1111', 'dhapakhel', 'customer'),
(3, '', '111@111.com', '11111111111111', '111', '', 'agent'),
(4, '', '111@111.com', '11111111111111', '1', '', ''),
(5, '', 'abc@abc.com', '11111111111111', '1', '', ''),
(6, '', 'abc@c.com', '11111111111111', '1', '', ''),
(7, 'ram', 'b@b.com', '11111111111111', 'b', 'ktm', ''),
(8, 'ram', 'v@v.com', '11111111111111', 'v', 'ktm', '');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_detail`
--

CREATE TABLE `vehicle_detail` (
  `id` int(200) NOT NULL,
  `bus_name` varchar(25) NOT NULL,
  `bus_number` varchar(25) NOT NULL,
  `model_no` varchar(20) NOT NULL,
  `driver_name` varchar(20) NOT NULL,
  `driver_contact` varchar(25) NOT NULL,
  `total_seats` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_detail`
--

INSERT INTO `vehicle_detail` (`id`, `bus_name`, `bus_number`, `model_no`, `driver_name`, `driver_contact`, `total_seats`) VALUES
(1, 'Lumbini Deluxe', 'ba_1_kha_7886', 'starbus 12', 'Ramesh', '9802020202', 33),
(2, 'Makalu Deluxe', 'ba_1_kha_5464', 'startbus 12', 'Ram', '984456262', 33);

-- --------------------------------------------------------

--
-- Structure for view `myview`
--
DROP TABLE IF EXISTS `myview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myview`  AS  select `test`.`name` AS `name`,`test`.`status` AS `status` from `test` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ba_1_kha_5464`
--
ALTER TABLE `ba_1_kha_5464`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ba_1_kha_7886`
--
ALTER TABLE `ba_1_kha_7886`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ticket_no`);

--
-- Indexes for table `bpoints`
--
ALTER TABLE `bpoints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_location`
--
ALTER TABLE `current_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_detail`
--
ALTER TABLE `vehicle_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ba_1_kha_5464`
--
ALTER TABLE `ba_1_kha_5464`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `ba_1_kha_7886`
--
ALTER TABLE `ba_1_kha_7886`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `ticket_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `bpoints`
--
ALTER TABLE `bpoints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `current_location`
--
ALTER TABLE `current_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vehicle_detail`
--
ALTER TABLE `vehicle_detail`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
