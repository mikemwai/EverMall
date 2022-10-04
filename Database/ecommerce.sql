-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2022 at 07:33 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_project`
--
CREATE DATABASE IF NOT EXISTS `database_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `database_project`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Appointment_No` varchar(255) NOT NULL,
  `Patient_Name` varchar(255) NOT NULL,
  `Staff_No` varchar(255) DEFAULT NULL,
  `Appointment_Date` date DEFAULT NULL,
  `Appointment_Time` time DEFAULT NULL,
  `ExaminationRoom_No` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_no` int(30) NOT NULL,
  `patient_no` int(30) DEFAULT NULL,
  `ward_no` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `charge_nurse`
--

CREATE TABLE `charge_nurse` (
  `chargenurse_no` int(255) NOT NULL,
  `chargenurse_name` text NOT NULL,
  `chargenurse_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Staff_No` varchar(255) NOT NULL,
  `Doctor_Name` varchar(255) DEFAULT NULL,
  `Clinic_No` varchar(255) DEFAULT NULL,
  `TelNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Wards` int(25) NOT NULL,
  `Beds` int(25) NOT NULL,
  `Pharmaceutical_Supplies` int(25) NOT NULL,
  `Supplies` int(25) NOT NULL,
  `Patients` int(25) NOT NULL,
  `Staff` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `in_patients`
--

CREATE TABLE `in_patients` (
  `Patient_Name` text NOT NULL,
  `Patient_Address` varchar(255) NOT NULL,
  `Patient_TelephoneNumber` int(255) NOT NULL,
  `Patient_DOB` date NOT NULL,
  `Date_RegisteredwithHospital` date NOT NULL,
  `Ward_No` int(255) NOT NULL,
  `Patient_No` int(255) NOT NULL,
  `Sex` text NOT NULL,
  `Marital_Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `Patient_Name` text NOT NULL,
  `DrugName` text NOT NULL,
  `DrugNumber` int(255) NOT NULL,
  `Units_per_day` int(255) NOT NULL,
  `Method_Of_Administration` text NOT NULL,
  `Start_date` date NOT NULL,
  `Finish_date` date NOT NULL,
  `Patient_No` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `med_doctor`
--

CREATE TABLE `med_doctor` (
  `Meddoc_No` varchar(255) NOT NULL,
  `Meddoc_Name` varchar(255) NOT NULL,
  `Meddoc_TelephoneNo` varchar(255) NOT NULL,
  `Meddoc_Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nextofkin`
--

CREATE TABLE `nextofkin` (
  `Patient_No` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Relationship` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Telephone_No` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `out_patients`
--

CREATE TABLE `out_patients` (
  `Patient_Name` text NOT NULL,
  `Patient_Address` varchar(255) NOT NULL,
  `Patient_TelephoneNumber` int(255) NOT NULL,
  `Patient_DOB` date NOT NULL,
  `Date_RegisteredwithHospital` date NOT NULL,
  `Ward_No` int(255) NOT NULL,
  `Patient_No` int(255) NOT NULL,
  `Sex` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_No` int(25) NOT NULL,
  `Patient_Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Tel_No` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `Marital_Status` varchar(255) DEFAULT NULL,
  `Date_Registered` date DEFAULT NULL,
  `NextOfKin_IDNo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personnel_officer`
--

CREATE TABLE `personnel_officer` (
  `officer_no` int(255) NOT NULL,
  `officer_name` text NOT NULL,
  `officer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceutical`
--

CREATE TABLE `pharmaceutical` (
  `DrugName` text NOT NULL,
  `Drugdescription` text NOT NULL,
  `DrugNumber` int(255) NOT NULL,
  `Quantity_in_Stock` int(255) NOT NULL,
  `Method_Of_Administration` text NOT NULL,
  `Dosage` varchar(255) NOT NULL,
  `ReorderLevel` int(255) NOT NULL,
  `Cost_per_unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `Staff_No` int(25) NOT NULL,
  `QType` varchar(255) DEFAULT NULL,
  `QDate` date DEFAULT NULL,
  `InstitutionName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `referredpatientdetails_ward`
-- (See below for the actual view)
--
CREATE TABLE `referredpatientdetails_ward` (
`Patient_No` int(25)
,`Patient_Name` varchar(255)
,`Address` varchar(255)
,`Tel_No` varchar(255)
,`DOB` date
,`Sex` varchar(255)
,`Marital_status` varchar(255)
,`Date_Registered` date
,`NextOfKin_IDNo` varchar(255)
,`Ward_Number` int(25)
,`Ward_Name` varchar(255)
,`Ward_Location` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_No` int(25) NOT NULL,
  `Staff_Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Tel_No` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `NIN` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `Salary` int(25) DEFAULT NULL,
  `Salary_Scale` varchar(255) DEFAULT NULL,
  `Number_of_Hours` int(25) DEFAULT NULL,
  `Contract_Type` varchar(255) DEFAULT NULL,
  `Payment_Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staffrotation`
--

CREATE TABLE `staffrotation` (
  `Shift` varchar(255) DEFAULT NULL,
  `Week_No` varchar(255) DEFAULT NULL,
  `Staff_No` varchar(255) NOT NULL,
  `Ward_No` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierName` text NOT NULL,
  `SupplierNumber` int(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Telephone` int(255) NOT NULL,
  `FaxNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `surgical_supplies`
--

CREATE TABLE `surgical_supplies` (
  `ItemNo` int(255) NOT NULL,
  `Name` text NOT NULL,
  `Item_description` text NOT NULL,
  `Quantity_in_Stock` int(255) NOT NULL,
  `ReorderLevel` int(255) NOT NULL,
  `Cost_per_unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `Ward_Number` int(25) NOT NULL,
  `Ward_Name` varchar(255) DEFAULT NULL,
  `Ward_Location` varchar(255) DEFAULT NULL,
  `Number_of_Beds` int(25) DEFAULT NULL,
  `Telephone_ExtensionNo` varchar(255) DEFAULT NULL,
  `ChargeNurse` varchar(255) NOT NULL,
  `SeniorNurse` varchar(255) NOT NULL,
  `JuniorNurse` varchar(255) NOT NULL,
  `Doctors` varchar(255) NOT NULL,
  `Auxiliaries` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wardrequisitions`
--

CREATE TABLE `wardrequisitions` (
  `RequisitionNumber` int(255) NOT NULL,
  `ChargeNurse` text NOT NULL,
  `Ward_No` int(255) NOT NULL,
  `WardName` text NOT NULL,
  `DrugNumber` int(255) NOT NULL,
  `Dateordered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `wardstaff_details`
-- (See below for the actual view)
--
CREATE TABLE `wardstaff_details` (
`Ward_Number` int(25)
,`Ward_Name` varchar(255)
,`Ward_Location` varchar(255)
,`Staff_No` int(25)
,`Staff_Name` varchar(255)
,`Address` varchar(255)
,`Tel_No` varchar(255)
,`Position` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `workexperience`
--

CREATE TABLE `workexperience` (
  `Staff_No` varchar(255) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `Finish_Date` date DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `Organization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `referredpatientdetails_ward`
--
DROP TABLE IF EXISTS `referredpatientdetails_ward`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `referredpatientdetails_ward`  AS SELECT `patient`.`Patient_No` AS `Patient_No`, `patient`.`Patient_Name` AS `Patient_Name`, `patient`.`Address` AS `Address`, `patient`.`Tel_No` AS `Tel_No`, `patient`.`DOB` AS `DOB`, `patient`.`Sex` AS `Sex`, `patient`.`Marital_Status` AS `Marital_status`, `patient`.`Date_Registered` AS `Date_Registered`, `patient`.`NextOfKin_IDNo` AS `NextOfKin_IDNo`, `ward`.`Ward_Number` AS `Ward_Number`, `ward`.`Ward_Name` AS `Ward_Name`, `ward`.`Ward_Location` AS `Ward_Location` FROM (`patient` join `ward`)  ;

-- --------------------------------------------------------

--
-- Structure for view `wardstaff_details`
--
DROP TABLE IF EXISTS `wardstaff_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wardstaff_details`  AS SELECT `ward`.`Ward_Number` AS `Ward_Number`, `ward`.`Ward_Name` AS `Ward_Name`, `ward`.`Ward_Location` AS `Ward_Location`, `staff`.`Staff_No` AS `Staff_No`, `staff`.`Staff_Name` AS `Staff_Name`, `staff`.`Address` AS `Address`, `staff`.`Tel_No` AS `Tel_No`, `staff`.`Position` AS `Position` FROM (`ward` join `staff`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Appointment_No`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_no`);

--
-- Indexes for table `charge_nurse`
--
ALTER TABLE `charge_nurse`
  ADD PRIMARY KEY (`chargenurse_no`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Staff_No`);

--
-- Indexes for table `in_patients`
--
ALTER TABLE `in_patients`
  ADD PRIMARY KEY (`Patient_No`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`Patient_No`);

--
-- Indexes for table `out_patients`
--
ALTER TABLE `out_patients`
  ADD PRIMARY KEY (`Patient_No`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_No`);

--
-- Indexes for table `personnel_officer`
--
ALTER TABLE `personnel_officer`
  ADD PRIMARY KEY (`officer_no`);

--
-- Indexes for table `pharmaceutical`
--
ALTER TABLE `pharmaceutical`
  ADD PRIMARY KEY (`DrugNumber`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`Staff_No`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_No`);

--
-- Indexes for table `staffrotation`
--
ALTER TABLE `staffrotation`
  ADD PRIMARY KEY (`Staff_No`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierNumber`);

--
-- Indexes for table `surgical_supplies`
--
ALTER TABLE `surgical_supplies`
  ADD PRIMARY KEY (`ItemNo`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`Ward_Number`);

--
-- Indexes for table `wardrequisitions`
--
ALTER TABLE `wardrequisitions`
  ADD PRIMARY KEY (`RequisitionNumber`);

--
-- Indexes for table `workexperience`
--
ALTER TABLE `workexperience`
  ADD PRIMARY KEY (`Staff_No`);
--
-- Database: `ebuy`
--
CREATE DATABASE IF NOT EXISTS `ebuy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ebuy`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`) VALUES
(17, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 2, 'Sample 101', 'This is a sample Category Only.', 1, 0, '2022-02-09 11:03:40', '2022-02-09 11:05:03'),
(3, 2, 'Sample 102', 'This is a sample Category 102', 1, 0, '2022-02-09 11:05:57', NULL),
(4, 2, 'Category 103', 'Sample Category 103', 1, 0, '2022-02-09 11:06:10', NULL),
(5, 2, 'test', 'test', 0, 1, '2022-02-09 11:06:17', '2022-02-09 11:06:20'),
(6, 1, 'Category 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo', 1, 0, '2022-02-09 11:09:36', NULL),
(7, 1, 'Category 102', 'Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus.', 1, 0, '2022-02-09 11:09:45', NULL),
(8, 1, 'Category 103', 'Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.', 1, 0, '2022-02-09 11:10:19', NULL),
(9, 1, 'Category 104', 'Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci.', 1, 0, '2022-02-09 11:10:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'D', 'Smith', 'Male', '09123456789', 'This is only my sample address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2022-02-10 13:42:53'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(1, 1, 3, 1500, '2022-02-10 09:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 1, 1, 4500, 'This is only my sample address', 5, '2022-02-10 09:56:49', '2022-02-10 11:52:53'),
(2, '202202-00002', 1, 2, 7359.9, 'This is only my sample address', 0, '2022-02-10 09:56:49', '2022-02-10 09:56:49'),
(3, '202202-00003', 1, 1, 1325, 'This is only my sample address', 1, '2022-02-10 10:29:00', '2022-02-10 12:09:59'),
(4, '202202-00004', 1, 2, 2320.61, 'This is only my sample address', 0, '2022-02-10 10:29:01', '2022-02-10 10:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 2, 'Product nyarangi', 'west', 1500, 'admin.png', 0, 0, '2022-02-09 12:05:49', '0000-00-00 00:00:00'),
(2, 1, 2, 'Loaf Bread', 'flayer dress', 85, 'administrator.png', 1, 0, '2022-02-09 12:58:35', '0000-00-00 00:00:00'),
(24, NULL, 2, 'Suit', 'Leather', 12.33, 'banner.jpg', 0, 0, '2022-09-27 15:20:00', NULL),
(26, NULL, 2, 'Blue Shirt', 'The shirt is blue', 2000, '1.jpg', 1, 0, '2022-10-04 18:14:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 0, '2022-02-09 08:49:34', NULL),
(2, 'Cosmetics', 1, 0, '2022-02-09 08:49:46', NULL),
(3, 'Produce', 1, 0, '2022-02-09 08:50:31', NULL),
(4, 'Anyy', 1, 0, '2022-02-09 08:50:36', '2022-02-09 08:50:57'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Multi-Vendor Online Grocery Management System'),
(6, 'short_name', 'MVOGMS - PHP'),
(11, 'logo', 'uploads/logo-1644367440.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1644367404.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15'),
(11, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-11.png?v=1644472553', NULL, 2, '2022-02-10 13:55:52', '2022-02-10 13:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 4, 'Shop101', 'Shop 101 Owner', '09123456788', 'shop101', 'ee6c4d4ba80f29dd389f0deb8863de69', 'uploads/vendors/1.png?v=1644375053', 1, 0, '2022-02-09 10:50:53', '2022-02-10 13:43:21'),
(2, '202202-00002', 1, 'Shop102', 'John Miller', '09123456789', 'shop102', '90be022251077e3488c998613214df74', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2022-02-09 10:52:09', '2022-02-09 17:02:54'),
(3, '202202-00003', 2, 'test', 'test', '123123123', 'test', '098f6bcd4621d373cade4e832627b4f6', 'uploads/vendors/3.png?v=1644471934', 1, 1, '2022-02-10 13:45:34', '2022-02-10 13:50:15'),
(12, '', 4, 'Flora', 'Flora', '1111', 'flo', 'b59c67bf196a4758191e42f76670ceba', 'accomodate.png', 1, 0, '2022-09-11 17:38:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
--
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`) VALUES
(17, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 2, 'Sample 101', 'This is a sample Category Only.', 1, 0, '2022-02-09 11:03:40', '2022-02-09 11:05:03'),
(3, 2, 'Sample 102', 'This is a sample Category 102', 1, 0, '2022-02-09 11:05:57', NULL),
(4, 2, 'Category 103', 'Sample Category 103', 1, 0, '2022-02-09 11:06:10', NULL),
(5, 2, 'test', 'test', 0, 1, '2022-02-09 11:06:17', '2022-02-09 11:06:20'),
(6, 1, 'Category 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper leo vitae dui rutrum ultricies. Etiam sit amet odio lorem. In sit amet cursus justo', 1, 0, '2022-02-09 11:09:36', NULL),
(7, 1, 'Category 102', 'Morbi pellentesque, dolor in sodales pretium, libero leo finibus arcu, vitae pharetra ligula quam quis enim. Quisque suscipit venenatis finibus.', 1, 0, '2022-02-09 11:09:45', NULL),
(8, 1, 'Category 103', 'Curabitur fermentum, diam ut dictum molestie, eros dolor luctus dolor, in hendrerit dui sapien vel lorem. Nulla ultrices gravida nisl, id feugiat turpis varius a. In iaculis lorem nisi. Aliquam nec aliquam ipsum, vitae fermentum dui.', 1, 0, '2022-02-09 11:10:19', NULL),
(9, 1, 'Category 104', 'Phasellus luctus ultricies dui, non euismod massa congue id. Fusce ut nisi convallis, aliquam dolor consectetur, varius enim. Phasellus dignissim, erat ac ullamcorper lacinia, nibh est auctor risus, eget ornare est felis et orci.', 1, 0, '2022-02-09 11:10:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'D', 'Smith', 'Male', '09123456789', 'This is only my sample address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2022-02-10 13:42:53'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

CREATE TABLE `clothes` (
  `ClothNo` int(10) NOT NULL,
  `ClothName` varchar(25) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `Price` int(10) NOT NULL,
  `Amount` int(10) NOT NULL,
  `SupplierNo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeNo` int(10) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Sex` varchar(25) NOT NULL,
  `OrderNo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderNo` int(11) NOT NULL,
  `UserNo` int(11) NOT NULL,
  `ClothNo` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(1, 1, 3, 1500, '2022-02-10 09:56:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 1, 1, 4500, 'This is only my sample address', 5, '2022-02-10 09:56:49', '2022-02-10 11:52:53'),
(2, '202202-00002', 1, 2, 7359.9, 'This is only my sample address', 0, '2022-02-10 09:56:49', '2022-02-10 09:56:49'),
(3, '202202-00003', 1, 1, 1325, 'This is only my sample address', 1, '2022-02-10 10:29:00', '2022-02-10 12:09:59'),
(4, '202202-00004', 1, 2, 2320.61, 'This is only my sample address', 0, '2022-02-10 10:29:01', '2022-02-10 10:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(25) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` varchar(25) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 2, 'Product nyarangi', 'west', 1500, 'admin.png', 0, 0, '2022-02-09 12:05:49', '0000-00-00 00:00:00'),
(2, 1, 2, 'Loaf Bread', 'flayer dress', 85, 'administrator.png', 1, 0, '2022-02-09 12:58:35', '0000-00-00 00:00:00'),
(24, NULL, 2, 'Suit', 'Leather', 12.33, 'banner.jpg', 0, 0, '2022-09-27 15:20:00', NULL),
(26, NULL, 2, 'Blue Shirt', 'The shirt is blue', 2000, '1.jpg', 1, 0, '2022-10-04 18:14:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `PurchaseNo` int(10) NOT NULL,
  `UserNo` int(10) NOT NULL,
  `EmployeeNo` int(10) NOT NULL,
  `ClothName` varchar(25) NOT NULL,
  `Price` int(10) NOT NULL,
  `PurchaseStatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 0, '2022-02-09 08:49:34', NULL),
(2, 'Cosmetics', 1, 0, '2022-02-09 08:49:46', NULL),
(3, 'Produce', 1, 0, '2022-02-09 08:50:31', NULL),
(4, 'Anyy', 1, 0, '2022-02-09 08:50:36', '2022-02-09 08:50:57'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierNo` int(10) NOT NULL,
  `SupplierName` varchar(25) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `SupplierStatus` varchar(25) NOT NULL,
  `Amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Multi-Vendor Online Grocery Management System'),
(6, 'short_name', 'MVOGMS - PHP'),
(11, 'logo', 'uploads/logo-1644367440.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1644367404.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `user_id`, `product_id`, `name`, `price`, `image`, `quantity`) VALUES
(88, 0, 4, 'Dark green T-Shirt', '500', '26.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`, `is_deleted`) VALUES
(1, 'Men', 0),
(2, 'Ladies', 0),
(3, 'Children', 0),
(4, 'Pets', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complain`
--

CREATE TABLE `tbl_complain` (
  `complain_id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `complain` varchar(100) NOT NULL,
  `responce` varchar(25) NOT NULL DEFAULT 'Not Responded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complain`
--

INSERT INTO `tbl_complain` (`complain_id`, `user_id`, `complain`, `responce`) VALUES
(1, 31, 'Help!', 'Not Responded');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_products` varchar(255) NOT NULL,
  `order_amount` double NOT NULL,
  `order_status` enum('Pending','Paid','Delivered') NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` enum('M-Pesa','Bank Account','Cash on Delivery','') NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `user_id`, `total_products`, `order_amount`, `order_status`, `created_at`, `payment_type`, `updated_at`, `is_deleted`) VALUES
(1, 4, 'White Suit ( 1 ), White Dress ( 2 )', 9000, 'Delivered', '2022-07-12 17:37:00', 'Cash on Delivery', '2022-07-12 17:37:00', 0),
(2, 4, 'Purple T-shirt ( 1 )', 500, 'Delivered', '2022-07-12 18:08:20', 'M-Pesa', '2022-07-12 18:08:20', 0),
(3, 28, 'White Sweatpants ( 1 ), Blue T-Shirt ( 1 )', 2300, 'Delivered', '2022-07-13 08:32:02', 'M-Pesa', '2022-07-13 08:32:02', 0),
(4, 32, 'Bicycle ( 1 )', 10000, 'Delivered', '2022-07-13 09:19:59', 'M-Pesa', '2022-07-13 09:19:59', 0),
(5, 4, 'Purple T-shirt ( 1 )', 500, 'Delivered', '2022-08-23 16:19:09', 'M-Pesa', '2022-08-23 16:19:09', 0),
(6, 4, 'Dark green T-Shirt ( 4 )', 2000, 'Delivered', '2022-08-23 16:45:56', 'M-Pesa', '2022-08-23 16:45:56', 0),
(7, 4, 'Dark green T-Shirt ( 2 )', 1000, 'Pending', '2022-08-23 16:47:15', 'M-Pesa', '2022-08-23 16:47:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderdetails`
--

CREATE TABLE `tbl_orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) NOT NULL,
  `product_image` varchar(40) NOT NULL,
  `product_price` double NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_status` enum('Pending','Paid','','') NOT NULL DEFAULT 'Pending',
  `payment_type` enum('M-Pesa','Bank Account','Cash on Delivery','') NOT NULL,
  `orderdetails_total` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orderdetails`
--

INSERT INTO `tbl_orderdetails` (`orderdetails_id`, `order_id`, `user_id`, `product_id`, `product_name`, `product_image`, `product_price`, `order_quantity`, `order_status`, `payment_type`, `orderdetails_total`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 65, 4, 18, 'White Dress', 'WhiteDress.jpg', 2000, 2, 'Pending', 'Cash on Delivery', 4000, '2022-07-12 17:36:59', '2022-07-12 17:36:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_paymenttypes`
--

CREATE TABLE `tbl_paymenttypes` (
  `paymenttype_id` int(11) NOT NULL,
  `paymenttype_name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_image` varchar(40) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  `subcategory_name` text DEFAULT NULL,
  `category_name` text NOT NULL,
  `product_keywords` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `product_description`, `product_image`, `unit_price`, `available_quantity`, `subcategory_name`, `category_name`, `product_keywords`, `created_at`, `updated_at`, `added_by`, `is_deleted`) VALUES
(1, 'Blue T-Shirt', 'The shirt is blue in color', 'product-4.jpg', 1200, 25, 'Casual', 'Men', 'blue, t-shirt, casual, ladies', '2022-06-21 22:47:53', '2022-06-21 22:47:53', NULL, NULL),
(2, 'White T-Shirt', 'The shirt is white in color. A product of Calvin Klein.', '24.jpg', 1500, 20, 'Casual', 'Children', 'white, t-shirt, casual, children', '2022-06-21 22:48:41', '2022-06-21 22:48:41', NULL, NULL),
(3, 'Purple Trenchcoat', 'The trenchcoat is purple. ', '6.jpg', 3000, 10, 'Formal', 'Children', 'purple, trenchcoat, formal, children', '2022-06-21 22:49:39', '2022-06-21 22:49:39', NULL, NULL),
(4, 'Dark green T-Shirt', 'The shirt is dark green in color. A product of Lacoste.', '26.jpg', 500, 50, 'Casual', 'Men', 'dark-green, t-shirt, casual, men', '2022-06-21 22:51:25', '2022-06-21 22:51:25', NULL, NULL),
(5, 'Purple T-shirt', 'The t-shirt is purple in color', '16.jpg', 500, 50, 'Casual', 'Ladies', 'purple, casual, ladies', '2022-06-28 10:47:32', '2022-06-28 10:47:32', NULL, NULL),
(6, 'Black Sweater', 'The sweater is black in color. A product of polo.', '21.jpg', 2000, 15, 'Formal', 'Men', 'black, sweater, formal, men', '2022-06-28 10:50:59', '2022-06-28 10:50:59', NULL, NULL),
(7, 'Blue Jacket', 'The puff jacket is blue in color.', '8.jpg', 3000, 25, 'Formal', 'Ladies', 'blue, jacket, formal, ladies', '2022-06-28 10:53:22', '2022-06-28 10:53:22', NULL, NULL),
(8, 'Black Suit', 'The suit is black in color.', 'pexels-teddy-joseph-2955375.jpg', 5000, 10, 'Formal', 'Men', 'black, suit, formal, men', '2022-06-28 10:55:36', '2022-06-28 10:55:36', NULL, NULL),
(9, 'Black Socks', 'The socks are black.', 'pexels-ryutaro-tsukata-5746098.jpg', 100, 50, 'Sports', 'Children', 'black, socks, sports, children', '2022-06-28 10:56:48', '2022-06-28 10:56:48', NULL, NULL),
(10, 'Sweater', 'The sweater is red in color that can be worn by pets.', 'Pets1.jpg', 1000, 20, 'Dogs', 'Pets', 'sweater, dogs, pets', '2022-06-28 10:59:06', '2022-06-28 10:59:06', NULL, NULL),
(11, 'Cream Shirt', 'The shirt is cream in color. The product is from Lacoste.', 'pexels-brenner-oliveira-10495156.jpg', 1500, 30, 'Formal', 'Men', 'cream, shirt, formal, men', '2022-06-28 12:26:44', '2022-06-28 12:26:44', NULL, NULL),
(12, 'Blue Sweater', 'The sweater is blue in color.', 'pexels-teddy-tavan-4890733.jpg', 5500, 15, 'Casual', 'Men', 'blue, sweater, casual, men', '2022-06-28 12:27:31', '2022-06-28 12:27:31', NULL, NULL),
(13, 'Kitenge Shirt', 'The shirt is a kitenge best for hot weather.', 'pexels-mikhail-nilov-7624298.jpg', 800, 35, 'Casual', 'Men', 'kitenge, shirt, casual, men', '2022-06-28 12:29:43', '2022-06-28 12:29:43', NULL, NULL),
(14, 'Red T-Shirt', 'The red T-shirt is best for sports. Product from Nike.', 'pexels-pnw-production-8979858.jpg', 1300, 20, 'Sports', 'Men', 'red, t-shirt, sports, men', '2022-06-28 12:35:39', '2022-06-28 12:35:39', NULL, NULL),
(15, 'White Trouser', 'The white trouser is best for hot weather and can be worn in beaches. ', 'pexels-mwabonje-5875803.jpg', 900, 15, 'Casual', 'Men', 'white, trouser, casual, men', '2022-06-28 12:37:53', '2022-06-28 12:37:53', NULL, NULL),
(16, 'Orange Dress', 'The orange dress is a product from Zara.', 'pexels-mikhail-nilov-7682670.jpg', 1200, 25, 'Casual', 'Ladies', 'orange, dress, casual, ladies', '2022-06-28 12:47:23', '2022-06-28 12:47:23', NULL, NULL),
(17, 'White Sweatpants', 'The white sweatpants is a product from Nike.', 'pexels-styves-exantus-8514111.jpg', 1100, 30, 'Sports', 'Ladies', 'white, sweatpants, sports, ladies', '2022-06-28 12:48:28', '2022-06-28 12:48:28', NULL, NULL),
(18, 'White Dress', 'The white dress is best for official environments.', 'WhiteDress.jpg', 2000, 30, 'Formal', 'Ladies', 'white, dress, formal, ladies', '2022-06-28 12:50:38', '2022-06-28 12:50:38', NULL, NULL),
(19, 'White wedding Gown', 'The wedding gown is white in color.', '4.jpg', 10000, 15, 'Casual', 'Ladies', 'white, wedding, gown, casual, ladies', '2022-06-28 12:58:36', '2022-06-28 12:58:36', NULL, NULL),
(20, 'White Suit', 'The white suit is best for official environments.', '5.jpg', 5000, 15, 'Formal', 'Ladies', 'white, suit, formal, ladies', '2022-06-28 12:59:43', '2022-06-28 12:59:43', NULL, NULL),
(21, 'Black Sweatpants', 'The product is from Adidas.', 'product-12.jpg', 2000, 20, 'Casual', 'Children', 'black, sweatpants, casual, children', '2022-06-28 13:02:28', '2022-06-28 13:02:28', NULL, NULL),
(22, 'Sweater', 'The product is from Polo.', 'pexels-amina-filkins-5559985.jpg', 1300, 50, 'Casual', 'Children', 'sweater, casual, children', '2022-06-28 13:05:45', '2022-06-28 13:05:45', NULL, NULL),
(23, 'Turquoise T-Shirt', 'The T-Shirt is long sleeved. The product is best for cold weather.', 'pexels-norma-mortenson-7303182.jpg', 2000, 20, 'Casual', 'Children', 'turquoise t-shirt, casual, children', '2022-06-28 13:07:54', '2022-06-28 13:07:54', NULL, NULL),
(24, 'Orange Tracksuit', 'The product is from Adidas.', 'category-2.jpg', 1500, 30, 'Sports', 'Children', 'orange, tracksuit, sports, children  ', '2022-06-28 13:11:38', '2022-06-28 13:11:38', NULL, NULL),
(25, 'Grey Sweatpants', 'The tracksuit is best for sports.', 'buy-3.jpg', 1500, 20, 'Casual', 'Children', 'grey, sweatpants, casual, children', '2022-06-28 13:13:20', '2022-06-28 13:13:20', NULL, NULL),
(26, 'Sweater', 'The sweater is black and white that cats can wear.', 'Cat1.jpg', 1500, 15, 'Cats', 'Pets', 'sweater, cats, pets', '2022-06-28 21:32:18', '2022-06-28 21:32:18', NULL, NULL),
(27, 'Dress', 'The dress is small enough to be worn by rabbits.', 'Rabbit1.webp', 2000, 20, 'Others', 'Pets', 'dress, others, pets', '2022-06-28 21:40:25', '2022-06-28 21:40:25', NULL, NULL),
(28, 'Basketball Vest', 'The product is best for basketball games and can also be worn as a casual cloth.', 'Basketball Vest.jpg', 5000, 28, 'Sports', 'Men', 'basketball, vest, sports, men', '2022-06-29 08:40:22', '2022-06-29 08:40:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productimages`
--

CREATE TABLE `tbl_productimages` (
  `productimages_id` int(11) NOT NULL,
  `product_image` varchar(40) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_productimages`
--

INSERT INTO `tbl_productimages` (`productimages_id`, `product_image`, `product_id`, `created_at`, `updated_at`, `added_by`, `is_deleted`) VALUES
(1, '1.jpg', 0, '2022-06-21 22:47:53', '2022-06-21 22:47:53', 0, 0),
(2, '24.jpg', 0, '2022-06-21 22:48:41', '2022-06-21 22:48:41', 0, 0),
(3, '6.jpg', 0, '2022-06-21 22:49:39', '2022-06-21 22:49:39', 0, 0),
(4, '26.jpg', 0, '2022-06-21 22:51:25', '2022-06-21 22:51:25', 0, 0),
(5, '16.jpg', 0, '2022-06-28 10:47:32', '2022-06-28 10:47:32', 0, 0),
(6, '21.jpg', 0, '2022-06-28 10:50:59', '2022-06-28 10:50:59', 0, 0),
(7, '8.jpg', 0, '2022-06-28 10:53:22', '2022-06-28 10:53:22', 0, 0),
(8, 'pexels-teddy-joseph-2955375.jpg', 0, '2022-06-28 10:55:36', '2022-06-28 10:55:36', 0, 0),
(9, 'pexels-ryutaro-tsukata-5746098.jpg', 0, '2022-06-28 10:56:48', '2022-06-28 10:56:48', 0, 0),
(10, 'Pets1.jpg', 0, '2022-06-28 10:59:06', '2022-06-28 10:59:06', 0, 0),
(11, 'pexels-brenner-oliveira-10495156.jpg', 0, '2022-06-28 12:26:44', '2022-06-28 12:26:44', 0, 0),
(12, 'pexels-the-lazy-artist-gallery-1342609.j', 0, '2022-06-28 12:27:31', '2022-06-28 12:27:31', 0, 0),
(13, 'pexels-mikhail-nilov-7624298.jpg', 0, '2022-06-28 12:29:43', '2022-06-28 12:29:43', 0, 0),
(14, 'pexels-pnw-production-8979858.jpg', 0, '2022-06-28 12:35:39', '2022-06-28 12:35:39', 0, 0),
(15, 'pexels-mwabonje-5875803.jpg', 0, '2022-06-28 12:37:54', '2022-06-28 12:37:54', 0, 0),
(16, 'pexels-mikhail-nilov-7682670.jpg', 0, '2022-06-28 12:47:23', '2022-06-28 12:47:23', 0, 0),
(17, 'pexels-styves-exantus-8514111.jpg', 0, '2022-06-28 12:48:28', '2022-06-28 12:48:28', 0, 0),
(18, '2.jpg', 0, '2022-06-28 12:50:38', '2022-06-28 12:50:38', 0, 0),
(19, '4.jpg', 0, '2022-06-28 12:58:36', '2022-06-28 12:58:36', 0, 0),
(20, '5.jpg', 0, '2022-06-28 12:59:43', '2022-06-28 12:59:43', 0, 0),
(21, '2.jpg', 0, '2022-06-28 13:02:28', '2022-06-28 13:02:28', 0, 0),
(22, 'pexels-amina-filkins-5559985.jpg', 0, '2022-06-28 13:05:45', '2022-06-28 13:05:45', 0, 0),
(23, 'pexels-norma-mortenson-7303182.jpg', 0, '2022-06-28 13:07:54', '2022-06-28 13:07:54', 0, 0),
(24, 'category-2.jpg', 0, '2022-06-28 13:11:38', '2022-06-28 13:11:38', 0, 0),
(25, 'buy-3.jpg', 0, '2022-06-28 13:13:20', '2022-06-28 13:13:20', 0, 0),
(26, 'Cat1.jpg', 0, '2022-06-28 21:32:18', '2022-06-28 21:32:18', 0, 0),
(27, 'Rabbit1.webp', 0, '2022-06-28 21:40:25', '2022-06-28 21:40:25', 0, 0),
(28, 'Basketball Vest.jpg', 0, '2022-06-29 08:40:22', '2022-06-29 08:40:22', 0, 0),
(29, 'Jersey2.jpg', 0, '2022-07-06 08:36:42', '2022-07-06 08:36:42', 0, 0),
(30, 'Sugar.jpg', 0, '2022-07-06 09:49:35', '2022-07-06 09:49:35', 0, 0),
(31, 'Bicycle1.jpg', 0, '2022-07-13 09:14:06', '2022-07-13 09:14:06', 0, 0),
(32, 'product-4.jpg', 0, '2022-09-28 08:58:51', '2022-09-28 08:58:51', 0, 0),
(33, 'product-4.jpg', 0, '2022-09-28 08:59:32', '2022-09-28 08:59:32', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`role_id`, `role_name`, `is_deleted`) VALUES
(1, 'Admin', 0),
(2, 'Employee', 0),
(3, 'User', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategories`
--

CREATE TABLE `tbl_subcategories` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(25) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_subcategories`
--

INSERT INTO `tbl_subcategories` (`subcategory_id`, `subcategory_name`, `category_id`, `is_deleted`) VALUES
(1, 'Formal', 1, 0),
(2, 'Casual', 1, 0),
(3, 'Sports', 1, 0),
(4, 'Formal', 2, 0),
(5, 'Casual', 2, 0),
(6, 'Sports', 2, 0),
(7, 'Formal', 3, 0),
(8, 'Casual', 3, 0),
(9, 'Sports', 3, 0),
(10, 'Dogs', 4, 0),
(11, 'Cats', 4, 0),
(12, 'Others', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userlogins`
--

CREATE TABLE `tbl_userlogins` (
  `userlogin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(25) NOT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp(),
  `logout_time` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gender` enum('male','female','','') NOT NULL,
  `role` int(11) NOT NULL DEFAULT 3,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `gender`, `role`, `is_deleted`) VALUES
(1, 'Lori', 'Harvey', 'lharvey@gmail.com', 'lharvey', 'female', 3, 0),
(2, 'Evans', 'Otieno', 'eotieno@gmail.com', 'eotieno', 'male', 3, 0),
(3, 'Filly', 'Jimmy', 'fjimmy@gmail.com', 'fjimmy', 'male', 3, 0),
(4, 'Selina', 'Atieno', 'sotieno@gmail.com', 'sotieno', 'female', 3, 0),
(5, 'Mwai', 'Michael', 'gathirumwai@gmail.com', 'root', 'male', 1, 0),
(13, 'Grace', 'Pendo', 'gpendo@gmail.com', 'gpendo', 'female', 3, 0),
(21, 'Calvin', 'Kinyanjui', 'ckinyanjui@gmail.com', 'ckinyajui', 'male', 3, 0),
(22, 'Hannah', 'Gitonga', 'hgitonga@gmail.com', 'hgitonga', 'female', 3, 0),
(26, 'Jackson', 'Cole', 'jcole@gmail.com', 'jcole', 'male', 3, 0),
(27, 'Alex', 'Nyore', 'alexnyore5@gmail.com', 'someting', 'male', 3, 0),
(28, 'Maria', 'Hannah', 'mhannah@gmail.com', 'mhannah', 'female', 3, 0),
(29, 'Saumu', 'Swaleh', 'sswaleh@gmail.com', 'sswaleh', 'female', 3, 0),
(30, 'Takeoff', 'Migos', 'tmigos@gmail.com', 'tmigos', 'male', 3, 0),
(31, 'Treddy', 'Nzioki', 'tnzioki@gmail.com', 'tnzioki', 'male', 3, 0),
(33, 'Marcus', 'Rashford', 'mrashford@gmail.com', 'mrashford', 'male', 3, 0),
(34, 'Erling', 'Haaland', 'ehaaland@gmail.com', 'ehaaland', 'male', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet`
--

CREATE TABLE `tbl_wallet` (
  `wallet_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount_available` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2022-02-10 13:57:15'),
(11, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-11.png?v=1644472553', NULL, 2, '2022-02-10 13:55:52', '2022-02-10 13:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 4, 'Shop101', 'Shop 101 Owner', '09123456788', 'shop101', 'ee6c4d4ba80f29dd389f0deb8863de69', 'uploads/vendors/1.png?v=1644375053', 1, 0, '2022-02-09 10:50:53', '2022-02-10 13:43:21'),
(2, '202202-00002', 1, 'Shop102', 'John Miller', '09123456789', 'shop102', '90be022251077e3488c998613214df74', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2022-02-09 10:52:09', '2022-02-09 17:02:54'),
(3, '202202-00003', 2, 'test', 'test', '123123123', 'test', '098f6bcd4621d373cade4e832627b4f6', 'uploads/vendors/3.png?v=1644471934', 1, 1, '2022-02-10 13:45:34', '2022-02-10 13:50:15'),
(12, '', 4, 'Flora', 'Flora', '1111', 'flo', 'b59c67bf196a4758191e42f76670ceba', 'accomodate.png', 1, 0, '2022-09-11 17:38:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`ClothNo`),
  ADD KEY `SupplierNo` (`SupplierNo`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeNo`),
  ADD KEY `OrderNo` (`OrderNo`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderNo`),
  ADD KEY `UserNo` (`UserNo`),
  ADD KEY `ClothNo` (`ClothNo`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`PurchaseNo`),
  ADD KEY `EmployeeNo` (`EmployeeNo`),
  ADD KEY `UserNo` (`UserNo`);

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierNo`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `tbl_complain`
--
ALTER TABLE `tbl_complain`
  ADD PRIMARY KEY (`complain_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`);

--
-- Indexes for table `tbl_paymenttypes`
--
ALTER TABLE `tbl_paymenttypes`
  ADD PRIMARY KEY (`paymenttype_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_name` (`product_name`);

--
-- Indexes for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  ADD PRIMARY KEY (`productimages_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `subcategory_name` (`subcategory_name`);

--
-- Indexes for table `tbl_userlogins`
--
ALTER TABLE `tbl_userlogins`
  ADD PRIMARY KEY (`userlogin_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`);

--
-- Indexes for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_complain`
--
ALTER TABLE `tbl_complain`
  MODIFY `complain_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  MODIFY `productimages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_userlogins`
--
ALTER TABLE `tbl_userlogins`
  MODIFY `userlogin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clothes`
--
ALTER TABLE `clothes`
  ADD CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`SupplierNo`) REFERENCES `suppliers` (`SupplierNo`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`OrderNo`) REFERENCES `orders` (`OrderNo`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ClothNo`) REFERENCES `clothes` (`ClothNo`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`EmployeeNo`) REFERENCES `employees` (`EmployeeNo`);

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
--
-- Database: `ecommerce1`
--
CREATE DATABASE IF NOT EXISTS `ecommerce1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce1`;

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

CREATE TABLE `clothes` (
  `ClothNo` int(10) NOT NULL,
  `ClothName` varchar(25) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `Price` int(10) NOT NULL,
  `Amount` int(10) NOT NULL,
  `SupplierNo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeNo` int(10) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Sex` varchar(25) NOT NULL,
  `OrderNo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderNo` int(11) NOT NULL,
  `UserNo` int(11) NOT NULL,
  `ClothNo` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(25) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` varchar(25) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `PurchaseNo` int(10) NOT NULL,
  `UserNo` int(10) NOT NULL,
  `EmployeeNo` int(10) NOT NULL,
  `ClothName` varchar(25) NOT NULL,
  `Price` int(10) NOT NULL,
  `PurchaseStatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierNo` int(10) NOT NULL,
  `SupplierName` varchar(25) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `SupplierStatus` varchar(25) NOT NULL,
  `Amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `user_id`, `product_id`, `name`, `price`, `image`, `quantity`) VALUES
(88, 0, 4, 'Dark green T-Shirt', '500', '26.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`, `is_deleted`) VALUES
(1, 'Men', 0),
(2, 'Ladies', 0),
(3, 'Children', 0),
(4, 'Pets', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_products` varchar(255) NOT NULL,
  `order_amount` double NOT NULL,
  `order_status` enum('Pending','Paid','Delivered') NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` enum('M-Pesa','Bank Account','Cash on Delivery','') NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `user_id`, `total_products`, `order_amount`, `order_status`, `created_at`, `payment_type`, `updated_at`, `is_deleted`) VALUES
(1, 4, 'White Suit ( 1 ), White Dress ( 2 )', 9000, 'Delivered', '2022-07-12 17:37:00', 'Cash on Delivery', '2022-07-12 17:37:00', 0),
(2, 4, 'Purple T-shirt ( 1 )', 500, 'Delivered', '2022-07-12 18:08:20', 'M-Pesa', '2022-07-12 18:08:20', 0),
(3, 28, 'White Sweatpants ( 1 ), Blue T-Shirt ( 1 )', 2300, 'Delivered', '2022-07-13 08:32:02', 'M-Pesa', '2022-07-13 08:32:02', 0),
(4, 32, 'Bicycle ( 1 )', 10000, 'Delivered', '2022-07-13 09:19:59', 'M-Pesa', '2022-07-13 09:19:59', 0),
(5, 4, 'Purple T-shirt ( 1 )', 500, 'Delivered', '2022-08-23 16:19:09', 'M-Pesa', '2022-08-23 16:19:09', 0),
(6, 4, 'Dark green T-Shirt ( 4 )', 2000, 'Delivered', '2022-08-23 16:45:56', 'M-Pesa', '2022-08-23 16:45:56', 0),
(7, 4, 'Dark green T-Shirt ( 2 )', 1000, 'Pending', '2022-08-23 16:47:15', 'M-Pesa', '2022-08-23 16:47:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderdetails`
--

CREATE TABLE `tbl_orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) NOT NULL,
  `product_image` varchar(40) NOT NULL,
  `product_price` double NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_status` enum('Pending','Paid','','') NOT NULL DEFAULT 'Pending',
  `payment_type` enum('M-Pesa','Bank Account','Cash on Delivery','') NOT NULL,
  `orderdetails_total` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orderdetails`
--

INSERT INTO `tbl_orderdetails` (`orderdetails_id`, `order_id`, `user_id`, `product_id`, `product_name`, `product_image`, `product_price`, `order_quantity`, `order_status`, `payment_type`, `orderdetails_total`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 65, 4, 18, 'White Dress', 'WhiteDress.jpg', 2000, 2, 'Pending', 'Cash on Delivery', 4000, '2022-07-12 17:36:59', '2022-07-12 17:36:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_paymenttypes`
--

CREATE TABLE `tbl_paymenttypes` (
  `paymenttype_id` int(11) NOT NULL,
  `paymenttype_name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_image` varchar(40) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  `subcategory_name` text DEFAULT NULL,
  `category_name` text NOT NULL,
  `product_keywords` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `product_description`, `product_image`, `unit_price`, `available_quantity`, `subcategory_name`, `category_name`, `product_keywords`, `created_at`, `updated_at`, `added_by`, `is_deleted`) VALUES
(1, 'Blue T-Shirt', 'The shirt is blue in color', '1.jpg', 1200, 25, 'Casual', 'Ladies', 'blue, t-shirt, casual, ladies', '2022-06-21 22:47:53', '2022-06-21 22:47:53', NULL, NULL),
(2, 'White T-Shirt', 'The shirt is white in color. A product of Calvin Klein.', '24.jpg', 1500, 20, 'Casual', 'Children', 'white, t-shirt, casual, children', '2022-06-21 22:48:41', '2022-06-21 22:48:41', NULL, NULL),
(3, 'Purple Trenchcoat', 'The trenchcoat is purple. ', '6.jpg', 3000, 10, 'Formal', 'Children', 'purple, trenchcoat, formal, children', '2022-06-21 22:49:39', '2022-06-21 22:49:39', NULL, NULL),
(4, 'Dark green T-Shirt', 'The shirt is dark green in color. A product of Lacoste.', '26.jpg', 500, 50, 'Casual', 'Men', 'dark-green, t-shirt, casual, men', '2022-06-21 22:51:25', '2022-06-21 22:51:25', NULL, NULL),
(5, 'Purple T-shirt', 'The t-shirt is purple in color', '16.jpg', 500, 50, 'Casual', 'Ladies', 'purple, casual, ladies', '2022-06-28 10:47:32', '2022-06-28 10:47:32', NULL, NULL),
(6, 'Black Sweater', 'The sweater is black in color. A product of polo.', '21.jpg', 2000, 15, 'Formal', 'Men', 'black, sweater, formal, men', '2022-06-28 10:50:59', '2022-06-28 10:50:59', NULL, NULL),
(7, 'Blue Jacket', 'The puff jacket is blue in color.', '8.jpg', 3000, 25, 'Formal', 'Ladies', 'blue, jacket, formal, ladies', '2022-06-28 10:53:22', '2022-06-28 10:53:22', NULL, NULL),
(8, 'Black Suit', 'The suit is black in color.', 'pexels-teddy-joseph-2955375.jpg', 5000, 10, 'Formal', 'Men', 'black, suit, formal, men', '2022-06-28 10:55:36', '2022-06-28 10:55:36', NULL, NULL),
(9, 'Black Socks', 'The socks are black.', 'pexels-ryutaro-tsukata-5746098.jpg', 100, 50, 'Sports', 'Children', 'black, socks, sports, children', '2022-06-28 10:56:48', '2022-06-28 10:56:48', NULL, NULL),
(10, 'Sweater', 'The sweater is red in color that can be worn by pets.', 'Pets1.jpg', 1000, 20, 'Dogs', 'Pets', 'sweater, dogs, pets', '2022-06-28 10:59:06', '2022-06-28 10:59:06', NULL, NULL),
(11, 'Cream Shirt', 'The shirt is cream in color. The product is from Lacoste.', 'pexels-brenner-oliveira-10495156.jpg', 1500, 30, 'Formal', 'Men', 'cream, shirt, formal, men', '2022-06-28 12:26:44', '2022-06-28 12:26:44', NULL, NULL),
(12, 'Blue Sweater', 'The sweater is blue in color.', 'pexels-teddy-tavan-4890733.jpg', 5500, 15, 'Casual', 'Men', 'blue, sweater, casual, men', '2022-06-28 12:27:31', '2022-06-28 12:27:31', NULL, NULL),
(13, 'Kitenge Shirt', 'The shirt is a kitenge best for hot weather.', 'pexels-mikhail-nilov-7624298.jpg', 800, 35, 'Casual', 'Men', 'kitenge, shirt, casual, men', '2022-06-28 12:29:43', '2022-06-28 12:29:43', NULL, NULL),
(14, 'Red T-Shirt', 'The red T-shirt is best for sports. Product from Nike.', 'pexels-pnw-production-8979858.jpg', 1300, 20, 'Sports', 'Men', 'red, t-shirt, sports, men', '2022-06-28 12:35:39', '2022-06-28 12:35:39', NULL, NULL),
(15, 'White Trouser', 'The white trouser is best for hot weather and can be worn in beaches. ', 'pexels-mwabonje-5875803.jpg', 900, 15, 'Casual', 'Men', 'white, trouser, casual, men', '2022-06-28 12:37:53', '2022-06-28 12:37:53', NULL, NULL),
(16, 'Orange Dress', 'The orange dress is a product from Zara.', 'pexels-mikhail-nilov-7682670.jpg', 1200, 25, 'Casual', 'Ladies', 'orange, dress, casual, ladies', '2022-06-28 12:47:23', '2022-06-28 12:47:23', NULL, NULL),
(17, 'White Sweatpants', 'The white sweatpants is a product from Nike.', 'pexels-styves-exantus-8514111.jpg', 1100, 30, 'Sports', 'Ladies', 'white, sweatpants, sports, ladies', '2022-06-28 12:48:28', '2022-06-28 12:48:28', NULL, NULL),
(18, 'White Dress', 'The white dress is best for official environments.', 'WhiteDress.jpg', 2000, 30, 'Formal', 'Ladies', 'white, dress, formal, ladies', '2022-06-28 12:50:38', '2022-06-28 12:50:38', NULL, NULL),
(19, 'White wedding Gown', 'The wedding gown is white in color.', '4.jpg', 10000, 15, 'Casual', 'Ladies', 'white, wedding, gown, casual, ladies', '2022-06-28 12:58:36', '2022-06-28 12:58:36', NULL, NULL),
(20, 'White Suit', 'The white suit is best for official environments.', '5.jpg', 5000, 15, 'Formal', 'Ladies', 'white, suit, formal, ladies', '2022-06-28 12:59:43', '2022-06-28 12:59:43', NULL, NULL),
(21, 'Black Sweatpants', 'The product is from Adidas.', 'product-12.jpg', 2000, 20, 'Casual', 'Children', 'black, sweatpants, casual, children', '2022-06-28 13:02:28', '2022-06-28 13:02:28', NULL, NULL),
(22, 'Sweater', 'The product is from Polo.', 'pexels-amina-filkins-5559985.jpg', 1300, 50, 'Casual', 'Children', 'sweater, casual, children', '2022-06-28 13:05:45', '2022-06-28 13:05:45', NULL, NULL),
(23, 'Turquoise T-Shirt', 'The T-Shirt is long sleeved. The product is best for cold weather.', 'pexels-norma-mortenson-7303182.jpg', 2000, 20, 'Casual', 'Children', 'turquoise t-shirt, casual, children', '2022-06-28 13:07:54', '2022-06-28 13:07:54', NULL, NULL),
(24, 'Orange Tracksuit', 'The product is from Adidas.', 'category-2.jpg', 1500, 30, 'Sports', 'Children', 'orange, tracksuit, sports, children  ', '2022-06-28 13:11:38', '2022-06-28 13:11:38', NULL, NULL),
(25, 'Grey Sweatpants', 'The tracksuit is best for sports.', 'buy-3.jpg', 1500, 20, 'Casual', 'Children', 'grey, sweatpants, casual, children', '2022-06-28 13:13:20', '2022-06-28 13:13:20', NULL, NULL),
(26, 'Sweater', 'The sweater is black and white that cats can wear.', 'Cat1.jpg', 1500, 15, 'Cats', 'Pets', 'sweater, cats, pets', '2022-06-28 21:32:18', '2022-06-28 21:32:18', NULL, NULL),
(27, 'Dress', 'The dress is small enough to be worn by rabbits.', 'Rabbit1.webp', 2000, 20, 'Others', 'Pets', 'dress, others, pets', '2022-06-28 21:40:25', '2022-06-28 21:40:25', NULL, NULL),
(28, 'Basketball Vest', 'The product is best for basketball games and can also be worn as a casual cloth.', 'Basketball Vest.jpg', 5000, 28, 'Sports', 'Men', 'basketball, vest, sports, men', '2022-06-29 08:40:22', '2022-06-29 08:40:22', NULL, NULL),
(29, 'Purple Jersey', 'The jersey is from the Lakers team.', 'Jersey2.jpg', 2000, 20, 'Sports', 'Men', 'purple, jersey, sports, men', '2022-07-06 08:36:41', '2022-07-06 08:36:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productimages`
--

CREATE TABLE `tbl_productimages` (
  `productimages_id` int(11) NOT NULL,
  `product_image` varchar(40) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_productimages`
--

INSERT INTO `tbl_productimages` (`productimages_id`, `product_image`, `product_id`, `created_at`, `updated_at`, `added_by`, `is_deleted`) VALUES
(1, '1.jpg', 0, '2022-06-21 22:47:53', '2022-06-21 22:47:53', 0, 0),
(2, '24.jpg', 0, '2022-06-21 22:48:41', '2022-06-21 22:48:41', 0, 0),
(3, '6.jpg', 0, '2022-06-21 22:49:39', '2022-06-21 22:49:39', 0, 0),
(4, '26.jpg', 0, '2022-06-21 22:51:25', '2022-06-21 22:51:25', 0, 0),
(5, '16.jpg', 0, '2022-06-28 10:47:32', '2022-06-28 10:47:32', 0, 0),
(6, '21.jpg', 0, '2022-06-28 10:50:59', '2022-06-28 10:50:59', 0, 0),
(7, '8.jpg', 0, '2022-06-28 10:53:22', '2022-06-28 10:53:22', 0, 0),
(8, 'pexels-teddy-joseph-2955375.jpg', 0, '2022-06-28 10:55:36', '2022-06-28 10:55:36', 0, 0),
(9, 'pexels-ryutaro-tsukata-5746098.jpg', 0, '2022-06-28 10:56:48', '2022-06-28 10:56:48', 0, 0),
(10, 'Pets1.jpg', 0, '2022-06-28 10:59:06', '2022-06-28 10:59:06', 0, 0),
(11, 'pexels-brenner-oliveira-10495156.jpg', 0, '2022-06-28 12:26:44', '2022-06-28 12:26:44', 0, 0),
(12, 'pexels-the-lazy-artist-gallery-1342609.j', 0, '2022-06-28 12:27:31', '2022-06-28 12:27:31', 0, 0),
(13, 'pexels-mikhail-nilov-7624298.jpg', 0, '2022-06-28 12:29:43', '2022-06-28 12:29:43', 0, 0),
(14, 'pexels-pnw-production-8979858.jpg', 0, '2022-06-28 12:35:39', '2022-06-28 12:35:39', 0, 0),
(15, 'pexels-mwabonje-5875803.jpg', 0, '2022-06-28 12:37:54', '2022-06-28 12:37:54', 0, 0),
(16, 'pexels-mikhail-nilov-7682670.jpg', 0, '2022-06-28 12:47:23', '2022-06-28 12:47:23', 0, 0),
(17, 'pexels-styves-exantus-8514111.jpg', 0, '2022-06-28 12:48:28', '2022-06-28 12:48:28', 0, 0),
(18, '2.jpg', 0, '2022-06-28 12:50:38', '2022-06-28 12:50:38', 0, 0),
(19, '4.jpg', 0, '2022-06-28 12:58:36', '2022-06-28 12:58:36', 0, 0),
(20, '5.jpg', 0, '2022-06-28 12:59:43', '2022-06-28 12:59:43', 0, 0),
(21, '2.jpg', 0, '2022-06-28 13:02:28', '2022-06-28 13:02:28', 0, 0),
(22, 'pexels-amina-filkins-5559985.jpg', 0, '2022-06-28 13:05:45', '2022-06-28 13:05:45', 0, 0),
(23, 'pexels-norma-mortenson-7303182.jpg', 0, '2022-06-28 13:07:54', '2022-06-28 13:07:54', 0, 0),
(24, 'category-2.jpg', 0, '2022-06-28 13:11:38', '2022-06-28 13:11:38', 0, 0),
(25, 'buy-3.jpg', 0, '2022-06-28 13:13:20', '2022-06-28 13:13:20', 0, 0),
(26, 'Cat1.jpg', 0, '2022-06-28 21:32:18', '2022-06-28 21:32:18', 0, 0),
(27, 'Rabbit1.webp', 0, '2022-06-28 21:40:25', '2022-06-28 21:40:25', 0, 0),
(28, 'Basketball Vest.jpg', 0, '2022-06-29 08:40:22', '2022-06-29 08:40:22', 0, 0),
(29, 'Jersey2.jpg', 0, '2022-07-06 08:36:42', '2022-07-06 08:36:42', 0, 0),
(30, 'Sugar.jpg', 0, '2022-07-06 09:49:35', '2022-07-06 09:49:35', 0, 0),
(31, 'Bicycle1.jpg', 0, '2022-07-13 09:14:06', '2022-07-13 09:14:06', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(15) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`role_id`, `role_name`, `is_deleted`) VALUES
(1, 'Admin', 0),
(2, 'Employee', 0),
(3, 'User', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategories`
--

CREATE TABLE `tbl_subcategories` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(25) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_subcategories`
--

INSERT INTO `tbl_subcategories` (`subcategory_id`, `subcategory_name`, `category_id`, `is_deleted`) VALUES
(1, 'Formal', 1, 0),
(2, 'Casual', 1, 0),
(3, 'Sports', 1, 0),
(4, 'Formal', 2, 0),
(5, 'Casual', 2, 0),
(6, 'Sports', 2, 0),
(7, 'Formal', 3, 0),
(8, 'Casual', 3, 0),
(9, 'Sports', 3, 0),
(10, 'Dogs', 4, 0),
(11, 'Cats', 4, 0),
(12, 'Others', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userlogins`
--

CREATE TABLE `tbl_userlogins` (
  `userlogin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(25) NOT NULL,
  `login_time` datetime NOT NULL DEFAULT current_timestamp(),
  `logout_time` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gender` enum('male','female','','') NOT NULL,
  `role` int(11) NOT NULL DEFAULT 3,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `gender`, `role`, `is_deleted`) VALUES
(1, 'Lori', 'Harvey', 'lharvey@gmail.com', 'lharvey', 'female', 3, 0),
(2, 'Evans', 'Otieno', 'eotieno@gmail.com', 'eotieno', 'male', 3, 0),
(3, 'Filly', 'Jimmy', 'fjimmy@gmail.com', 'fjimmy', 'male', 3, 0),
(4, 'Selina', 'Atieno', 'sotieno@gmail.com', 'sotieno', 'female', 3, 0),
(5, 'Mwai', 'Michael', 'gathirumwai@gmail.com', 'root', 'male', 1, 0),
(13, 'Grace', 'Pendo', 'gpendo@gmail.com', 'gpendo', 'female', 3, 0),
(21, 'Calvin', 'Kinyanjui', 'ckinyanjui@gmail.com', 'ckinyajui', 'male', 3, 0),
(22, 'Hannah', 'Gitonga', 'hgitonga@gmail.com', 'hgitonga', 'female', 3, 0),
(26, 'Jackson', 'Cole', 'jcole@gmail.com', 'jcole', 'male', 3, 0),
(27, 'Alex', 'Nyore', 'alexnyore5@gmail.com', 'someting', 'male', 3, 0),
(28, 'Maria', 'Hannah', 'mhannah@gmail.com', 'mhannah', 'female', 3, 0),
(29, 'Saumu', 'Swaleh', 'sswaleh@gmail.com', 'sswaleh', 'female', 3, 0),
(30, 'Takeoff', 'Migos', 'tmigos@gmail.com', 'tmigos', 'male', 3, 0),
(31, 'Treddy', 'Nzioki', 'tnzioki@gmail.com', 'tnzioki', 'male', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet`
--

CREATE TABLE `tbl_wallet` (
  `wallet_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount_available` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserNo` int(10) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Sex` varchar(25) NOT NULL,
  `OrderNo` int(10) NOT NULL,
  `ClothName` varchar(25) NOT NULL,
  `PurchaseStatus` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `PhoneNo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `UserNo` int(25) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Sex` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `PhoneNo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users1`
--

INSERT INTO `users1` (`UserNo`, `FName`, `LName`, `Sex`, `Password`, `PhoneNo`) VALUES
(1893, 'Grace', 'Uba', 'Female', 'guba', '0745697821'),
(1893, 'Grace', 'Uba', 'Female', 'guba', '0745697821'),
(1893, 'Grace', 'Uba', 'Female', 'guba', '0745697821'),
(1893, 'Grace', 'Uba', 'Female', 'guba', '0745697821'),
(1893, 'Grace', 'Uba', 'Female', 'guba', '0745697821'),
(0, '', '', '', '', ''),
(0, '', '', '', '', ''),
(0, '', '', '', '', ''),
(1893, 'Kelly', 'Maria', 'Female', 'kmaria', '0756215897'),
(1893, 'Kelly', 'Maria', 'Female', 'kmaria', '0756215897'),
(1893, 'Kelly', 'Maria', 'Female', 'kmaria', '0756215897'),
(90400, 'Fondo', 'Phil', 'Male', 'vaseline', '0128975687'),
(8495, 'Harry', 'Milner', 'Male', 'hmilner', '0798165478'),
(0, 'Lori', 'Harvey', 'Female', 'lharvey', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clothes`
--
ALTER TABLE `clothes`
  ADD PRIMARY KEY (`ClothNo`),
  ADD KEY `SupplierNo` (`SupplierNo`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeNo`),
  ADD KEY `OrderNo` (`OrderNo`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderNo`),
  ADD KEY `UserNo` (`UserNo`),
  ADD KEY `ClothNo` (`ClothNo`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`PurchaseNo`),
  ADD KEY `EmployeeNo` (`EmployeeNo`),
  ADD KEY `UserNo` (`UserNo`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierNo`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`);

--
-- Indexes for table `tbl_paymenttypes`
--
ALTER TABLE `tbl_paymenttypes`
  ADD PRIMARY KEY (`paymenttype_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_name` (`product_name`);

--
-- Indexes for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  ADD PRIMARY KEY (`productimages_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `subcategory_name` (`subcategory_name`);

--
-- Indexes for table `tbl_userlogins`
--
ALTER TABLE `tbl_userlogins`
  ADD PRIMARY KEY (`userlogin_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `first_name` (`first_name`),
  ADD KEY `last_name` (`last_name`);

--
-- Indexes for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserNo`),
  ADD KEY `OrderNo` (`OrderNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  MODIFY `productimages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_userlogins`
--
ALTER TABLE `tbl_userlogins`
  MODIFY `userlogin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clothes`
--
ALTER TABLE `clothes`
  ADD CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`SupplierNo`) REFERENCES `suppliers` (`SupplierNo`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`OrderNo`) REFERENCES `orders` (`OrderNo`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`OrderNo`) REFERENCES `users` (`OrderNo`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ClothNo`) REFERENCES `clothes` (`ClothNo`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`UserNo`) REFERENCES `users` (`UserNo`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`EmployeeNo`) REFERENCES `employees` (`EmployeeNo`);
--
-- Database: `eshopping`
--
CREATE DATABASE IF NOT EXISTS `eshopping` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eshopping`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_as`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gathiru Mwai', 'gathirumwai@gmail.com', NULL, '$2y$10$Tb8weOMWft4F/1xKHMP8/utx5AQ9.q.0C14bhlSKd7kqEWcS2zuxS', 1, NULL, '2022-10-02 07:13:51', '2022-10-02 07:13:51'),
(2, 'Alexnyore', 'alexnyore5@gmail.com', NULL, '$2y$10$AZh/fQl3.aEtTovT5vHYduXLcNexvERpgIElpc2iG.CCSLw4YNuQi', 0, NULL, '2022-10-02 08:59:13', '2022-10-02 08:59:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `exercise`
--
CREATE DATABASE IF NOT EXISTS `exercise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exercise`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`) VALUES
('Stivo', 'simple');
--
-- Database: `makiniclinic`
--
CREATE DATABASE IF NOT EXISTS `makiniclinic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `makiniclinic`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Appointment_id` int(25) NOT NULL,
  `Patient_id` varchar(255) NOT NULL,
  `PhoneNo` varchar(50) NOT NULL,
  `Doctor_id` varchar(25) NOT NULL,
  `Appointment_date` date NOT NULL,
  `Appointment_time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `Doctor_No` int(25) NOT NULL,
  `Doctor_id` varchar(25) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Sex` enum('Male','Female','','') NOT NULL,
  `PhoneNo` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `Availability` enum('Yes','No','','') NOT NULL DEFAULT 'Yes',
  `Profession` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`Doctor_No`, `Doctor_id`, `FName`, `LName`, `Sex`, `PhoneNo`, `password`, `Availability`, `Profession`) VALUES
(1, '315649', 'John', 'Moses', 'Male', '0789562389', 'jmoses', 'Yes', 'Physician'),
(2, '314642', 'James', 'Milner', 'Male', '0726231519', 'jmilner', 'Yes', 'Physician');

-- --------------------------------------------------------

--
-- Table structure for table `out_patients`
--

CREATE TABLE `out_patients` (
  `Patient_No` int(255) NOT NULL,
  `Patient_id` varchar(6) NOT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `LName` varchar(255) NOT NULL,
  `PhoneNo` varchar(25) NOT NULL,
  `Sex` varchar(50) NOT NULL,
  `Illness` varchar(255) DEFAULT NULL,
  `Doctor_id` int(25) DEFAULT NULL,
  `Discharged` enum('Yes','No','','') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `out_patients`
--

INSERT INTO `out_patients` (`Patient_No`, `Patient_id`, `FName`, `LName`, `PhoneNo`, `Sex`, `Illness`, `Doctor_id`, `Discharged`) VALUES
(1, '321649', 'Maria', 'Yvonne', '0142378951', 'Female', 'Malaria', 315649, 'Yes'),
(2, '714356', 'Lorna', 'Rhodes', '0145248321', 'Female', 'Malaria', 314642, 'Yes'),
(3, '901251', 'Dennis', 'Morgan', '0134512672', 'Male', 'Sore Throat', 314642, 'Yes'),
(4, '214512', 'Peter', 'Macharia', '0124563955', 'Male', 'Malaria', 314642, 'Yes'),
(5, '612465', 'Owen', 'Mwangi', '0125463984', 'Male', 'Pneumonia', 314642, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `Patient_No` int(25) NOT NULL,
  `Patient_id` varchar(6) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Sex` varchar(11) NOT NULL,
  `PhoneNo` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`Patient_No`, `Patient_id`, `FName`, `LName`, `Sex`, `PhoneNo`, `password`) VALUES
(1, '315647', 'John', 'Kamau', 'Male', '0132569121', 'jkamau'),
(2, '321649', 'Maria', 'Yvonne', 'Female', '0142378951', 'myvonne'),
(3, '714356', 'Lorna', 'Rhodes', 'Female', '0145218321', 'lrhodes'),
(4, '901251', 'Dennis', 'Morgan', 'Male', '0134512672', 'dmorgan'),
(5, '214512', 'Peter', 'Macharia', 'Male', '0124563955', 'pmacharia'),
(6, '512364', 'Rebecca', 'Wamae', 'Female', '0217566325', 'rwamae'),
(7, '945236', 'Rose', 'Purity', 'Female', '0125469835', 'rpurity'),
(8, '612465', 'Owen', 'Mwangi', 'Male', '0125463984', 'omwangi');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `product_id` int(25) NOT NULL,
  `product_type` varchar(25) NOT NULL,
  `product_quantity` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`product_id`, `product_type`, `product_quantity`) VALUES
(1, 'Analgesics', 50),
(2, 'Antibiotics', 100),
(3, 'Vaccines', 60),
(4, 'Supplements', 45);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_id` int(25) NOT NULL,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Sex` enum('Male','Female','','') NOT NULL,
  `PhoneNo` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_id`, `FName`, `LName`, `Sex`, `PhoneNo`, `Password`) VALUES
(1, 'Hannah', 'Kelly', 'Female', '0722176197', 'hkelly');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Appointment_id`),
  ADD UNIQUE KEY `No` (`PhoneNo`) USING BTREE;

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`Doctor_No`) USING BTREE;

--
-- Indexes for table `out_patients`
--
ALTER TABLE `out_patients`
  ADD PRIMARY KEY (`Patient_No`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`Patient_No`),
  ADD UNIQUE KEY `PhoneNo` (`PhoneNo`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Appointment_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `out_patients`
--
ALTER TABLE `out_patients`
  MODIFY `Patient_No` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `Patient_No` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `product_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`PhoneNo`) REFERENCES `patients` (`PhoneNo`);
--
-- Database: `mike`
--
CREATE DATABASE IF NOT EXISTS `mike` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mike`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ecommerce\",\"table\":\"users1\"},{\"db\":\"ecommerce\",\"table\":\"users\"},{\"db\":\"ebuy\",\"table\":\"users\"},{\"db\":\"ebuy\",\"table\":\"product_list\"},{\"db\":\"eshopping\",\"table\":\"users\"},{\"db\":\"ecommerce\",\"table\":\"tbl_users\"},{\"db\":\"ecommerce\",\"table\":\"tbl_complain\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-10-04 17:33:18', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
