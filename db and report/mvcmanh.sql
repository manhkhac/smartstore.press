-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2020 at 01:41 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvcmanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adminEmail` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `adminUser` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adminPass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminEmail`, `adminUser`, `adminPass`, `level`) VALUES
(2, 'admin', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(6, 'Samsung'),
(7, 'Apple'),
(8, 'Huawei'),
(9, 'Oppo'),
(10, 'Xiaomi'),
(11, 'Lenovo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `sId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `productId`, `sId`, `productName`, `price`, `quantity`, `image`) VALUES
(49, 36, '4f0je3jjtbjtr4p44v92fke70h', 'Samsung A9', '6000000', 1, 'b8fc018298.jpg'),
(51, 32, 'ieiq9pdul8n8rjluechj1tg8pf', 'Iphone X', '15000000', 1, 'd50314e988.jpg'),
(54, 36, 'ieiq9pdul8n8rjluechj1tg8pf', 'Samsung A9', '6000000', 1, 'b8fc018298.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(3, 'IPad'),
(5, 'Mobile Phones'),
(6, 'Accessories'),
(7, 'Software');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zipcode`, `phone`, `email`, `password`) VALUES
(7, 'tester1', 'Như Xuân', 'Tp.Thanh Hoá', 'Việt Nam', '31031', '+84123456789', 'tester1@gmail.com', '99349d99167034abf0e0d3ec9a85a93f'),
(10, 'tester2', '234 Lê Lợi', 'Đà Nẵng', 'Việt Nam', '300000', '0361936155', 'tester2@gmail.com', '2e9fcf8e3df4d415c96bcf288d5ca4ba');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_order` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `productId`, `productName`, `customer_id`, `quantity`, `price`, `image`, `status`, `date_order`) VALUES
(76, 36, 'Samsung A9', 10, 1, '6000000', 'b8fc018298.jpg', 2, '2020-11-21 03:01:35'),
(77, 33, 'Huawei Mediapad', 10, 1, '9000000', '72f87e2efc.jpg', 2, '2020-11-21 03:01:35'),
(78, 32, 'Iphone X', 10, 2, '30000000', 'd50314e988.jpg', 2, '2020-11-21 03:01:35'),
(79, 32, 'Iphone X', 7, 2, '30000000', 'd50314e988.jpg', 1, '2020-11-21 05:18:42'),
(80, 29, 'Iphone 6s Plus', 7, 3, '18000000', 'f57ad17e8b.png', 0, '2020-11-21 05:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `productQuantity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_soldout` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `product_remain` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `product_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `product_code`, `productQuantity`, `product_soldout`, `product_remain`, `catId`, `brandId`, `product_desc`, `type`, `price`, `image`) VALUES
(29, 'Iphone 6s Plus', 'CDAPPE', '300', '0', '300', 5, 7, '<p><span>iPhone 6S Plus 128GB cũ</span>&nbsp;sở hữu thiết kế sang trọng, tinh tế, m&agrave;n h&igrave;nh rộng&nbsp;<span><span>5.5inch</span></span>, con chip&nbsp;<span><span>Apple A9</span></span>&nbsp;c&ugrave;ng iOS 9 mang đến hiệu năng mạnh, đảm bảo c&aacute;c t&aacute;c vụ của người d&ugrave;ng được thực hiện trơn tru.</p>\r\n<p>iPhone 6S Plus 128GB cũ&nbsp;l&agrave; phi&ecirc;n bản quốc tế chỉ cần&nbsp;<span><span>lắp sim v&agrave;o l&agrave; d&ugrave;ng ngay</span></span>. Sản phẩm được b&aacute;n ra tại Di Động Việt, m&aacute;y c&ograve;n rất mới, bảo h&agrave;nh 6 th&aacute;ng tại Di Động Việt v&agrave; hỗ trợ 1 đổi 1 c&ugrave;ng nhiều ưu đ&atilde;i khi mua h&agrave;ng tại Di Động Việt.</p>', 0, '6000000', 'f57ad17e8b.png'),
(30, 'Iphone 7 Plus', 'CDAPPE', '100', '3', '97', 5, 7, '<ul class=\"parameter \">\r\n<li class=\"p87839 g6459_79_77\">M&agrave;n h&igrave;nh:<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-ledbacklit-ips-lcd-la-gi-905757\" target=\"_blank\">LED-backlit IPS LCD</a>, 5.5\",&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-retina-la-gi-905780\" target=\"_blank\">Retina HD</a></li>\r\n<li class=\"p87839 g72\">Hệ điều h&agrave;nh:<a href=\"https://www.thegioididong.com/hoi-dap/tat-ca-nhung-tinh-nang-moi-duoc-cap-nhat-tren-ios-1171206\" target=\"_blank\">iOS 13</a></li>\r\n<li class=\"p87839 g27\">Camera sau:2 camera 12 MP</li>\r\n<li class=\"p87839 g29\">Camera trước:7 MP</li>\r\n<li class=\"p87839 g6059\">CPU:<a href=\"https://www.thegioididong.com/hoi-dap/tong-quan-ve-chip-a10-fusion-cua-apple-885052\" target=\"_blank\">Apple A10 Fusion 4 nh&acirc;n</a></li>\r\n<li class=\"p87839 g50\"><a href=\"https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259\" target=\"_blank\">RAM:</a>3 GB</li>\r\n<li class=\"p87839 g49\">Bộ nhớ trong:128 GB</li>\r\n<li class=\"p87839 g49\">\r\n<div>Thẻ SIM:<a href=\"https://www.thegioididong.com/tin-tuc/tim-hieu-cac-loai-sim-thong-dung-sim-thuong-micro--590216#nanosim\" target=\"_blank\">1 Nano SIM</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/4g-la-gi-731757\" target=\"_blank\">Hỗ trợ 4G</a></div>\r\n</li>\r\n<li class=\"g6339_6463\">\r\n<div class=\"ibsim\"><strong class=\"h\">HOT</strong></div>\r\n</li>\r\n<li class=\"g6339_6463\">\r\n<div class=\"ibsim\"><a href=\"https://www.thegioididong.com/sim-so-dep/vietnamobile?t=59\">SIM VNMB Si&ecirc;u sim (5GB/ng&agrave;y)</a></div>\r\n</li>\r\n<li class=\"g6339_6463\">\r\n<div class=\"ibsim\">Dung lượng pin:2900 mAh</div>\r\n</li>\r\n</ul>', 0, '12000000', 'c03726d730.jpg'),
(31, 'Iphone 8 Plus', 'CDAPPE', '200', '3', '197', 5, 7, '<ul class=\"parameter \">\r\n<li class=\"p114110 g6459_79_77\"><span>M&agrave;n h&igrave;nh:</span><a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-ledbacklit-ips-lcd-la-gi-905757\" target=\"_blank\">LED-backlit IPS LCD</a>, 5.5\",&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-retina-la-gi-905780\" target=\"_blank\">Retina HD</a></li>\r\n<li class=\"p114110 g72\"><span>Hệ điều h&agrave;nh:</span><a href=\"https://www.thegioididong.com/hoi-dap/tat-ca-nhung-tinh-nang-moi-duoc-cap-nhat-tren-ios-1171206\" target=\"_blank\">iOS 13</a></li>\r\n<li class=\"p114110 g27\"><span>Camera sau:</span>2 camera 12 MP</li>\r\n<li class=\"p114110 g29\"><span>Camera trước:</span>7 MP</li>\r\n<li class=\"p114110 g6059\"><span>CPU:</span><a href=\"https://www.thegioididong.com/hoi-dap/chip-apple-a11-bionic-la-gi-1170872\" target=\"_blank\">Apple A11 Bionic 6 nh&acirc;n</a></li>\r\n<li class=\"p114110 g50\"><span>RAM:</span>3 GB</li>\r\n<li class=\"p114110 g49\"><span>Bộ nhớ trong:</span>64 GB</li>\r\n<li class=\"g6339_6463\"><span>Thẻ SIM:</span><a href=\"https://www.thegioididong.com/tin-tuc/tim-hieu-cac-loai-sim-thong-dung-sim-thuong-micro--590216#nanosim\" target=\"_blank\">1 Nano SIM</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/4g-la-gi-731757\" target=\"_blank\">Hỗ trợ 4G</a></li>\r\n<li class=\"g6339_6463\"><strong class=\"h\">HOT</strong></li>\r\n<li class=\"g6339_6463\"><a href=\"https://www.thegioididong.com/sim-so-dep/vietnamobile?t=59\">SIM VNMB Si&ecirc;u sim (5GB/ng&agrave;y)</a></li>\r\n<li class=\"p114110 g84_10882\"><span>Dung lượng pin:&nbsp;</span>2691 mAh, c&oacute; sạc nhanh</li>\r\n</ul>', 0, '13000000', 'd179a2acce.jpg'),
(32, 'Iphone X', 'CDAPPE', '300', '10', '290', 5, 7, '<ul class=\"parameter \">\r\n<li class=\"p114115 g6459_79_77\"><span>M&agrave;n h&igrave;nh:</span><a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-oled-la-gi-905762\" target=\"_blank\">OLED</a>, 5.8\",&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-super-retina-la-gi-1152045\" target=\"_blank\">Super Retina</a></li>\r\n<li class=\"p114115 g72\"><span>Hệ điều h&agrave;nh:</span><a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-ve-he-dieu-hanh-ios-12-1172136\" target=\"_blank\">iOS 12</a></li>\r\n<li class=\"p114115 g27\"><span>Camera sau:</span>2 camera 12 MP</li>\r\n<li class=\"p114115 g29\"><span>Camera trước:</span>7 MP</li>\r\n<li class=\"p114115 g6059\"><span>CPU:</span><a href=\"https://www.thegioididong.com/hoi-dap/chip-apple-a11-bionic-la-gi-1170872\" target=\"_blank\">Apple A11 Bionic 6 nh&acirc;n</a></li>\r\n<li class=\"p114115 g50\"><span><a href=\"https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259\" target=\"_blank\">RAM:</a></span>3 GB</li>\r\n<li class=\"p114115 g49\"><span>Bộ nhớ trong:</span>64 GB</li>\r\n<li class=\"p114115 g6339_6463\"><span>Thẻ SIM:</span><a href=\"https://www.thegioididong.com/tin-tuc/tim-hieu-cac-loai-sim-thong-dung-sim-thuong-micro--590216#nanosim\" target=\"_blank\">1 Nano SIM</a>,&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/4g-la-gi-731757\" target=\"_blank\">Hỗ trợ 4G</a></li>\r\n<li class=\"p114115 g84_10882\"><span>Dung lượng pin:&nbsp;</span>2716 mAh, c&oacute; sạc nhanh</li>\r\n</ul>', 0, '15000000', 'd50314e988.jpg'),
(33, 'Huawei Mediapad', 'HW1130', '200', '2', '198', 3, 8, '<ul class=\"parameter \">\r\n<li class=\"p215685 g2439_2440\"><span>M&agrave;n h&igrave;nh:</span><a href=\"https://www.thegioididong.com/hoi-dap/man-hinh-ips-lcd-la-gi-905752\" target=\"_blank\">IPS LCD</a>, 10.1\"</li>\r\n<li class=\"p215685 g2477\"><span>Hệ điều h&agrave;nh:</span><a href=\"https://www.thegioididong.com/hoi-dap/co-nhung-gi-moi-tren-android-80-1018266\" target=\"_blank\">Android 8</a></li>\r\n<li class=\"p215685 g5039_2469\"><span>CPU:</span>Kirin 659 8 nh&acirc;n, 1.7 GHz</li>\r\n<li class=\"p215685 g3059\"><span><a href=\"https://www.thegioididong.com/hoi-dap/ram-la-gi-co-y-nghia-gi-trong-cac-thiet-bi-dien-t-1216259\" target=\"_blank\">RAM:</a></span>4 GB</li>\r\n<li class=\"p215685 g3060\"><span>Bộ nhớ trong:</span>64 GB</li>\r\n<li class=\"p215685 g2445\"><span>Camera sau:</span>8 MP</li>\r\n<li class=\"p215685 g2444\"><span>Camera trước:</span>8 MP</li>\r\n<li class=\"p215685 g25459\"><span>Kết nối mạng:</span>\r\n<div><a href=\"https://www.thegioididong.com/hoi-dap/mang-du-lieu-di-dong-4g-la-gi-731757\" target=\"_blank\">Hỗ trợ 4G</a></div>\r\n</li>\r\n<li class=\"g2460\"><span>Hỗ trợ SIM:</span>\r\n<div class=\"isim\"><a href=\"https://www.thegioididong.com/tin-tuc/tim-hieu-cac-loai-sim-thong-dung-sim-thuong-micro--590216\" target=\"_blank\">1 Nano SIM</a></div>\r\n<div class=\"ibsim\"><strong class=\"h\">HOT</strong><a href=\"https://www.thegioididong.com/sim-so-dep/vietnamobile?t=59\">SIM VNMB Si&ecirc;u sim (5GB/ng&agrave;y)</a></div>\r\n</li>\r\n<li class=\"p215685 g7839\"><span>Đ&agrave;m thoại:</span>C&oacute;</li>\r\n</ul>', 1, '9000000', '72f87e2efc.jpg'),
(35, 'Lenovo Tab 7', 'LNVT7', '200', '16', '184', 3, 11, '<p>Lenovo Tab 7</p>', 1, '9000000', 'f52b8f7fdd.jpg'),
(36, 'Samsung A9', 'SSAGUH', '100', '5', '145', 5, 6, '<p>Samsung A9</p>', 1, '6000000', 'b8fc018298.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `sliderId` int(11) NOT NULL,
  `sliderName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slider_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`sliderId`, `sliderName`, `slider_image`, `type`) VALUES
(15, 'Iphone', '19b4ed86c5.png', 1),
(16, 'Huawei', '371730a522.png', 1),
(17, 'Oppo', 'df309b2f99.png', 1),
(18, 'Dang cap cong nghe', 'cc0dca24d7.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warehouse`
--

CREATE TABLE `tbl_warehouse` (
  `id_warehouse` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `sl_nhap` varchar(50) NOT NULL,
  `sl_ngaynhap` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_warehouse`
--

INSERT INTO `tbl_warehouse` (`id_warehouse`, `id_sanpham`, `sl_nhap`, `sl_ngaynhap`) VALUES
(5, 36, '50', '2020-11-21 10:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_wishlist`
--

INSERT INTO `tbl_wishlist` (`id`, `customer_id`, `productId`, `productName`, `price`, `image`) VALUES
(7, 7, 31, 'Iphone 8 Plus', '13000000', 'd179a2acce.jpg'),
(8, 7, 33, 'Huawei Mediapad', '9000000', '72f87e2efc.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`sliderId`);

--
-- Indexes for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `sliderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
