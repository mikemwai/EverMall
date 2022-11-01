-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2022 at 10:38 PM
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
-- Database: `ecommerce`
--

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
(1, 1, 3, 1500, '2022-02-10 09:56:49'),
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

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_id`, `name`, `price`, `image`, `product_details`) VALUES
(81, 34, 'Royal blue shirt', '2000', 'Professor.jpg', 'The shirt is royal blue in color');

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
(26, NULL, 2, 'Blue Shirt', 'The shirt is blue', 2000, '1.jpg', 1, 0, '2022-10-04 18:14:40', NULL),
(27, NULL, 2, 'Blue Jacket', 'The jacket is blue.', 3000, '8.jpg', 1, 0, '2022-10-05 09:08:32', NULL);

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
-- Table structure for table `stkpush`
--

CREATE TABLE `stkpush` (
  `id` int(11) NOT NULL,
  `OrderNo` int(11) NOT NULL,
  `Amount` int(250) NOT NULL,
  `Phone` varchar(250) NOT NULL,
  `CheckoutRequestID` varchar(250) NOT NULL,
  `MerchantRequestID` varchar(250) NOT NULL,
  `mpesaReceiptNumber` varchar(250) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stkpush`
--

INSERT INTO `stkpush` (`id`, `OrderNo`, `Amount`, `Phone`, `CheckoutRequestID`, `MerchantRequestID`, `mpesaReceiptNumber`, `datecreated`) VALUES
(1, 0, 1, '254799373855', 'ws_CO_01112022131505635799373855', '28884-44125095-1', '', '2022-11-01 10:21:19'),
(2, 0, 1, '254799373855', 'ws_CO_01112022133044747799373855', '536-48735420-2', '', '2022-11-01 10:30:46'),
(3, 0, 1, '254799373855', 'ws_CO_01112022133102929799373855', '536-48735420-3', '', '2022-11-01 10:31:04'),
(4, 0, 1, '254799373855', 'ws_CO_01112022133657057799373855', '7389-36993281-1', '', '2022-11-01 10:36:58'),
(5, 0, 1, '254799373855', 'ws_CO_01112022133714186799373855', '105459-58576977-1', '', '2022-11-01 10:37:15'),
(6, 0, 1, '254799373855', 'ws_CO_01112022133845758799373855', '528-48758310-1', '', '2022-11-01 10:38:47'),
(7, 0, 1, '254799373855', 'ws_CO_01112022134000780799373855', '518-48761835-1', '', '2022-11-01 10:40:02'),
(8, 0, 1, '254799373855', 'ws_CO_01112022134227248799373855', '7105-39159044-1', '', '2022-11-01 10:42:28'),
(9, 0, 1, '254799373855', 'ws_CO_01112022134430151799373855', '31693-44753299-1', '', '2022-11-01 10:44:31'),
(10, 0, 1, '254799373855', 'ws_CO_01112022160559357799373855', '18560-58225419-2', '', '2022-11-01 13:06:01'),
(11, 0, 1, '254726231519', 'ws_CO_01112022160949645726231519', '68443-79102667-1', '', '2022-11-01 13:09:51'),
(12, 0, 1, '254799373855', 'ws_CO_01112022161152262799373855', '120570-52749171-1', '', '2022-11-01 13:11:54'),
(13, 0, 1, '254799373855', 'ws_CO_01112022161321041799373855', '18555-58246048-1', '', '2022-11-01 13:13:22'),
(14, 0, 1, '254799373855', 'ws_CO_01112022164706399799373855', '7111-39677236-1', '', '2022-11-01 13:47:08'),
(15, 0, 1, '254799373855', 'ws_CO_01112022165606635799373855', '522-49336729-1', '', '2022-11-01 13:56:08'),
(16, 0, 1, '254799373855', 'ws_CO_01112022170200094799373855', '7112-39721760-1', '', '2022-11-01 14:02:02'),
(17, 0, 1, '254799373855', 'ws_CO_01112022170337111799373855', '18556-58392451-1', '', '2022-11-01 14:03:40'),
(18, 0, 1, '254799373855', 'ws_CO_01112022171411940799373855', '28888-44820353-1', '', '2022-11-01 14:14:13'),
(19, 0, 1, '254799373855', 'ws_CO_01112022171549858799373855', '31692-45376842-1', '', '2022-11-01 14:15:51'),
(20, 0, 1, '254799373855', 'ws_CO_01112022171633378799373855', '7111-39766396-1', '', '2022-11-01 14:16:35'),
(21, 0, 1, '254726231519', 'ws_CO_01112022210155687726231519', '7382-38423110-1', '', '2022-11-01 18:01:55'),
(22, 0, 1, '254726231519', 'ws_CO_01112022211202756726231519', '528-50259769-1', '', '2022-11-01 18:12:02'),
(23, 0, 1, '254726231519', 'ws_CO_01112022211601287726231519', '28895-45691236-1', '', '2022-11-01 18:16:03'),
(24, 0, 1, '254726231519', 'ws_CO_01112022211905739726231519', '120576-53803848-1', '', '2022-11-01 18:19:05'),
(25, 0, 1, '254726231519', 'ws_CO_01112022212531495726231519', '28894-45719677-1', '', '2022-11-01 18:25:31'),
(26, 0, 1, '254726231519', 'ws_CO_01112022213020562726231519', '105445-60110032-1', '', '2022-11-01 18:30:23'),
(27, 0, 1, '254722176197', 'ws_CO_01112022214142042722176197', '518-50348294-1', '', '2022-11-01 18:41:44'),
(28, 0, 1, '254726231519', 'ws_CO_01112022222907335726231519', '7376-38659661-1', '', '2022-11-01 19:29:09'),
(29, 0, 1, '254726231519', 'ws_CO_01112022223225496726231519', '11226-46648267-1', '', '2022-11-01 19:32:25'),
(30, 0, 1, '254726231519', 'ws_CO_01112022225145095726231519', '28893-45933622-1', '', '2022-11-01 19:51:47');

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
  `vendor_id` int(10) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `user_id`, `vendor_id`, `product_id`, `name`, `price`, `image`, `quantity`) VALUES
