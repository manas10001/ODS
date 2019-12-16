-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2018 at 07:04 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hirarchy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `office` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `office`) VALUES
(3, 'gpn', 'gpn', 'gpn'),
(4, 'if_hod', '123456', 'IF');

-- --------------------------------------------------------

--
-- Table structure for table `cm_users`
--

CREATE TABLE `cm_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` varchar(12) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createdby` varchar(30) NOT NULL,
  `ucreation` varchar(5) NOT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cm_users`
--

INSERT INTO `cm_users` (`id`, `username`, `password`, `email`, `phoneno`, `type`, `createdby`, `ucreation`, `created_timestamp`) VALUES
(1, 'user', 'user', 'f@f', '4444444444', 'allow', 'cm', 'on', '2018-03-16 11:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `in_id` int(11) NOT NULL,
  `in_no` varchar(50) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ltrno` int(30) NOT NULL,
  `ltrdate` varchar(100) NOT NULL,
  `sub` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `uploder` varchar(50) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `file` longblob NOT NULL,
  `fname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`in_id`, `in_no`, `upload_time`, `ltrno`, `ltrdate`, `sub`, `type`, `uploder`, `dept`, `file`, `fname`) VALUES
(30, '2', '2018-03-16 11:22:03', 2, '2018-03-21', 'pravin', 'file', 'pravin', 'if', 0x433a78616d7070096f6d6361747765626170707368697261726368796461746148616d6c6574202d2057696c6c69616d205368616b657370656172652e706466, 'Hamlet - William Shakespeare.pdf'),
(32, '56', '2018-03-16 11:33:50', 56, '2018-03-14', 'file1', 'file', 'gpn', 'admin', 0x433a78616d7070096f6d63617477656261707073686972617263687964617461427265616b696e67205468652044612056696e636920436f64652e706466, 'Breaking The Da Vinci Code.pdf'),
(33, '55', '2018-03-16 11:37:00', 55, '2018-03-14', 'asd', 'file', 'user', 'cm', 0x433a78616d7070096f6d63617477656261707073686972617263687964617461426f6f6b322d4e65774d6f6f6e2e706466, 'Book2-NewMoon.pdf'),
(34, '   Gpn/if/39', '2018-03-25 12:00:57', 39, '2018-03-28', 'wegye', 'file', 'adhav', 'if', 0x453a4e65744265616e7350726f6a6563747368697261726368790875696c64776562486172727920506f7474657220616e642074686520507269736f6e6572206f6620417a6b6162616e2e706466, 'Harry Potter and the Prisoner of Azkaban.pdf'),
(35, '   Gpn/admin/2', '2018-03-27 16:46:07', 21, '2018-03-27', 'Oral Timetable', 'pdf', 'gpn', 'admin', 0x433a78616d7070096f6d636174776562617070736869726172636879416e67656c7320616e642044656d6f6e732e706466, 'Angels and Demons.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `dept_users`
--

CREATE TABLE `dept_users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `department` varchar(30) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_users`
--

INSERT INTO `dept_users` (`id`, `username`, `password`, `department`, `time_created`, `type`) VALUES
(1, 'pravin', 'pravin', 'if', '2018-03-03 11:07:01', 'on'),
(2, 'cm', 'cm', 'cm', '2018-03-16 11:31:18', 'on'),
(3, 'dx', 'ds', 'bh bk', '2018-03-25 10:49:49', 'on'),
(4, 'ww', 'w', 'bghn wwww', '2018-03-25 10:50:47', 'on'),
(5, '11', '1', '1', '2018-03-25 10:54:08', 'on'),
(6, '11', '1', '1', '2018-03-25 10:55:24', 'on'),
(7, 'warddd', 's', 'w', '2018-03-25 10:56:35', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `dev_users`
--

CREATE TABLE `dev_users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dev_users`
--

INSERT INTO `dev_users` (`username`, `password`) VALUES
('root', '123');

-- --------------------------------------------------------

--
-- Table structure for table `if_users`
--

CREATE TABLE `if_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneno` varchar(12) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createdby` varchar(30) NOT NULL,
  `ucreation` varchar(5) NOT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `if_users`
--

INSERT INTO `if_users` (`id`, `username`, `password`, `email`, `phoneno`, `type`, `createdby`, `ucreation`, `created_timestamp`) VALUES
(1, 'khedkar', 'khedkar', 'm@gmail.com', '4523618164', 'allow', 'pravin', 'off', '2018-03-03 11:11:02'),
(2, 'dudhe', 'dudhe', 'd@gmail.com', '7561276425', 'allow', 'pravin', 'off', '2018-03-03 11:11:02'),
(3, 'nemade', 'nemade', 'n@gmail.com', '4532856760', 'allow', 'pravin', 'off', '2018-03-03 11:11:02'),
(4, 'kalambe', 'kalambe', 'k@gmail.com', '7831654928', 'allow', 'pravin', 'off', '2018-03-03 11:11:03'),
(5, 'adhav', 'adhav123', 'a@gmail.com', '4631891424', 'allow', 'pravin', 'off', '2018-03-03 11:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `trash`
--

CREATE TABLE `trash` (
  `in_id` int(11) NOT NULL,
  `in_no` int(50) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ltrno` int(30) NOT NULL,
  `ltrdate` varchar(100) NOT NULL,
  `sub` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `uploder` varchar(50) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `file` longblob NOT NULL,
  `fname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trash`
--

INSERT INTO `trash` (`in_id`, `in_no`, `upload_time`, `ltrno`, `ltrdate`, `sub`, `type`, `uploder`, `dept`, `file`, `fname`) VALUES
(26, 0, '2018-03-12 13:34:48', 0, '', '', '', 'gpn', 'admin', 0x453a4e65744265616e7350726f6a6563747368697261726368792d3168697261726368790875696c64776562416e67656c7320616e642044656d6f6e732e706466, 'Angels and Demons.pdf'),
(27, 0, '2018-03-12 13:41:01', 0, '', '', '', 'gpn', 'admin', 0x453a4e65744265616e7350726f6a6563747368697261726368790875696c6477656232205374617465732e706466, '2 States.pdf'),
(29, 1, '2018-03-16 11:21:17', 1, '2018-03-21', 'admin file', 'file', 'gpn', 'admin', 0x433a78616d7070096f6d63617477656261707073686972617263687964617461416c6368656d6973742e706466, 'Alchemist.pdf'),
(31, 3, '2018-03-16 11:23:52', 3, '2018-03-21', 'adhav sir', 'file', 'adhav', 'if', 0x433a78616d7070096f6d63617477656261707073686972617263687964617461466976652d506f696e742d536f6d656f6e652e706466, 'Five-Point-Someone.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'file'),
(2, 'magzine'),
(3, 'pdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_users`
--
ALTER TABLE `cm_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `dept_users`
--
ALTER TABLE `dept_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `if_users`
--
ALTER TABLE `if_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trash`
--
ALTER TABLE `trash`
  ADD PRIMARY KEY (`in_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cm_users`
--
ALTER TABLE `cm_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `dept_users`
--
ALTER TABLE `dept_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `if_users`
--
ALTER TABLE `if_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `trash`
--
ALTER TABLE `trash`
  MODIFY `in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
