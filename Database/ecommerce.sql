-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2022 at 02:48 PM
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
-- Table structure for table `tbl_complain`
--

CREATE TABLE `tbl_complain` (
  `complain_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complain` varchar(255) DEFAULT NULL,
  `responce` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complain`
--

INSERT INTO `tbl_complain` (`complain_id`, `user_id`, `complain`, `responce`) VALUES
(55, 69, 'hhdhdh', 'Pending');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