(113, 33, 5, 5, 'Purple T-shirt', '500', '16.jpg', 1),
(114, 22, 22, 8, 'Black Suit', '5000', 'pexels-teddy-joseph-2955375.jpg', 1),
(115, 0, 0, 1, 'Blue T-Shirt', '1200', 'product-4.jpg', 1),
(133, 26, 2, 2, 'White T-Shirt', '1500', '24.jpg', 1);

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
(2, 'Women', 0),
(3, 'Children', 0),
(4, 'Others', 0),
(5, 'Health', 0),
(6, 'Beauty', 0),
(7, 'Fashion', 0),
(8, 'Electricals', 0),
(9, 'Garden&Outdoor', 0),
(10, 'BabyProducts', 0),
(11, 'Home', 0),
(12, 'Office', 0),
(13, 'Sports', 0);

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
  `vendor_id` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(40) NOT NULL,
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

INSERT INTO `tbl_order` (`order_id`, `user_id`, `vendor_id`, `phone`, `address`, `total_products`, `order_amount`, `order_status`, `created_at`, `payment_type`, `updated_at`, `is_deleted`) VALUES
(1, 4, '1', '', '', 'White Suit ( 1 ), White Dress ( 2 )', 9000, 'Delivered', '2022-07-12 17:37:00', 'Cash on Delivery', '2022-07-12 17:37:00', 0),
(2, 4, '2', '', '', 'Purple T-shirt ( 1 )', 500, 'Delivered', '2022-07-12 18:08:20', 'M-Pesa', '2022-07-12 18:08:20', 0),
(3, 28, '33', '', '', 'White Sweatpants ( 1 ), Blue T-Shirt ( 1 )', 2300, 'Delivered', '2022-07-13 08:32:02', 'M-Pesa', '2022-07-13 08:32:02', 0),
(4, 32, '2', '', '', 'Bicycle ( 1 )', 10000, 'Delivered', '2022-07-13 09:19:59', 'M-Pesa', '2022-07-13 09:19:59', 0),
(34, 33, '2', '0799373855', '766', 'Black Suit (12) , Black Sweatpants (1) , Purple T-shirt (1) ', 62500, 'Pending', '2022-11-01 13:26:32', 'M-Pesa', '2022-11-01 13:26:32', 0),
(35, 33, '3', '0799373855', '766', 'Black Suit (12) , Black Sweatpants (1) , Purple T-shirt (1) ', 62500, 'Pending', '2022-11-01 13:27:58', 'M-Pesa', '2022-11-01 13:27:58', 0),
(47, 1, '0', '0799373855', '766', 'Purple T-shirt (1) , Black Sweater (1) ', 2500, 'Paid', '2022-11-01 15:57:48', 'M-Pesa', '2022-11-01 15:57:48', 0),
(48, 1, '0', '0799373855', '766', 'Black Sweater (1) ', 2000, 'Paid', '2022-11-01 16:05:54', 'M-Pesa', '2022-11-01 16:05:54', 0),
(49, 1, '0', '0799373855', '766', 'Black Sweater (1) ', 2000, 'Paid', '2022-11-01 16:13:16', 'M-Pesa', '2022-11-01 16:13:16', 0),
(50, 1, '4', '0799373855', '766', 'Black Sweater (1) ', 2000, 'Paid', '2022-11-01 16:46:59', 'M-Pesa', '2022-11-01 16:46:59', 0),
(51, 33, '4', '0799373855', '766', 'Blue Jacket (1) , Black Suit (1) ', 8000, 'Paid', '2022-11-01 16:55:59', 'M-Pesa', '2022-11-01 16:55:59', 0),
(52, 33, '4', '0799373855', '766', 'Blue Jacket (1) , Black Suit (1) ', 8000, 'Paid', '2022-11-01 17:01:55', 'M-Pesa', '2022-11-01 17:01:55', 0),
(53, 33, '5', '0799373855', '766', 'Purple T-shirt (1) ', 500, 'Paid', '2022-11-01 17:03:32', 'M-Pesa', '2022-11-01 17:03:32', 0),
(54, 33, '5', '0799373855', '766', 'Purple T-shirt (1) ', 500, 'Paid', '2022-11-01 17:14:07', 'M-Pesa', '2022-11-01 17:14:07', 0),
(55, 33, '5', '0799373855', '766', 'Purple T-shirt (1) ', 500, 'Paid', '2022-11-01 17:16:21', 'M-Pesa', '2022-11-01 17:16:21', 0),
(56, 31, '28', '0726231519', '5026', 'Blue T-Shirt (1) , Red Dress (1) ', 5700, 'Paid', '2022-11-01 21:01:11', 'M-Pesa', '2022-11-01 21:01:11', 0),
(57, 31, '28', '0726231519', '5026', 'Blue T-Shirt (1) , Red Dress (1) ', 5700, 'Paid', '2022-11-01 21:11:54', 'M-Pesa', '2022-11-01 21:11:54', 0),
(58, 28, '4', '0726231519', '5026', 'Pink Marvin (1) , Turquoise T-Shirt (1) ', 4000, 'Paid', '2022-11-01 21:15:55', 'M-Pesa', '2022-11-01 21:15:55', 0),
(59, 28, '34', '0726231519', '5026', 'Black speaker (1) , Orange Dress (1) ', 4700, 'Paid', '2022-11-01 21:18:58', 'M-Pesa', '2022-11-01 21:18:58', 0),
(60, 28, '33', '0726231519', '5026', 'Royal blue shirt (1) , Halloween Costume (1) ', 4000, 'Paid', '2022-11-01 21:25:24', 'M-Pesa', '2022-11-01 21:25:24', 0),
(61, 28, '27', '0726231519', '5026', 'Sweater (1) , Blue Sweater (1) ', 6500, 'Paid', '2022-11-01 21:30:16', 'M-Pesa', '2022-11-01 21:30:16', 0),
(62, 28, '21, 13', '0726231519', '5026', 'Blue Jacket (1) , Black Sweater (1) ', 5000, 'Paid', '2022-11-01 21:41:30', 'M-Pesa', '2022-11-01 21:41:30', 0),
(63, 4, '2, 1', '0726231519', '5026', '19 White wedding Gown (1) , 18 White Dress (1) ', 12000, 'Paid', '2022-11-01 22:29:03', 'M-Pesa', '2022-11-01 22:29:03', 0),
(64, 4, '26, 29', '0726231519', '5026', '9 Black Socks (1) , 12 Blue Sweater (1) ', 5600, 'Paid', '2022-11-01 22:32:17', 'M-Pesa', '2022-11-01 22:32:17', 0),
(65, 28, '26', '0726231519', '5026', '9 Black Socks (1) ', 100, 'Paid', '2022-11-01 22:51:40', 'M-Pesa', '2022-11-01 22:51:40', 0);

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
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL,
  `vendor_id` varchar(25) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `needed_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `vendor_id`, `product_id`, `product_name`, `needed_quantity`) VALUES
(1, '26', 9, 'Black Socks', 1),
(2, '26', 9, 'Black Socks', 1),
(3, '26', 9, 'Black Socks', 1);

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
  `vendor_id` int(30) NOT NULL,
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

INSERT INTO `tbl_product` (`product_id`, `vendor_id`, `product_name`, `product_description`, `product_image`, `unit_price`, `available_quantity`, `subcategory_name`, `category_name`, `product_keywords`, `created_at`, `updated_at`, `added_by`, `is_deleted`) VALUES
(1, 1, 'Blue T-Shirt', 'The shirt is blue in color', 'product-4.jpg', 1200, 25, 'Casual', 'Health', 'blue, t-shirt, casual, ladies', '2022-06-21 22:47:53', '2022-06-21 22:47:53', NULL, NULL),
(2, 2, 'White T-Shirt', 'The shirt is white in color. A product of Calvin Klein.', '24.jpg', 1500, 20, 'Formal', 'Health', 'white, t-shirt, casual, children', '2022-06-21 22:48:41', '2022-06-21 22:48:41', NULL, NULL),
(3, 3, 'Purple Trenchcoat', 'The trenchcoat is purple. ', '6.jpg', 3000, 10, 'Sports', 'Health', 'purple, trenchcoat, formal, children', '2022-06-21 22:49:39', '2022-06-21 22:49:39', NULL, NULL),
(4, 4, 'Dark green T-Shirt', 'The shirt is dark green in color. A product of Lacoste.', '26.jpg', 500, 50, 'Casual', 'Health', 'dark-green, t-shirt, casual, men', '2022-06-21 22:51:25', '2022-06-21 22:51:25', NULL, NULL),
(5, 5, 'Purple T-shirt', 'The t-shirt is purple in color', '16.jpg', 500, 50, 'Formal', 'Beauty', 'purple, casual, ladies', '2022-06-28 10:47:32', '2022-06-28 10:47:32', NULL, NULL),
(6, 13, 'Black Sweater', 'The sweater is black in color. A product of polo.', '21.jpg', 2000, 15, 'Casual', 'Beauty', 'black, sweater, formal, men', '2022-06-28 10:50:59', '2022-06-28 10:50:59', NULL, NULL),
(7, 21, 'Blue Jacket', 'The puff jacket is blue in color.', '8.jpg', 3000, 25, 'Casual', 'Beauty', 'blue, jacket, formal, ladies', '2022-06-28 10:53:22', '2022-06-28 10:53:22', NULL, NULL),
(8, 22, 'Black Suit', 'The suit is black in color.', 'pexels-teddy-joseph-2955375.jpg', 5000, 10, 'Formal', 'Beauty', 'black, suit, formal, men', '2022-06-28 10:55:36', '2022-06-28 10:55:36', NULL, NULL),
(9, 26, 'Black Socks', 'The socks are black.', 'pexels-ryutaro-tsukata-5746098.jpg', 100, 50, 'Casual', 'Fashion', 'black, socks, sports, children', '2022-06-28 10:56:48', '2022-06-28 10:56:48', NULL, NULL),
(10, 27, 'Sweater', 'The sweater is red in color that can be worn by pets.', 'Pets1.jpg', 1000, 20, 'Dogs', 'Fashion', 'sweater, dogs, pets', '2022-06-28 10:59:06', '2022-06-28 10:59:06', NULL, NULL),
(11, 28, 'Cream Shirt', 'The shirt is cream in color. The product is from Lacoste.', 'pexels-brenner-oliveira-10495156.jpg', 1500, 30, 'Casual', 'Fashion', 'cream, shirt, formal, men', '2022-06-28 12:26:44', '2022-06-28 12:26:44', NULL, NULL),
(12, 29, 'Blue Sweater', 'The sweater is blue in color.', 'pexels-teddy-tavan-4890733.jpg', 5500, 15, 'Casual', 'Fashion', 'blue, sweater, casual, men', '2022-06-28 12:27:31', '2022-06-28 12:27:31', NULL, NULL),
(13, 30, 'Kitenge Shirt', 'The shirt is a kitenge best for hot weather.', 'pexels-mikhail-nilov-7624298.jpg', 800, 35, 'Casual', 'Electricals', 'kitenge, shirt, casual, men', '2022-06-28 12:29:43', '2022-06-28 12:29:43', NULL, NULL),
(14, 31, 'Red T-Shirt', 'The red T-shirt is best for sports. Product from Nike.', 'pexels-pnw-production-8979858.jpg', 1300, 20, 'Sports', 'Electricals', 'red, t-shirt, sports, men', '2022-06-28 12:35:39', '2022-06-28 12:35:39', NULL, NULL),
(15, 33, 'White Trouser', 'The white trouser is best for hot weather and can be worn in beaches. ', 'pexels-mwabonje-5875803.jpg', 900, 15, 'Formal', 'Electricals', 'white, trouser, casual, men', '2022-06-28 12:37:53', '2022-06-28 12:37:53', NULL, NULL),
(16, 34, 'Orange Dress', 'The orange dress is a product from Zara.', 'pexels-mikhail-nilov-7682670.jpg', 1200, 25, 'Casual', 'Electricals', 'orange, dress, casual, ladies', '2022-06-28 12:47:23', '2022-06-28 12:47:23', NULL, NULL),
(17, 35, 'White Sweatpants', 'The white sweatpants is a product from Nike.', 'pexels-styves-exantus-8514111.jpg', 1100, 30, 'Sports', 'Garden&Outdoor', 'white, sweatpants, sports, ladies', '2022-06-28 12:48:28', '2022-06-28 12:48:28', NULL, NULL),
(18, 1, 'White Dress', 'The white dress is best for official environments.', 'WhiteDress.jpg', 2000, 30, 'Casual', 'Garden&Outdoor', 'white, dress, formal, ladies', '2022-06-28 12:50:38', '2022-06-28 12:50:38', NULL, NULL),
(19, 2, 'White wedding Gown', 'The wedding gown is white in color.', '4.jpg', 10000, 15, 'Casual', 'Garden&Outdoor', 'white, wedding, gown, casual, ladies', '2022-06-28 12:58:36', '2022-06-28 12:58:36', NULL, NULL),
(20, 3, 'White Suit', 'The white suit is best for official environments.', '5.jpg', 5000, 15, 'Formal', 'Garden&Outdoor', 'white, suit, formal, ladies', '2022-06-28 12:59:43', '2022-06-28 12:59:43', NULL, NULL),
(21, 4, 'Black Sweatpants', 'The product is from Adidas.', 'product-12.jpg', 2000, 20, 'Casual', 'BabyProducts', 'black, sweatpants, casual, children', '2022-06-28 13:02:28', '2022-06-28 13:02:28', NULL, NULL),
(22, 5, 'Sweater', 'The product is from Polo.', 'pexels-amina-filkins-5559985.jpg', 1300, 50, 'Casual', 'BabyProducts', 'sweater, casual, children', '2022-06-28 13:05:45', '2022-06-28 13:05:45', NULL, NULL),
(23, 4, 'Turquoise T-Shirt', 'The T-Shirt is long sleeved. The product is best for cold weather.', 'pexels-norma-mortenson-7303182.jpg', 2000, 20, 'Casual', 'BabyProducts', 'turquoise t-shirt, casual, children', '2022-06-28 13:07:54', '2022-06-28 13:07:54', NULL, NULL),
(31, 4, 'Black Shirt', 'This shirt is black in colour.', 'user-2.png', 1000, 20, 'Casual', 'Home', 'Black Shirt, Men, Casual', '2022-10-17 11:50:04', '2022-10-17 11:50:04', NULL, NULL),
(33, 28, 'Pink Marvin', 'The marvin is pink in colour', 'Marvin.jpg', 2000, 20, 'Casual', 'BabyProducts', 'Pink, Pink Marvin, Casual, Ladies', '2022-10-17 17:58:34', '2022-10-17 17:58:34', NULL, NULL),
(34, 33, 'Royal blue shirt', 'The shirt is royal blue in color', 'Professor.jpg', 2000, 5, 'Formal', 'Office', 'Royal Blue, Royal Blue shirt, Casual, Men', '2022-10-17 20:12:27', '2022-10-17 20:12:27', NULL, NULL),
(35, 33, 'Cod Liver oil', 'The supplement helps children gain great immunity and brain growth.', 'Health.jpg', 2500, 30, 'Others', 'Health', 'Cod Liver oil, Others, Children', '2022-10-17 20:25:18', '2022-10-17 20:25:18', NULL, NULL),
(36, 33, 'Antibiotics', 'The antibiotics are very strong in treating diseases', 'Health1.jpg', 500, 10, 'Others', 'Health', 'Antibiotics, Children, Others', '2022-10-17 20:29:17', '2022-10-17 20:29:17', NULL, NULL),
(37, 28, 'Red Dress', 'The dress is red.', 'Dress.jpg', 4500, 30, 'Casual', 'Home', 'Red Dress, Casual, Women', '2022-10-19 08:30:33', '2022-10-19 08:30:33', NULL, NULL),
(38, 5, 'Halloween Costume', 'The halloween costume is white in colour.', 'Halloween.jpg', 2000, 10, 'Others', 'Sports', 'Halloween Costume, Others, Children', '2022-10-22 09:42:15', '2022-10-22 09:42:15', NULL, NULL),
(39, 4, 'Black speaker', 'The speaker is black with a lighting mechanism around it.', 'Speaker.jpg', 3500, 2, 'Others', 'Electricals', 'Black speaker, electricals, others', '2022-10-25 23:31:21', '2022-10-25 23:31:21', NULL, NULL);

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
(33, 'product-4.jpg', 0, '2022-09-28 08:59:32', '2022-09-28 08:59:32', 0, 0),
(34, '24.jpg', 0, '2022-10-04 20:51:30', '2022-10-04 20:51:30', 0, 0),
(35, 'Halloween.jpg', 0, '2022-10-22 09:42:15', '2022-10-22 09:42:15', 0, 0),
(36, 'product-4.jpg', 0, '2022-10-25 22:40:37', '2022-10-25 22:40:37', 0, 0),
(37, 'product-4.jpg', 0, '2022-10-25 22:41:36', '2022-10-25 22:41:36', 0, 0),
(38, 'product-4.jpg', 0, '2022-10-25 22:44:14', '2022-10-25 22:44:14', 0, 0),
(39, 'product-4.jpg', 0, '2022-10-25 22:44:56', '2022-10-25 22:44:56', 0, 0),
(40, '24.jpg', 0, '2022-10-25 22:45:50', '2022-10-25 22:45:50', 0, 0),
(41, '6.jpg', 0, '2022-10-25 22:46:10', '2022-10-25 22:46:10', 0, 0),
(42, '26.jpg', 0, '2022-10-25 22:46:31', '2022-10-25 22:46:31', 0, 0),
(43, '16.jpg', 0, '2022-10-25 22:46:58', '2022-10-25 22:46:58', 0, 0),
(44, '21.jpg', 0, '2022-10-25 22:47:24', '2022-10-25 22:47:24', 0, 0),
(45, '8.jpg', 0, '2022-10-25 22:47:42', '2022-10-25 22:47:42', 0, 0),
(46, 'pexels-teddy-joseph-2955375.jpg', 0, '2022-10-25 22:48:03', '2022-10-25 22:48:03', 0, 0),
(47, 'pexels-ryutaro-tsukata-5746098.jpg', 0, '2022-10-25 22:48:26', '2022-10-25 22:48:26', 0, 0),
(48, 'Pets1.jpg', 0, '2022-10-25 22:48:48', '2022-10-25 22:48:48', 0, 0),
(49, 'pexels-brenner-oliveira-10495156.jpg', 0, '2022-10-25 22:49:13', '2022-10-25 22:49:13', 0, 0),
(50, 'pexels-teddy-tavan-4890733.jpg', 0, '2022-10-25 22:49:34', '2022-10-25 22:49:34', 0, 0),
(51, 'pexels-mikhail-nilov-7624298.jpg', 0, '2022-10-25 22:49:57', '2022-10-25 22:49:57', 0, 0),
(52, 'pexels-pnw-production-8979858.jpg', 0, '2022-10-25 22:51:05', '2022-10-25 22:51:05', 0, 0),
(53, 'pexels-mwabonje-5875803.jpg', 0, '2022-10-25 22:51:38', '2022-10-25 22:51:38', 0, 0),
(54, 'pexels-mikhail-nilov-7682670.jpg', 0, '2022-10-25 22:52:04', '2022-10-25 22:52:04', 0, 0),
(55, 'pexels-styves-exantus-8514111.jpg', 0, '2022-10-25 23:16:38', '2022-10-25 23:16:38', 0, 0),
(56, 'WhiteDress.jpg', 0, '2022-10-25 23:17:07', '2022-10-25 23:17:07', 0, 0),
(57, '4.jpg', 0, '2022-10-25 23:18:56', '2022-10-25 23:18:56', 0, 0),
(58, '5.jpg', 0, '2022-10-25 23:19:31', '2022-10-25 23:19:31', 0, 0),
(59, 'product-12.jpg', 0, '2022-10-25 23:19:55', '2022-10-25 23:19:55', 0, 0),
(60, 'pexels-amina-filkins-5559985.jpg', 0, '2022-10-25 23:20:27', '2022-10-25 23:20:27', 0, 0),
(61, 'pexels-norma-mortenson-7303182.jpg', 0, '2022-10-25 23:20:48', '2022-10-25 23:20:48', 0, 0),
(62, 'user-2.png', 0, '2022-10-25 23:21:38', '2022-10-25 23:21:38', 0, 0),
(63, 'Health.jpg', 0, '2022-10-25 23:22:25', '2022-10-25 23:22:25', 0, 0),
(64, 'Health1.jpg', 0, '2022-10-25 23:22:44', '2022-10-25 23:22:44', 0, 0),
(65, 'Marvin.jpg', 0, '2022-10-25 23:23:10', '2022-10-25 23:23:10', 0, 0),
(66, 'Professor.jpg', 0, '2022-10-25 23:23:28', '2022-10-25 23:23:28', 0, 0),
(67, 'Dress.jpg', 0, '2022-10-25 23:23:50', '2022-10-25 23:23:50', 0, 0),
(68, 'Halloween.jpg', 0, '2022-10-25 23:24:12', '2022-10-25 23:24:12', 0, 0);

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
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_subcategories`
--

