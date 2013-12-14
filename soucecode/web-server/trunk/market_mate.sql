-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2013 at 07:59 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `market_mate`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_phone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `type`, `company`, `website`, `email`, `number_phone`, `pic_app`, `pic_web`) VALUES
(1, 1, 'abc', 'www.google.com.vn', 'lvlinh96@gmail.com', '123456', '', ''),
(2, 1, 'xyz', 'www.bongda.com.vn', 'lvlinh96@gmail.com', '123456', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'dien tu', 'mac hang dienn tu'),
(2, 'Điện thoại', 'Mặc hàng điện thoại');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `comment`) VALUES
(1, 1, 7, 'đây là sản phẩm tốt'),
(2, 2, 7, 'nhìn cũng tạm được'),
(3, 3, 7, 'cũng khá ok');

-- --------------------------------------------------------

--
-- Table structure for table `currentcy`
--

CREATE TABLE IF NOT EXISTS `currentcy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currentcy` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `product_id`, `url`) VALUES
(1, 7, 'http://marketmatedemo1.freevnn.com/app/webroot/img/images_product/anh1.png'),
(2, 7, 'http://marketmatedemo1.freevnn.com/app/webroot/img/images_product/anh3.png'),
(3, 7, 'http://marketmatedemo1.freevnn.com/app/webroot/img/images_product/anh3.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `description`) VALUES
(1, 'giao tan noi', 'giao hang tan noi (phi 10000)');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `ward_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` date NOT NULL,
  `price` float NOT NULL,
  `promotion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `warranty` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `user_id`, `order_id`, `product_type_id`, `province_id`, `ward_id`, `name`, `create_date`, `price`, `promotion`, `warranty`, `description`) VALUES
(7, 1, 1, 1, 1, 1, 2, 547, 'san pham 1', '2013-11-06', 12.23, 'rtg rtg rtgr tg rtgrt grtg', 'rt grtg rtgr tgrtg', 'rtg rtgr tgrtg rtg'),
(8, 1, 1, 1, 1, 1, 0, 0, 'san pham 2', '2013-11-06', 34.12, 'r tgrt grt grtg rtgrt gr tgrtgrtg gtrtg', 'rgrt grtg rtg rtgr tgr tgrtgr tgrt grtg rtg rgt', 'rgrg rtgr tgr tgrtgrt grtg rtgrtg rtg rg');

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE IF NOT EXISTS `product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `description`) VALUES
(1, 'moi 100%', 'hang  moi 100%');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=65 ;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `title`, `code`, `published`, `ordering`) VALUES
(1, 'An Giang', '805', 1, 63),
(2, 'Bà Rịa - Vũng Tầu', '717', 1, 46),
(3, 'Bình Dương', '711', 1, 45),
(4, 'Bình Phước', '707', 1, 44),
(5, 'Bình Thuận', '715', 1, 43),
(6, 'Bình Định', '507', 1, 42),
(7, 'Bắc Giang', '221', 1, 41),
(8, 'Bắc Kạn', '207', 1, 40),
(9, 'Bắc Ninh', '223', 1, 39),
(10, 'Bến Tre', '811', 1, 38),
(11, 'Cao Bằng', '203', 1, 37),
(12, 'Cà Mau', '823', 1, 36),
(13, 'Cần Thơ', '815', 1, 35),
(14, 'Gia Lai', '603', 1, 34),
(15, 'Hà Giang', '201', 1, 47),
(16, 'Hà Nam', '111', 1, 48),
(17, 'Hà Nội', '101', 1, 49),
(18, 'Hà Tây', '105', 1, 62),
(19, 'Hà Tĩnh', '405', 1, 61),
(20, 'Hòa Bình', '305', 1, 60),
(21, 'Hưng Yên', '109', 1, 59),
(22, 'Hải Dương', '107', 1, 58),
(23, 'Hải Phòng', '103', 1, 57),
(24, 'Hồ Chí Minh', '701', 1, 1),
(25, 'Khánh Hòa', '511', 1, 56),
(27, 'Kiên Giang', '813', 1, 55),
(28, 'Kon Tum', '601', 1, 54),
(29, 'Lai Châu', '301', 1, 53),
(30, 'Long An', '801', 1, 52),
(31, 'Lào Cai', '205', 1, 51),
(32, 'Lâm Đồng', '703', 1, 50),
(33, 'Lạng Sơn', '209', 1, 33),
(34, 'Nam Định', '113', 1, 32),
(35, 'Nghệ An', '403', 1, 15),
(36, 'Ninh Bình', '117', 1, 14),
(37, 'Ninh Thuận', '705', 1, 13),
(38, 'Phú Thọ', '217', 1, 12),
(39, 'Phú Yên', '509', 1, 11),
(40, 'Quảng Bình', '407', 1, 10),
(41, 'Quảng Nam', '503', 1, 9),
(42, 'Quảng Ngãi', '505', 1, 7),
(43, 'Quảng Ninh', '225', 1, 6),
(44, 'Quảng Trị', '409', 1, 5),
(45, 'Sơn La', '303', 1, 4),
(46, 'Thanh Hóa', '401', 1, 3),
(47, 'Thái Bình', '115', 1, 2),
(48, 'Thái Nguyên', '215', 1, 16),
(49, 'Thừa Thiên - Huế', '411', 1, 17),
(50, 'Tiền Giang', '807', 1, 31),
(51, 'Trà Vinh', '817', 1, 30),
(52, 'Tuyên Quang', '211', 1, 29),
(53, 'Tây Ninh', '709', 1, 28),
(54, 'Vĩnh Long', '809', 1, 27),
(55, 'Vĩnh Phúc', '104', 1, 26),
(56, 'Yên Bái', '213', 1, 25),
(57, 'Đà Nẵng', '501', 1, 24),
(58, 'Đắk Lắk', '605', 1, 23),
(59, 'Đồng Nai', '713', 1, 22),
(60, 'Đồng Tháp', '803', 1, 21),
(61, 'Bạc Liêu', '821', 1, 20),
(62, 'Sóc Trăng', '819', 1, 19),
(63, 'Hậu Giang', '825', 1, 18),
(64, 'Đắk Nông', '607', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rate` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `product_id`, `rate`) VALUES
(1, 1, 7, 5),
(2, 2, 7, 4),
(3, 3, 7, 4),
(4, 1, 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE IF NOT EXISTS `socials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `name`, `description`) VALUES
(1, 'no-social', 'not use social'),
(2, 'facebook', '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `description`) VALUES
(1, 2, 'Android', 'Điện thoại android'),
(2, 2, 'IOS', 'Điện thoại IOS');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`) VALUES
(1, 1, 'JoExbioL5nvF9ZsjCXekbDhL4Szf00'),
(2, 1, 'AJxQ73PsJPhr0Lgg16BUpxFPejh057'),
(3, 10, 'WxcT5HmzIJyJLfsKIkkqyyS7J3iGdp'),
(4, 11, 'kstHciuwBvIYLY8Fp1cFLvTzxKFuXC'),
(5, 1, 'DcP3I6wLNWbIcbV7NNkGTftEmvYIy3'),
(6, 1, '00zRcShcoP7mLI6V4RF0w8MaORWxcT'),
(7, 1, 'osetXV4zj2nxGD7ZN5L0Qchbzk9Cbl'),
(8, 1, 'jTpyg8sOYT2tShpnZUfRKQMM7HKsAy'),
(9, 1, 'lL70i1b9P5KAEigpZuJcz1A3AJPAMY'),
(10, 1, 'URnzNu3SYy4JoF8uwUsYlRLyjEh4pQ'),
(11, 1, 'IQ6xhJmlH5DkcKU7u3ELOQPUQtVBQL'),
(12, 1, 'iNsfAAgvKoybnWGLArudWBj1zE082j');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_id` int(11) NOT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_word` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `number_phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table of users' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `social_id`, `user_name`, `pass_word`, `email_address`, `first_name`, `last_name`, `date_of_birth`, `number_phone`, `avatar`, `address`) VALUES
(1, 1, 'lvlinh96', '25d55ad283aa400af464c76d713c07ad', 'linh.le@digimate.me', 'vu linh', 'le', '1989-12-01', '0939836834', 'http://marketmatedemo1.freevnn.com/app/webroot/img/avatar/avatar2.jpg', '63-khuong viet'),
(2, 1, 'khoa.vu', '25d55ad283aa400af464c76d713c07ad', 'khoa.vu@digimate.me', 'khoa', 'vu', '1987-11-13', '5354535', 'http://marketmatedemo1.freevnn.com/app/webroot/img/avatar/avatar2.jpg', 'ho chi minh'),
(3, 1, 'phuc.tran', '25d55ad283aa400af464c76d713c07ad', 'phuc.tran@digimate.me', 'phuc', 'tran', '1987-11-13', '5354535', 'http://marketmatedemo1.freevnn.com/app/webroot/img/avatar/avatar3.jpg', 'ho chi minh');

-- --------------------------------------------------------

--
-- Table structure for table `user_notes`
--

CREATE TABLE IF NOT EXISTS `user_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_notes`
--

INSERT INTO `user_notes` (`id`, `user_id`, `category_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `product_id`, `url`) VALUES
(1, 7, 'dg đgd gd gdgdg d');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE IF NOT EXISTS `wards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `ordering` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_province` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=681 ;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `title`, `province_id`, `code`, `published`, `ordering`) VALUES
(2, 'Quận Ba Đình', 17, '10101', 1, 5),
(3, 'Quận Tây Hồ', 17, '10103', 1, 5),
(4, 'Quận Hoàn Kiếm', 17, '10105', 1, 5),
(5, 'Quận Hai Bà Trưng', 17, '10107', 1, 5),
(6, 'Quận Đống Đa', 17, '10109', 1, 5),
(7, 'Quận Thanh Xuân', 17, '10111', 1, 5),
(8, 'Quận Cầu Giấy', 17, '10113', 1, 5),
(9, 'Huyện Sóc Sơn', 17, '10115', 1, 5),
(10, 'Huyện Đông Anh', 17, '10117', 1, 5),
(11, 'Huyện Gia Lâm', 17, '10119', 1, 5),
(12, 'Huyện Từ Liêm', 17, '10121', 1, 5),
(13, 'Huyện Thanh Trì', 17, '10123', 1, 5),
(15, 'Quận Hồng Bàng', 23, '10301', 1, 5),
(16, 'Quận Ngô Quyền', 23, '10303', 1, 5),
(17, 'Quận Lê Chân', 23, '10305', 1, 5),
(18, 'Quận Kiến An', 23, '10307', 1, 5),
(19, 'Thị xã Đồ Sơn', 23, '10309', 1, 5),
(20, 'Huyện Thuỷ Nguyên', 23, '10311', 1, 5),
(21, 'Huyện An Hải', 23, '10313', 1, 5),
(22, 'Huyện An Lão', 23, '10315', 1, 5),
(23, 'Huyện Kiến Thuỵ', 23, '10317', 1, 5),
(24, 'Huyện Tiên Lãng', 23, '10319', 1, 5),
(25, 'Huyện Vĩnh Bảo', 23, '10321', 1, 5),
(26, 'Huyện Cát Hải', 23, '10323', 1, 5),
(27, 'Huyện Bạch Long Vĩ', 23, '10325', 1, 5),
(29, 'Thị xã Vĩnh Yên', 55, '10401', 1, 5),
(30, 'Huyện Lập Thạch', 55, '10403', 1, 5),
(31, 'Huyện Tam Dương', 55, '10405', 1, 5),
(32, 'Huyện Vĩnh Tường', 55, '10407', 1, 5),
(33, 'Huyện Yên Lạc', 55, '10409', 1, 5),
(34, 'Huyện Mê Linh', 55, '10411', 1, 5),
(35, 'Huyện Bình Xuyên', 55, '10413', 1, 5),
(37, 'Thị xã Hà Đông', 18, '10501', 1, 5),
(38, 'Thị xã Sơn Tây', 18, '10503', 1, 5),
(39, 'Huyện Ba Vì', 18, '10505', 1, 5),
(40, 'Huyện Phúc Thọ', 18, '10507', 1, 5),
(41, 'Huyện Đan Phượng', 18, '10509', 1, 5),
(42, 'Huyện Thạch Thất', 18, '10511', 1, 5),
(43, 'Huyện Hoài Đức', 18, '10513', 1, 5),
(44, 'Huyện Quốc Oai', 18, '10515', 1, 5),
(45, 'Huyện Chương Mỹ', 18, '10517', 1, 5),
(46, 'Huyện Thanh Oai', 18, '10519', 1, 5),
(47, 'Huyện Thường Tín', 18, '10521', 1, 5),
(48, 'Huyện Mỹ Đức', 18, '10523', 1, 5),
(49, 'Huyện ứng Hòa', 18, '10525', 1, 5),
(50, 'Huyện Phú Xuyên', 18, '10527', 1, 5),
(52, 'Thị xã Bắc Ninh', 9, '22301', 1, 5),
(53, 'Huyện Yên Phong', 9, '22303', 1, 5),
(54, 'Huyện Quế Võ', 9, '22305', 1, 5),
(55, 'Huyện Tiên Du', 9, '22307', 1, 5),
(56, 'Huyện Từ Sơn', 9, '22308', 1, 5),
(57, 'Huyện Thuận Thành', 9, '22309', 1, 5),
(58, 'Huyện Lương Tài', 9, '22311', 1, 5),
(59, 'Huyện Gia Bình', 9, '22312', 1, 5),
(61, 'Thành phố Hải Dương', 22, '10701', 1, 5),
(62, 'Huyện Chí Linh', 22, '10703', 1, 5),
(63, 'Huyện Nam Sách', 22, '10705', 1, 5),
(64, 'Huyện Thanh Hà', 22, '10707', 1, 5),
(65, 'Huyện Kinh Môn', 22, '10709', 1, 5),
(66, 'Huyện Kim Thành', 22, '10711', 1, 5),
(67, 'Huyện Gia Lộc', 22, '10713', 1, 5),
(68, 'Huyện Tứ Kỳ', 22, '10715', 1, 5),
(69, 'Huyện Cẩm Giàng', 22, '10717', 1, 5),
(70, 'Huyện Bình Giang', 22, '10719', 1, 5),
(71, 'Huyện Thanh Miện', 22, '10721', 1, 5),
(72, 'Huyện Ninh Giang', 22, '10723', 1, 5),
(74, 'Thị xã Hưng Yên', 21, '10901', 1, 5),
(75, 'Huyện Văn Lâm', 21, '10902', 1, 5),
(76, 'Huyện Mỹ Văn', 21, '10903', 1, 5),
(77, 'Huyện Yên Mỹ', 21, '10904', 1, 5),
(78, 'Huyện Châu Giang', 21, '10905', 1, 5),
(79, 'Huyện Khoái Châu', 21, '10906', 1, 5),
(80, 'Huyện Ân Thi', 21, '10907', 1, 5),
(81, 'Huyện Kim Động', 21, '10909', 1, 5),
(82, 'Huyện Phù Cừ', 21, '10911', 1, 5),
(83, 'Huyện Tiên Lữ', 21, '10913', 1, 5),
(85, 'Thị xã Phủ Lý', 16, '11101', 1, 5),
(86, 'Huyện Duy Tiên', 16, '11103', 1, 5),
(87, 'Huyện Kim Bảng', 16, '11105', 1, 5),
(88, 'Huyện Lý Nhân', 16, '11107', 1, 5),
(89, 'Huyện Thanh Liêm', 16, '11109', 1, 5),
(90, 'Huyện Bình Lục', 16, '11111', 1, 5),
(92, 'Thành phố Nam Định', 34, '11301', 1, 5),
(93, 'Huyện Vụ Bản', 34, '11303', 1, 5),
(94, 'Huyện Mỹ Lộc', 34, '11305', 1, 5),
(95, 'Huyện ý Yên', 34, '11307', 1, 5),
(96, 'Huyện Nam Trực', 34, '11309', 1, 5),
(97, 'Huyện Trực Ninh', 34, '11311', 1, 5),
(98, 'Huyện Xuân Trường', 34, '11313', 1, 5),
(99, 'Huyện Giao Thủy', 34, '11315', 1, 5),
(100, 'Huyện Nghĩa Hưng', 34, '11317', 1, 5),
(101, 'Huyện Hải Hậu', 34, '11319', 1, 5),
(103, 'Thị xã Thái Bình', 47, '11501', 1, 5),
(104, 'Huyện Quỳnh Phụ', 47, '11503', 1, 5),
(105, 'Huyện Hưng Hà', 47, '11505', 1, 5),
(106, 'Huyện Thái Thụy', 47, '11507', 1, 5),
(107, 'Huyện Đông Hưng', 47, '11509', 1, 5),
(108, 'Huyện Vũ Thư', 47, '11511', 1, 5),
(109, 'Huyện Kiến Xương', 47, '11513', 1, 5),
(110, 'Huyện Tiền Hải', 47, '11515', 1, 5),
(112, 'Thị xã Ninh Bình', 36, '11701', 1, 5),
(113, 'Thị xã Tam Điệp', 36, '11703', 1, 5),
(114, 'Huyện Nho Quan', 36, '11705', 1, 5),
(115, 'Huyện Gia Viễn', 36, '11707', 1, 5),
(116, 'Huyện Hoa Lư', 36, '11709', 1, 5),
(117, 'Huyện Yên Mô', 36, '11711', 1, 5),
(118, 'Huyện Yên Khánh', 36, '11713', 1, 5),
(119, 'Huyện Kim Sơn', 36, '11715', 1, 5),
(121, 'Thị xã Hà Giang', 15, '20101', 1, 5),
(122, 'Huyện Đồng Văn', 15, '20103', 1, 5),
(123, 'Huyện Mèo Vạc', 15, '20105', 1, 5),
(124, 'Huyện Yên Minh', 15, '20107', 1, 5),
(125, 'Huyện Quản Bạ', 15, '20109', 1, 5),
(126, 'Huyện Bắc Mê', 15, '20111', 1, 5),
(127, 'Huyện Hoàng Su Phì', 15, '20113', 1, 5),
(128, 'Huyện Vị Xuyên', 15, '20115', 1, 5),
(129, 'Huyện Xín Mần', 15, '20117', 1, 5),
(130, 'Huyện Bắc Quang', 15, '20119', 1, 5),
(132, 'Thị xã Cao Bằng', 11, '20301', 1, 5),
(133, 'Huyện Bảo Lạc', 11, '20303', 1, 5),
(134, 'Huyện Hà Quảng', 11, '20305', 1, 5),
(135, 'Huyện Thông Nông', 11, '20307', 1, 5),
(136, 'Huyện Trà Lĩnh', 11, '20309', 1, 5),
(137, 'Huyện Trùng Khánh', 11, '20311', 1, 5),
(138, 'Huyện Nguyên Bình', 11, '20313', 1, 5),
(139, 'Huyện Hoà An', 11, '20315', 1, 5),
(140, 'Huyện Quảng Hoà', 11, '20317', 1, 5),
(141, 'Huyện Hạ Lang', 11, '20319', 1, 5),
(142, 'Huyện Thạch An', 11, '20321', 1, 5),
(144, 'Thị xã Lào Cai', 31, '20501', 1, 5),
(145, 'Thị xã Cam Đường', 31, '20503', 1, 5),
(146, 'Huyện Mường Khương', 31, '20505', 1, 5),
(147, 'Huyện Bát Xát', 31, '20507', 1, 5),
(148, 'Huyện Bắc Hà', 31, '20509', 1, 5),
(149, 'Huyện Bảo Thắng', 31, '20511', 1, 5),
(150, 'Huyện Sa Pa', 31, '20513', 1, 5),
(151, 'Huyện Bảo Yên', 31, '20515', 1, 5),
(152, 'Huyện Than Uyên', 31, '20517', 1, 5),
(153, 'Huyện Văn Bàn', 31, '20519', 1, 5),
(155, 'Thị xã Bắc Kạn', 8, '20701', 1, 5),
(156, 'Huyện Ba Bể', 8, '20703', 1, 5),
(157, 'Huyện Ngân Sơn', 8, '20705', 1, 5),
(158, 'Huyện Chợ Đồn', 8, '20707', 1, 5),
(159, 'Huyện Na Rì', 8, '20709', 1, 5),
(160, 'Huyện Bạch Thông', 8, '20711', 1, 5),
(161, 'Huyện Chợ Mới', 8, '20713', 1, 5),
(163, 'Thị xã Lạng Sơn', 33, '20901', 1, 5),
(164, 'Huyện Tràng Định', 33, '20903', 1, 5),
(165, 'Huyện Văn Lãng', 33, '20905', 1, 5),
(166, 'Huyện Bình Gia', 33, '20907', 1, 5),
(167, 'Huyện Bắc Sơn', 33, '20909', 1, 5),
(168, 'Huyện Văn Quan', 33, '20911', 1, 5),
(169, 'Huyện Cao Lộc', 33, '20913', 1, 5),
(170, 'Huyện Lộc Bình', 33, '20915', 1, 5),
(171, 'Huyện Chi Lăng', 33, '20917', 1, 5),
(172, 'Huyện Đình Lập', 33, '20919', 1, 5),
(173, 'Huyện Hữu Lũng', 33, '20921', 1, 5),
(175, 'Thị xã Tuyên Quang', 52, '21101', 1, 5),
(176, 'Huyện Nà Hang', 52, '21103', 1, 5),
(177, 'Huyện Chiêm Hóa', 52, '21105', 1, 5),
(178, 'Huyện Hàm Yên', 52, '21107', 1, 5),
(179, 'Huyện Yên Sơn', 52, '21109', 1, 5),
(180, 'Huyện Sơn Dương', 52, '21111', 1, 5),
(182, 'Thị xã Yên Bái', 56, '21301', 1, 5),
(183, 'Thị xã Nghĩa Lộ', 56, '21303', 1, 5),
(184, 'Huyện Lục Yên', 56, '21305', 1, 5),
(185, 'Huyện Văn Yên', 56, '21307', 1, 5),
(186, 'Huyện Mù Căng Chải', 56, '21309', 1, 5),
(187, 'Huyện Trấn Yên', 56, '21311', 1, 5),
(188, 'Huyện Yên Bình', 56, '21313', 1, 5),
(189, 'Huyện Văn Chấn', 56, '21315', 1, 5),
(190, 'Huyện Trạm Tấu', 56, '21317', 1, 5),
(192, 'Thành phố Thái Nguyên', 48, '21501', 1, 5),
(193, 'Thị xã Sông Công', 48, '21503', 1, 5),
(194, 'Huyện Định Hóa', 48, '21505', 1, 5),
(195, 'Huyện Võ Nhai', 48, '21507', 1, 5),
(196, 'Huyện Phú Lương', 48, '21509', 1, 5),
(197, 'Huyện Đồng Hỷ', 48, '21511', 1, 5),
(198, 'Huyện Đại Từ', 48, '21513', 1, 5),
(199, 'Huyện Phú Bình', 48, '21515', 1, 5),
(200, 'Huyện Phổ Yên', 48, '21517', 1, 5),
(202, 'Thành phố Việt Trì', 38, '21701', 1, 5),
(203, 'Thị xã Phú Thọ', 38, '21703', 1, 5),
(204, 'Huyện Đoan Hùng', 38, '21705', 1, 5),
(205, 'Huyện Hạ Hoà', 38, '21707', 1, 5),
(206, 'Huyện Thanh Ba', 38, '21709', 1, 5),
(207, 'Huyện Phong Châu', 38, '21711', 1, 5),
(208, 'Huyện Lâm Thao', 38, '21712', 1, 5),
(209, 'Huyện Sông Thao', 38, '21713', 1, 5),
(210, 'Huyện Yên Lập', 38, '21715', 1, 5),
(211, 'Huyện Tam Thanh', 38, '21717', 1, 5),
(212, 'Huyện Thanh Thuỷ', 38, '21718', 1, 5),
(213, 'Huyện Thanh Sơn', 38, '21719', 1, 5),
(215, 'Thị xã Bắc Giang', 7, '22101', 1, 5),
(216, 'Huyện Yên Thế', 7, '22103', 1, 5),
(217, 'Huyện Tân Yên', 7, '22105', 1, 5),
(218, 'Huyện Lục Ngạn', 7, '22107', 1, 5),
(219, 'Huyện Hiệp Hòa', 7, '22109', 1, 5),
(220, 'Huyện Lạng Giang', 7, '22111', 1, 5),
(221, 'Huyện Sơn Động', 7, '22113', 1, 5),
(222, 'Huyện Lục Nam', 7, '22115', 1, 5),
(223, 'Huyện Việt Yên', 7, '22117', 1, 5),
(224, 'Huyện Yên Dũng', 7, '22119', 1, 5),
(226, 'Thành phố Hạ Long', 43, '22501', 1, 5),
(227, 'Thị xã Cẩm Phả', 43, '22503', 1, 5),
(228, 'Thị xã Uông Bí', 43, '22505', 1, 5),
(229, 'Huyện Bình Liêu', 43, '22507', 1, 5),
(230, 'Thị Xã Móng Cái', 43, '22509', 1, 5),
(231, 'Huyện Quảng Hà', 43, '22511', 1, 5),
(232, 'Huyện Tiên Yên', 43, '22513', 1, 5),
(233, 'Huyện Ba Chẽ', 43, '22515', 1, 5),
(234, 'Huyện Vân Đồn', 43, '22517', 1, 5),
(235, 'Huyện Hoành Bồ', 43, '22519', 1, 5),
(236, 'Huyện Đông Triều', 43, '22521', 1, 5),
(237, 'Huyện Cô Tô', 43, '22523', 1, 5),
(238, 'Huyện Yên Hưng', 43, '22525', 1, 5),
(240, 'Thị xã Điện Biên Phủ', 29, '30101', 1, 5),
(241, 'Thị xã Lai Châu', 29, '30103', 1, 5),
(242, 'Huyện Mường Tè', 29, '30105', 1, 5),
(243, 'Huyện Phong Thổ', 29, '30107', 1, 5),
(244, 'Huyện Sìn Hồ', 29, '30109', 1, 5),
(245, 'Huyện Mường Lay', 29, '30111', 1, 5),
(246, 'Huyện Tủa Chùa', 29, '30113', 1, 5),
(247, 'Huyện Tuần Giáo', 29, '30115', 1, 5),
(248, 'Huyện Điện Biên', 29, '30117', 1, 5),
(249, 'Huyện Điện Biên Đông', 29, '30119', 1, 5),
(251, 'Thị xã Sơn La', 45, '30301', 1, 5),
(252, 'Huyện Quỳnh Nhai', 45, '30303', 1, 5),
(253, 'Huyện Mường La', 45, '30305', 1, 5),
(254, 'Huyện Thuận Châu', 45, '30307', 1, 5),
(255, 'Huyện Bắc Yên', 45, '30309', 1, 5),
(256, 'Huyện Phù Yên', 45, '30311', 1, 5),
(257, 'Huyện Mai Sơn', 45, '30313', 1, 5),
(258, 'Huyện Sông Mã', 45, '30315', 1, 5),
(259, 'Huyện Yên Châu', 45, '30317', 1, 5),
(260, 'Huyện Mộc Châu', 45, '30319', 1, 5),
(262, 'Thị xã Hòa Bình', 20, '30501', 1, 5),
(263, 'Huyện Đà Bắc', 20, '30503', 1, 5),
(264, 'Huyện Mai Châu', 20, '30505', 1, 5),
(265, 'Huyện Kỳ Sơn', 20, '30507', 1, 5),
(266, 'Huyện Lương Sơn', 20, '30509', 1, 5),
(267, 'Huyện Kim Bôi', 20, '30511', 1, 5),
(268, 'Huyện Tân Lạc', 20, '30513', 1, 5),
(269, 'Huyện Lạc Sơn', 20, '30515', 1, 5),
(270, 'Huyện Lạc Thủy', 20, '30517', 1, 5),
(271, 'Huyện Yên Thủy', 20, '30519', 1, 5),
(273, 'Thành phố Thanh Hóa', 46, '40101', 1, 5),
(274, 'Thị xã Bỉm Sơn', 46, '40103', 1, 5),
(275, 'Thị xã Sầm Sơn', 46, '40105', 1, 5),
(276, 'Huyện Mường Lát', 46, '40107', 1, 5),
(277, 'Huyện Quan Hóa', 46, '40109', 1, 5),
(278, 'Huyện Quan Sơn', 46, '40111', 1, 5),
(279, 'Huyện Bá Thước', 46, '40113', 1, 5),
(280, 'Huyện Cẩm Thủy', 46, '40115', 1, 5),
(281, 'Huyện Lang Chánh', 46, '40117', 1, 5),
(282, 'Huyện Thạch Thành', 46, '40119', 1, 5),
(283, 'Huyện Ngọc Lạc', 46, '40121', 1, 5),
(284, 'Huyện Thường Xuân', 46, '40123', 1, 5),
(285, 'Huyện Như Xuân', 46, '40125', 1, 5),
(286, 'Huyện Như Thanh', 46, '40127', 1, 5),
(287, 'Huyện Vĩnh Lộc', 46, '40129', 1, 5),
(288, 'Huyện Hà Trung', 46, '40131', 1, 5),
(289, 'Huyện Nga Sơn', 46, '40133', 1, 5),
(290, 'Huyện Yên Định', 46, '40135', 1, 5),
(291, 'Huyện Thọ Xuân', 46, '40137', 1, 5),
(292, 'Huyện Hậu Lộc', 46, '40139', 1, 5),
(293, 'Huyện Thiệu Hoá', 46, '40141', 1, 5),
(294, 'Huyện Hoằng Hóa', 46, '40143', 1, 5),
(295, 'Huyện Đông Sơn', 46, '40145', 1, 5),
(296, 'Huyện Triệu Sơn', 46, '40147', 1, 5),
(297, 'Huyện Quảng Xương', 46, '40149', 1, 5),
(298, 'Huyện Nông Cống', 46, '40151', 1, 5),
(299, 'Huyện Tĩnh Gia', 46, '40153', 1, 5),
(301, 'Thành phố Vinh', 35, '40301', 1, 5),
(302, 'Thị xã Cửa Lò', 35, '40303', 1, 5),
(303, 'Huyện Quế Phong', 35, '40305', 1, 5),
(304, 'Huyện Quỳ Châu', 35, '40307', 1, 5),
(305, 'Huyện Kỳ Sơn', 35, '40309', 1, 5),
(306, 'Huyện Quỳ Hợp', 35, '40311', 1, 5),
(307, 'Huyện Nghĩa Đàn', 35, '40313', 1, 5),
(308, 'Huyện Tương Dương', 35, '40315', 1, 5),
(309, 'Huyện Quỳnh Lưu', 35, '40317', 1, 5),
(310, 'Huyện Tân Kỳ', 35, '40319', 1, 5),
(311, 'Huyện Con Cuông', 35, '40321', 1, 5),
(312, 'Huyện Yên Thành', 35, '40323', 1, 5),
(313, 'Huyện Diễn Châu', 35, '40325', 1, 5),
(314, 'Huyện Anh Sơn', 35, '40327', 1, 5),
(315, 'Huyện Đô Lương', 35, '40329', 1, 5),
(316, 'Huyện Thanh Chương', 35, '40331', 1, 5),
(317, 'Huyện Nghi Lộc', 35, '40333', 1, 5),
(318, 'Huyện Nam Đàn', 35, '40335', 1, 5),
(319, 'Huyện Hưng Nguyên', 35, '40337', 1, 5),
(321, 'Thị xã Hà Tĩnh', 19, '40501', 1, 5),
(322, 'Thị xã Hồng Lĩnh', 19, '40503', 1, 5),
(323, 'Huyện Nghi Xuân', 19, '40505', 1, 5),
(324, 'Huyện Đức Thọ', 19, '40507', 1, 5),
(325, 'Huyện Hương Sơn', 19, '40509', 1, 5),
(326, 'Huyện Can Lộc', 19, '40511', 1, 5),
(327, 'Huyện Thạch Hà', 19, '40513', 1, 5),
(328, 'Huyện Cẩm Xuyên', 19, '40515', 1, 5),
(329, 'Huyện Hương Khê', 19, '40517', 1, 5),
(330, 'Huyện Kỳ Anh', 19, '40519', 1, 5),
(332, 'Thị xã Đồng Hới', 40, '40701', 1, 5),
(333, 'Huyện Tuyên Hóa', 40, '40703', 1, 5),
(334, 'Huyện Minh Hóa', 40, '40705', 1, 5),
(335, 'Huyện Quảng Trạch', 40, '40707', 1, 5),
(336, 'Huyện Bố Trạch', 40, '40709', 1, 5),
(337, 'Huyện Quảng Ninh', 40, '40711', 1, 5),
(338, 'Huyện Lệ Thủy', 40, '40713', 1, 5),
(340, 'Thị xã Đông Hà', 44, '40901', 1, 5),
(341, 'Thị xã Quảng Trị', 44, '40903', 1, 5),
(342, 'Huyện Vĩnh Linh', 44, '40905', 1, 5),
(343, 'Huyện Gio Linh', 44, '40907', 1, 5),
(344, 'Huyện Cam Lộ', 44, '40909', 1, 5),
(345, 'Huyện Triệu Phong', 44, '40911', 1, 5),
(346, 'Huyện Hải Lăng', 44, '40913', 1, 5),
(347, 'Huyện Hướng Hóa', 44, '40915', 1, 5),
(348, 'Huyện Đa Krông', 44, '40917', 1, 5),
(350, 'Thành phố Huế', 49, '41101', 1, 5),
(351, 'Huyện Phong Điền', 49, '41103', 1, 5),
(352, 'Huyện Quảng Điền', 49, '41105', 1, 5),
(353, 'Huyện Hương Trà', 49, '41107', 1, 5),
(354, 'Huyện Phú Vang', 49, '41109', 1, 5),
(355, 'Huyện Hương Thủy', 49, '41111', 1, 5),
(356, 'Huyện Phú Lộc', 49, '41113', 1, 5),
(357, 'Huyện A Lưới', 49, '41115', 1, 5),
(358, 'Huyện Nam Đông', 49, '41117', 1, 5),
(360, 'Quận Hải Châu', 57, '50101', 1, 5),
(361, 'Quận Thanh Khê', 57, '50103', 1, 5),
(362, 'Quận Sơn Trà', 57, '50105', 1, 5),
(363, 'Quận Ngũ Hành Sơn', 57, '50107', 1, 5),
(364, 'Quận Liên Chiểu', 57, '50109', 1, 5),
(365, 'Huyện Hoà Vang', 57, '50111', 1, 5),
(366, 'Huyện Đảo Hoàng Sa', 57, '50113', 1, 5),
(368, 'Thị xã Tam Kỳ', 41, '50301', 1, 1),
(369, 'Thị xã Hội An', 41, '50303', 1, 2),
(370, 'Huyện Hiên', 41, '50305', 1, 13),
(371, 'Huyện Đại Lộc', 41, '50307', 1, 12),
(372, 'Huyện Điện Bàn', 41, '50309', 1, 11),
(373, 'Huyện Duy Xuyên', 41, '50311', 1, 10),
(374, 'Huyện Giằng', 41, '50313', 1, 9),
(375, 'Huyện Thăng Bình', 41, '50315', 1, 8),
(376, 'Huyện Quế Sơn', 41, '50317', 1, 7),
(377, 'Huyện Hiệp Đức', 41, '50319', 1, 6),
(378, 'Huyện Tiên Phước', 41, '50321', 1, 5),
(379, 'Huyện Phước Sơn', 41, '50323', 1, 4),
(380, 'Huyện Núi Thành', 41, '50325', 1, 3),
(381, 'Huyện Trà My', 41, '50327', 1, 14),
(383, 'Thị xã Quảng Ngãi', 42, '50501', 1, 5),
(384, 'Huyện Lý Sơn', 42, '50503', 1, 5),
(385, 'Huyện Bình Sơn', 42, '50505', 1, 5),
(386, 'Huyện Trà Bồng', 42, '50507', 1, 5),
(387, 'Huyện Sơn Tịnh', 42, '50509', 1, 5),
(388, 'Huyện Sơn Tây', 42, '50511', 1, 5),
(389, 'Huyện Sơn Hà', 42, '50513', 1, 5),
(390, 'Huyện Tư Nghĩa', 42, '50515', 1, 5),
(391, 'Huyện Nghĩa Hành', 42, '50517', 1, 5),
(392, 'Huyện Minh Long', 42, '50519', 1, 5),
(393, 'Huyện Mộ Đức', 42, '50521', 1, 5),
(394, 'Huyện Đức Phổ', 42, '50523', 1, 5),
(395, 'Huyện Ba Tơ', 42, '50525', 1, 5),
(397, 'Thành phố Qui Nhơn', 6, '50701', 1, 5),
(398, 'Huyện An Lão', 6, '50703', 1, 5),
(399, 'Huyện Hoài Nhơn', 6, '50705', 1, 5),
(400, 'Huyện Hoài Ân', 6, '50707', 1, 5),
(401, 'Huyện Phù Mỹ', 6, '50709', 1, 5),
(402, 'Huyện Vĩnh Thạnh', 6, '50711', 1, 5),
(403, 'Huyện Phù Cát', 6, '50713', 1, 5),
(404, 'Huyện Tây Sơn', 6, '50715', 1, 5),
(405, 'Huyện An Nhơn', 6, '50717', 1, 5),
(406, 'Huyện Tuy Phước', 6, '50719', 1, 5),
(407, 'Huyện Vân Canh', 6, '50721', 1, 5),
(409, 'Thành phố Tuy Hòa', 39, '50901', 1, 1),
(410, 'Huyện Đồng Xuân', 39, '50903', 1, 2),
(411, 'Huyện Sông Cầu', 39, '50905', 1, 3),
(412, 'Huyện Tuy An', 39, '50907', 1, 4),
(413, 'Huyện Sơn Hòa', 39, '50909', 1, 5),
(414, 'Huyện Đông Hòa', 39, '50911', 1, 6),
(415, 'Huyện Sông Hinh', 39, '50913', 1, 7),
(417, 'Thành phố Nha Trang', 25, '51101', 1, 5),
(418, 'Huyện Vạn Ninh', 25, '51103', 1, 5),
(419, 'Huyện Ninh Hòa', 25, '51105', 1, 5),
(420, 'Huyện Diên Khánh', 25, '51107', 1, 5),
(421, 'Huyện Cam Ranh', 25, '51109', 1, 5),
(422, 'Huyện Khánh Vĩnh', 25, '51111', 1, 5),
(423, 'Huyện Khánh Sơn', 25, '51113', 1, 5),
(424, 'Huyện Trường Sa', 25, '51115', 1, 5),
(426, 'Thị xã Kon Tum', 28, '60101', 1, 5),
(427, 'Huyện Đắk Glei', 28, '60103', 1, 5),
(428, 'Huyện Ngọc Hồi', 28, '60105', 1, 5),
(429, 'Huyện Đắk Tô', 28, '60107', 1, 5),
(430, 'Huyện Kon Plông', 28, '60109', 1, 5),
(431, 'Huyện Đak Hà', 28, '60111', 1, 5),
(432, 'Huyện Sa Thầy', 28, '60113', 1, 5),
(434, 'Thị xã Pleiku', 14, '60301', 1, 5),
(435, 'Huyện KBang', 14, '60303', 1, 5),
(436, 'Huyện Mang Yang', 14, '60305', 1, 5),
(437, 'Huyện Chư Păh', 14, '60307', 1, 5),
(438, 'Huyện Ia Grai', 14, '60309', 1, 5),
(439, 'Huyện An Khê', 14, '60311', 1, 5),
(440, 'Huyện Kông Chro', 14, '60313', 1, 5),
(441, 'Huyện Đức Cơ', 14, '60315', 1, 5),
(442, 'Huyện Chư Prông', 14, '60317', 1, 5),
(443, 'Huyện Chư Sê', 14, '60319', 1, 5),
(444, 'Huyện Ayun Pa', 14, '60321', 1, 5),
(445, 'Huyện Krông Pa', 14, '60323', 1, 5),
(447, 'Thành phố Buôn Ma Thuột', 58, '60501', 1, 5),
(448, 'Huyện Ea H''leo', 58, '60503', 1, 5),
(449, 'Huyện Ea Súp', 58, '60505', 1, 5),
(450, 'Huyện Krông Năng', 58, '60507', 1, 5),
(451, 'Huyện Krông Búk', 58, '60509', 1, 5),
(452, 'Huyện Buôn Đôn', 58, '60511', 1, 5),
(453, 'Huyện Cư M''gar', 58, '60513', 1, 5),
(454, 'Huyện Ea Kar', 58, '60515', 1, 5),
(455, 'Huyện M''Đrắk', 58, '60517', 1, 5),
(456, 'Huyện Krông Pắc', 58, '60519', 1, 5),
(457, 'Huyện Cư Jút', 64, '60703', 1, 2),
(458, 'Huyện Krông A Na', 58, '60523', 1, 5),
(459, 'Huyện Krông Bông', 58, '60525', 1, 5),
(460, 'Huyện Đắk Mil', 64, '60705', 1, 3),
(461, 'Huyện Krông Nô', 64, '60707', 1, 4),
(462, 'Huyện Lắk', 58, '60531', 1, 5),
(463, 'Huyện Đắk R''Lấp', 58, '60533', 1, 5),
(464, 'Huyện Đăk Glong', 64, '60701', 1, 5),
(466, 'Quận 1', 24, '70101', 1, 24),
(467, 'Quận 2', 24, '70103', 1, 15),
(468, 'Quận 3', 24, '70105', 1, 16),
(469, 'Quận 4', 24, '70107', 1, 17),
(470, 'Quận 5', 24, '70109', 1, 18),
(471, 'Quận 6', 24, '70111', 1, 19),
(472, 'Quận 7', 24, '70113', 1, 20),
(473, 'Quận 8', 24, '70115', 1, 21),
(474, 'Quận 9', 24, '70117', 1, 22),
(475, 'Quận 10', 24, '70119', 1, 1),
(476, 'Quận 11', 24, '70121', 1, 23),
(477, 'Quận 12', 24, '70123', 1, 14),
(478, 'Quận Gò Vấp', 24, '70125', 1, 13),
(479, 'Quận Tân Bình', 24, '70127', 1, 4),
(480, 'Quận Bình Thạnh', 24, '70129', 1, 11),
(481, 'Quận Phú Nhuận', 24, '70131', 1, 9),
(482, 'Quận Thủ Đức', 24, '70133', 1, 8),
(483, 'Huyện Củ Chi', 24, '70135', 1, 12),
(484, 'Huyện Hóc Môn', 24, '70137', 1, 6),
(485, 'Huyện Bình Chánh', 24, '70139', 1, 5),
(486, 'Huyện Nhà Bè', 24, '70141', 1, 7),
(487, 'Huyện Cần Giờ', 24, '70143', 1, 10),
(489, 'Thành phố Đà Lạt', 32, '70301', 1, 5),
(490, 'Thị xã Bảo Lộc', 32, '70303', 1, 5),
(491, 'Huyện Lạc Dương', 32, '70305', 1, 5),
(492, 'Huyện Đơn Dương', 32, '70307', 1, 5),
(493, 'Huyện Đức Trọng', 32, '70309', 1, 5),
(494, 'Huyện Lâm Hà', 32, '70311', 1, 5),
(495, 'Huyện Bảo Lâm', 32, '70313', 1, 5),
(496, 'Huyện Di Linh', 32, '70315', 1, 5),
(497, 'Huyện Đạ Huoai', 32, '70317', 1, 5),
(498, 'Huyện Đạ Tẻh', 32, '70319', 1, 5),
(499, 'Huyện Cát Tiên', 32, '70321', 1, 5),
(501, 'Thị xã Phan Rang-Tháp Chàm', 37, '70501', 1, 5),
(502, 'Huyện Ninh Sơn', 37, '70503', 1, 5),
(503, 'Huyện Ninh Hải', 37, '70505', 1, 5),
(504, 'Huyện Ninh Phước', 37, '70507', 1, 5),
(506, 'Huyện Đồng Phú', 4, '70701', 1, 5),
(507, 'Huyện Phước Long', 4, '70703', 1, 5),
(508, 'Huyện Lộc Ninh', 4, '70705', 1, 5),
(509, 'Huyện Bù Đăng', 4, '70707', 1, 5),
(510, 'Huyện Bình Long', 4, '70709', 1, 5),
(512, 'Thị xã Tây Ninh', 53, '70901', 1, 5),
(513, 'Huyện Tân Biên', 53, '70903', 1, 5),
(514, 'Huyện Tân Châu', 53, '70905', 1, 5),
(515, 'Huyện Dương Minh Châu', 53, '70907', 1, 5),
(516, 'Huyện Châu Thành', 53, '70909', 1, 5),
(517, 'Huyện Hòa Thành', 53, '70911', 1, 5),
(518, 'Huyện Bến Cầu', 53, '70913', 1, 5),
(519, 'Huyện Gò Dầu', 53, '70915', 1, 5),
(520, 'Huyện Trảng Bàng', 53, '70917', 1, 5),
(522, 'Thị xã Thủ Dầu Một', 3, '71101', 1, 5),
(523, 'Huyện Bến Cát', 3, '71103', 1, 5),
(524, 'Huyện Tân Uyên', 3, '71105', 1, 5),
(525, 'Huyện Thuận An', 3, '71107', 1, 5),
(527, 'Thành phố Biên Hòa', 59, '71301', 1, 5),
(528, 'Huyện Tân Phú', 59, '71303', 1, 5),
(529, 'Huyện Định Quán', 59, '71305', 1, 5),
(530, 'Huyện Vĩnh Cừu', 59, '71307', 1, 5),
(531, 'Huyện Thống Nhất', 59, '71309', 1, 5),
(532, 'Huyện Long Khánh', 59, '71311', 1, 5),
(533, 'Huyện Xuân Lộc', 59, '71313', 1, 5),
(534, 'Huyện Long Thành', 59, '71315', 1, 5),
(535, 'Huyện Nhơn Trạch', 59, '71317', 1, 5),
(537, 'Thị xã Phan Thiết', 5, '71501', 1, 5),
(538, 'Huyện Tuy Phong', 5, '71503', 1, 5),
(539, 'Huyện Bắc Bình', 5, '71505', 1, 5),
(540, 'Huyện Hàm Thuận Bắc', 5, '71507', 1, 5),
(541, 'Huyện Hàm Thuận Nam', 5, '71509', 1, 5),
(542, 'Huyện Tánh Linh', 5, '71511', 1, 5),
(543, 'Huyện Hàm Tân', 5, '71513', 1, 5),
(544, 'Huyện Đức Linh', 5, '71515', 1, 5),
(545, 'Huyện Phú Quí', 5, '71517', 1, 5),
(547, 'Thành phố Vũng Tàu', 2, '71701', 1, 5),
(548, 'Thị xã Bà Rịa', 2, '71703', 1, 5),
(549, 'Huyện Châu Đức', 2, '71705', 1, 5),
(550, 'Huyện Xuyên Mộc', 2, '71707', 1, 5),
(551, 'Huyện Tân Thành', 2, '71709', 1, 5),
(552, 'Huyện Long Đất', 2, '71711', 1, 5),
(553, 'Huyện Côn Đảo', 2, '71713', 1, 5),
(555, 'Thị xã Tân An', 30, '80101', 1, 5),
(556, 'Huyện Tân Hưng', 30, '80103', 1, 5),
(557, 'Huyện Vĩnh Hưng', 30, '80105', 1, 5),
(558, 'Huyện Mộc Hóa', 30, '80107', 1, 5),
(559, 'Huyện Tân Thạnh', 30, '80109', 1, 5),
(560, 'Huyện Thạnh Hóa', 30, '80111', 1, 5),
(561, 'Huyện Đức Huệ', 30, '80113', 1, 5),
(562, 'Huyện Đức Hòa', 30, '80115', 1, 5),
(563, 'Huyện Bến Lức', 30, '80117', 1, 5),
(564, 'Huyện Thủ Thừa', 30, '80119', 1, 5),
(565, 'Huyện Châu Thành', 30, '80121', 1, 5),
(566, 'Huyện Tân Trụ', 30, '80123', 1, 5),
(567, 'Huyện Cần Đước', 30, '80125', 1, 5),
(568, 'Huyện Cần Giuộc', 30, '80127', 1, 5),
(570, 'Thị xã Cao Lãnh', 60, '80301', 1, 5),
(571, 'Thị xã Sa Đéc', 60, '80303', 1, 5),
(572, 'Huyện Tân Hồng', 60, '80305', 1, 5),
(573, 'Huyện Hồng Ngự', 60, '80307', 1, 5),
(574, 'Huyện Tam Nông', 60, '80309', 1, 5),
(575, 'Huyện Thanh Bình', 60, '80311', 1, 5),
(576, 'Huyện Tháp Mười', 60, '80313', 1, 5),
(577, 'Huyện Cao Lãnh', 60, '80315', 1, 5),
(578, 'Huyện Lấp Vò', 60, '80317', 1, 5),
(579, 'Huyện Lai Vung', 60, '80319', 1, 5),
(580, 'Huyện Châu Thành', 60, '80321', 1, 5),
(582, 'Thành Phố Long Xuyên', 1, '80501', 1, 5),
(583, 'Thị xã Châu Đốc', 1, '80503', 1, 5),
(584, 'Huyện An Phú', 1, '80505', 1, 5),
(585, 'Huyện Tân Châu', 1, '80507', 1, 5),
(586, 'Huyện Phú Tân', 1, '80509', 1, 5),
(587, 'Huyện Châu Phú', 1, '80511', 1, 5),
(588, 'Huyện Tịnh Biên', 1, '80513', 1, 5),
(589, 'Huyện Tri Tôn', 1, '80515', 1, 5),
(590, 'Huyện Chợ Mới', 1, '80517', 1, 5),
(591, 'Huyện Châu Thành', 1, '80519', 1, 5),
(592, 'Huyện Thoại Sơn', 1, '80521', 1, 5),
(594, 'Thành phố Mỹ Tho', 50, '80701', 1, 5),
(595, 'Thị xã Gò Công', 50, '80703', 1, 5),
(596, 'Huyện Tân Phước', 50, '80705', 1, 5),
(597, 'Huyện Châu Thành', 50, '80707', 1, 5),
(598, 'Huyện Cai Lậy', 50, '80709', 1, 5),
(599, 'Huyện Chợ Gạo', 50, '80711', 1, 5),
(600, 'Huyện Cái Bè', 50, '80713', 1, 5),
(601, 'Huyện Gò Công Tây', 50, '80715', 1, 5),
(602, 'Huyện Gò Công Đông', 50, '80717', 1, 5),
(604, 'Thị xã Vĩnh Long', 54, '80901', 1, 5),
(605, 'Huyện Long Hồ', 54, '80903', 1, 5),
(606, 'Huyện Mang Thít', 54, '80905', 1, 5),
(607, 'Huyện Bình Minh', 54, '80907', 1, 5),
(608, 'Huyện Tam Bình', 54, '80909', 1, 5),
(609, 'Huyện Trà Ôn', 54, '80911', 1, 5),
(610, 'Huyện Vũng Liêm', 54, '80913', 1, 5),
(612, 'Thị xã Bến Tre', 10, '81101', 1, 5),
(613, 'Huyện Châu Thành', 10, '81103', 1, 5),
(614, 'Huyện Chợ Lách', 10, '81105', 1, 5),
(615, 'Huyện Mỏ Cày', 10, '81107', 1, 5),
(616, 'Huyện Giồng Trôm', 10, '81109', 1, 5),
(617, 'Huyện Bình Đại', 10, '81111', 1, 5),
(618, 'Huyện Ba Tri', 10, '81113', 1, 5),
(619, 'Huyện Thạnh Phú', 10, '81115', 1, 5),
(621, 'Thị xã Rạch Giá', 27, '81301', 1, 5),
(622, 'Huyện Hà Tiên', 27, '81303', 1, 5),
(623, 'Huyện Hòn Đất', 27, '81305', 1, 5),
(624, 'Huyện Tân Hiệp', 27, '81307', 1, 5),
(625, 'Huyện Châu Thành', 27, '81309', 1, 5),
(626, 'Huyện Giồng Giềng', 27, '81311', 1, 5),
(627, 'Huyện Gò Quao', 27, '81313', 1, 5),
(628, 'Huyện An Biên', 27, '81315', 1, 5),
(629, 'Huyện An Minh', 27, '81317', 1, 5),
(630, 'Huyện Vĩnh Thuận', 27, '81319', 1, 5),
(631, 'Huyện Phú Quốc', 27, '81321', 1, 5),
(632, 'Huyện Kiên Hải', 27, '81323', 1, 5),
(633, 'Thị xã Hà Tiên', 27, '81325', 1, 5),
(635, 'Thành phố Cần Thơ', 13, '81501', 1, 5),
(636, 'Thị xã Vị Thanh', 13, '81502', 1, 5),
(637, 'Huyện Thốt Nốt', 13, '81503', 1, 5),
(638, 'Huyện Ô Môn', 13, '81505', 1, 5),
(639, 'Huyện Châu Thành', 13, '81507', 1, 5),
(640, 'Huyện Phụng Hiệp', 13, '81509', 1, 5),
(641, 'Huyện Vị Thuỷ', 13, '81511', 1, 5),
(642, 'Huyện Long Mỹ', 13, '81513', 1, 5),
(644, 'Thị xã Trà Vinh', 51, '81701', 1, 5),
(645, 'Huyện Càng Long', 51, '81703', 1, 5),
(646, 'Huyện Châu Thành', 51, '81705', 1, 5),
(647, 'Huyện Cầu Kè', 51, '81707', 1, 5),
(648, 'Huyện Tiểu Cần', 51, '81709', 1, 5),
(649, 'Huyện Cầu Ngang', 51, '81711', 1, 5),
(650, 'Huyện Trà Cú', 51, '81713', 1, 5),
(651, 'Huyện Duyên Hải', 51, '81715', 1, 5),
(653, 'Thị xã Sóc Trăng', 62, '81901', 1, 5),
(654, 'Huyện Kế Sách', 62, '81903', 1, 5),
(655, 'Huyện Long Phú', 62, '81905', 1, 5),
(656, 'Huyện Mỹ Tú', 62, '81907', 1, 5),
(657, 'Huyện Mỹ Xuyên', 62, '81909', 1, 5),
(658, 'Huyện Thạnh Trị', 62, '81911', 1, 5),
(659, 'Huyện Vĩnh Châu', 62, '81913', 1, 5),
(661, 'Thị xã Bạc Liêu', 61, '82101', 1, 5),
(662, 'Huyện Hồng Dân', 61, '82103', 1, 5),
(663, 'Huyện Vĩnh Lợi', 61, '82105', 1, 5),
(664, 'Huyện Giá Rai', 61, '82107', 1, 5),
(666, 'Thị xã Cà Mau', 12, '82301', 1, 5),
(667, 'Huyện Thới Bình', 12, '82303', 1, 5),
(668, 'Huyện U Minh', 12, '82305', 1, 5),
(669, 'Huyện Trần Văn Thời', 12, '82307', 1, 5),
(670, 'Huyện Cái Nước', 12, '82309', 1, 5),
(671, 'Huyện Đầm Dơi', 12, '82311', 1, 5),
(672, 'Huyện Ngọc Hiển', 12, '82313', 1, 5),
(673, 'Huyện Đắk Song', 64, '60709', 1, 6),
(674, 'Thị xã Gia Nghĩa', 64, '60713', 1, 1),
(675, 'Huyện Tuy Đức', 64, '60715', 1, 7),
(676, 'Huyện Phú Hòa', 39, '50915', 1, 8),
(677, 'Huyện Tây Hoà', 39, '50917', 1, 9),
(678, 'Thị xã Đồng Xoài', 4, '70711', 1, 5),
(679, 'Quận Bình Tân', 24, '70145', 1, 3),
(680, 'Quận Tân Phú', 24, '70147', 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;