INSERT INTO `tbl_subcategories` (`subcategory_id`, `subcategory_name`, `is_deleted`) VALUES
(1, 'Formal', 0),
(2, 'Casual', 0),
(3, 'Sports', 0),
(4, 'Dogs', 0),
(5, 'Cats', 0),
(6, 'Others', 0);

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
(4, 'Selina', 'Otieno', 'sotieno@gmail.com', 'sotieno', 'female', 3, 0),
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
(34, 'Erling', 'Haaland', 'ehaaland@gmail.com', 'ehaaland', 'male', 3, 0),
(35, 'Lionel', 'Messi', 'lmessi@gmail.com', 'lmessi', 'male', 3, 0);

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
-- Indexes for table `stkpush`
--
ALTER TABLE `stkpush`
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
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `tbl_order_fk` (`vendor_id`);

--
-- Indexes for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stkpush`
--
ALTER TABLE `stkpush`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_complain`
--
ALTER TABLE `tbl_complain`
  MODIFY `complain_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tbl_orderdetails`
--
ALTER TABLE `tbl_orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_productimages`
--
ALTER TABLE `tbl_productimages`
  MODIFY `productimages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_subcategories`
--
ALTER TABLE `tbl_subcategories`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_userlogins`
--
ALTER TABLE `tbl_userlogins`
  MODIFY `userlogin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
