-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 06, 2022 lúc 05:57 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `haki_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `reciever` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Không tên',
  `coupon` double DEFAULT 0,
  `ship_cost` double DEFAULT 0,
  `total_bill` double NOT NULL DEFAULT 0,
  `recive_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_order` int(11) NOT NULL DEFAULT 1,
  `date_order` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_finish` date DEFAULT NULL,
  `date_cancel` date DEFAULT NULL,
  `cancel_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `id_user`, `reciever`, `coupon`, `ship_cost`, `total_bill`, `recive_address`, `phone`, `email`, `status_order`, `date_order`, `date_finish`, `date_cancel`, `cancel_reason`, `created_at`, `updated_at`) VALUES
(1069, 2, 'Nguyễn Thùy Dung', 0, 0, 1200000, '563.4153', '3563563', 'biancadolly1709@gmail.com', 1, '2022-12-06 04:50:41', NULL, NULL, NULL, '2022-12-06 04:50:41', '2022-12-06 04:50:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) NOT NULL,
  `id_bill` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(14, '1069', 'KCN07', 950000, 1, 950000, '2022-12-06 04:50:41', '2022-12-06 04:50:41'),
(15, '1069', 'KD05', 250000, 1, 250000, '2022-12-06 04:50:41', '2022-12-06 04:50:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_code` int(11) DEFAULT NULL,
  `total_cart` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_code`, `total_cart`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, NULL, '2022-12-06 04:50:41'),
(4, 6, NULL, 0, '2021-01-09 06:19:15', '2021-01-09 06:19:15'),
(5, 7, NULL, 0, '2021-01-09 06:23:56', '2021-01-09 06:23:56'),
(6, 8, NULL, 0, '2021-01-09 06:31:18', '2022-12-06 04:38:36'),
(7, 9, NULL, 0, '2021-01-10 12:13:27', '2021-01-10 12:13:27'),
(8, 10, NULL, 0, '2021-01-10 12:18:47', '2021-01-10 12:18:47'),
(9, 11, NULL, 0, '2021-01-10 12:29:03', '2021-01-10 13:05:36'),
(10, 12, NULL, 0, '2021-01-10 12:47:42', '2021-01-10 12:55:53'),
(11, 13, NULL, 0, '2021-01-10 13:37:52', '2021-01-10 13:37:52'),
(12, 14, NULL, 0, '2021-01-10 13:40:26', '2021-01-10 13:40:26'),
(13, 15, NULL, 0, '2021-01-10 13:41:39', '2021-01-10 13:41:39'),
(14, 16, NULL, 0, '2021-01-10 13:43:39', '2022-12-06 04:38:37'),
(15, 17, NULL, 0, '2021-01-12 02:44:27', '2022-12-06 04:38:38'),
(16, 18, NULL, 910000, '2022-12-05 14:50:07', '2022-12-05 17:21:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `id_cart`, `id_product`, `size`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(76, 16, 'TT01', '', 380000, 1, 380000, '2022-12-05 14:50:55', '2022-12-05 14:50:55'),
(77, 16, 'TT05', '', 150000, 1, 150000, '2022-12-05 15:56:08', '2022-12-05 15:56:08'),
(78, 16, 'KD07', '', 380000, 1, 380000, '2022-12-05 17:21:56', '2022-12-05 17:21:56');

--
-- Bẫy `cart_detail`
--
DELIMITER $$
CREATE TRIGGER `add_cart_detail-update-total-cart` AFTER INSERT ON `cart_detail` FOR EACH ROW UPDATE cart SET total_cart = (SELECT SUM(total) FROM cart_detail WHERE cart_detail.id_cart = NEW.id_cart)
WHERE cart.id = NEW.id_cart
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `remove_cart_detail` AFTER DELETE ON `cart_detail` FOR EACH ROW UPDATE cart 
    SET total_cart = (SELECT SUM(total) 
                      FROM cart_detail
                      WHERE cart_detail.id_cart = 						old.id_cart)
    WHERE id = old.id_cart
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_cart_detail-Cart` AFTER UPDATE ON `cart_detail` FOR EACH ROW UPDATE cart 
    SET total_cart = (SELECT SUM(total) 
                      FROM cart_detail
                      WHERE cart_detail.id_cart = 						NEW.id_cart)
    WHERE id = NEW.id_cart
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `id` int(10) NOT NULL,
  `color_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`id`, `color_name`, `code`, `created_at`, `updated_at`) VALUES
(1, '5 ml', '5 ml', NULL, NULL),
(2, '10 ml', '10 ml', NULL, NULL),
(3, '20 ml', '20 ml', NULL, NULL),
(4, '40 ml', '40 ml', NULL, NULL),
(5, '50 ml', '50 ml', NULL, NULL),
(6, '75 ml', '75 ml', NULL, NULL),
(7, '90 ml', '90 ml', NULL, NULL),
(8, '100 ml', '100 ml', NULL, NULL),
(9, '125 ml', '125 ml', NULL, NULL),
(10, '150 ml', '150 ml', NULL, NULL),
(11, '200 ml', '200 ml', NULL, NULL),
(12, '250 ml', '250 ml', NULL, NULL),
(13, '300 ml', '300 ml', NULL, NULL),
(14, '400 ml', '400 ml', NULL, NULL),
(15, '500 ml', '500 ml', NULL, NULL),
(16, '600 ml', '600 ml', NULL, NULL),
(17, '750 ml', '750 ml', NULL, NULL),
(18, '1000 ml', '1000 ml', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `virtual_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `id_user`, `virtual_name`, `id_product`, `content`, `star`, `created_at`, `updated_at`) VALUES
(1, 5, 'van cuong', 'SP1007', 'Sản phẩm tốt!', 5, '2018-11-18 14:05:34', '2018-11-18 14:05:34'),
(2, 6, 'Ẩn danh', 'SP1007', 'Áo chất lượng khá tốt!', 4, '2018-11-18 14:17:20', '2018-11-18 14:17:20'),
(3, 6, 'Meo', 'SP1007', 'Good!!', 4, '2018-11-18 14:20:19', '2018-11-18 14:20:19'),
(7, 6, 'jacky', 'SP1012', 'Sản phẩm đẹp quá', 3, '2018-11-23 02:53:34', '2018-11-23 02:53:34'),
(8, 6, 'lucy', 'SP1012', NULL, 5, '2018-11-23 02:59:33', '2018-11-23 02:59:33'),
(9, 6, 'wendy', 'SP1013', NULL, 4, '2018-11-23 03:00:06', '2018-11-23 03:00:06'),
(10, 5, 'snow', 'SP1012', NULL, 3, '2018-11-25 12:08:06', '2018-11-25 12:08:06'),
(11, 5, 'van cuong', 'SP1011', NULL, 4, '2018-11-27 03:16:20', '2018-11-27 03:16:20'),
(12, 5, NULL, 'SP1023', NULL, 5, '2019-01-22 14:15:45', '2019-01-22 14:15:45'),
(13, 5, 'Mr C', 'SP1023', NULL, 5, '2019-01-22 14:17:37', '2019-01-22 14:17:37'),
(14, 5, 'Mr C', 'SP1023', NULL, 5, '2019-01-22 14:25:15', '2019-01-22 14:25:15'),
(15, 5, 'Mr C', 'SP1023', NULL, 5, '2019-01-22 14:25:15', '2019-01-22 14:25:15'),
(16, 5, 'Mr C', 'SP1023', NULL, 5, '2019-01-22 14:25:15', '2019-01-22 14:25:15'),
(17, 5, 'Mr C', 'SP1023', NULL, 5, '2019-01-22 14:25:15', '2019-01-22 14:25:15'),
(18, 5, 'Mr C', 'SP1023', NULL, 5, '2019-01-22 14:25:15', '2019-01-22 14:25:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Nam'),
(2, 'Nữ'),
(3, 'Trẻ em'),
(4, 'Cả nam và nữ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `my_product`
--

CREATE TABLE `my_product` (
  `id` int(10) NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bẫy `my_product`
--
DELIMITER $$
CREATE TRIGGER `can't add product already exists` BEFORE INSERT ON `my_product` FOR EACH ROW IF EXISTS(SELECT * 
              FROM my_product
              WHERE id_product =NEW.id_product 
              AND id_user = NEW.id_user)
THEN
	    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate wish item';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_color` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 100,
  `gender` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_price` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `promotion_price` double NOT NULL DEFAULT -1,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `new` int(11) NOT NULL DEFAULT 0,
  `hot` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `id_product`, `name`, `id_type`, `id_color`, `quantity`, `gender`, `description`, `import_price`, `price`, `promotion_price`, `image`, `new`, `hot`, `created_at`, `updated_at`) VALUES
(1, 'TT01', 'Nước Tẩy Trang La Roche-Posay Cho Da Dầu, Nhạy Cảm', 1, 15, 100, 2, 'Nước Tẩy Trang Sạch Sâu & Kiểm Soát Nhờn Cho Da Dầu La Roche-Posay Effaclar Micellar Water Ultra Oily Skin là sản phẩm nước tẩy trang đến từ thương hiệu dược mỹ phẩm La Roche-Posay, với công nghệ cải tiến Glyco Micellar mang lại hiệu quả làm sạch sâu vượt trội, giúp lấy đi lớp trang điểm, bã nhờn và các hạt bụi siêu nhỏ có trong khói xe và môi trường ô nhiễm nhưng vẫn an toàn cho làn da dầu nhạy cảm & dễ kích ứng.', 250000, 380000, -1, 'TT01_1.jpg', 1, 1, '2022-12-05 14:49:17', '2022-12-05 14:49:17'),
(2, 'TT02', 'Nước Tẩy Trang Bioderma Dành Cho Da Dầu & Hỗn Hợp', 1, 15, 100, 2, 'Nước Tẩy Trang Bioderma Sébium H2O là sản phẩm tẩy trang dành cho da dầu, da hỗn hợp đến từ thương hiệu dược mỹ phẩm Bioderma, được ứng dụng công nghệ Micellar đình đám giúp loại bỏ lớp trang điểm cùng bụi bẩn và dầu thừa trên da hiệu quả mà không gây khô căng hay nhờn rít, tạo cảm giác thông thoáng cho da sau một ngày dài mệt mỏi', 400000, 450000, 430000, 'TT02_1.jpg', 1, 1, '2022-12-05 15:06:57', '2022-12-05 15:06:57'),
(3, 'TT03', 'Nước Tẩy Trang L\'Oreal Làm Sạch Sâu Trang Điểm', 1, 15, 100, 2, 'Nước Tẩy Trang L\'Oréal là dòng sản phẩm tẩy trang dạng nước đến từ thương hiệu L\'Oreal Paris, được ứng dụng công nghệ Micellar dịu nhẹ giúp làm sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da thông thoáng, mềm mượt mà không hề khô căng.', 100000, 250000, 180000, 'TT03_1.jpg', 0, 1, NULL, NULL),
(4, 'TT04', 'Nước Tẩy Trang L\'Oreal Dưỡng Ẩm Cho Da Thường, Khô', 1, 15, 100, 2, 'Nước Tẩy Trang L\'Oréal là dòng sản phẩm tẩy trang dạng nước đến từ thương hiệu L\'Oreal Paris, được ứng dụng công nghệ Micellar dịu nhẹ giúp làm sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da thông thoáng, mềm mượt mà không hề khô căng.', 250000, 189000, -1, 'TT04_1.jpg', 0, 1, '2022-12-05 15:18:32', '2022-12-05 15:18:32'),
(5, 'TT05', 'Nước Tẩy Trang L\'Oreal Tươi Mát Cho Da Dầu, Hỗn Hợp', 1, 15, 100, 2, 'Nước Tẩy Trang L\'Oréal là dòng sản phẩm tẩy trang dạng nước đến từ thương hiệu L\'Oreal Paris, được ứng dụng công nghệ Micellar dịu nhẹ giúp làm sạch da, lấy đi bụi bẩn, dầu thừa và cặn trang điểm chỉ trong một bước, mang lại làn da thông thoáng, mềm mượt mà không hề khô căng.', 250000, 170000, 150000, 'TT05_1.jpg', 1, 1, '2022-12-05 15:20:15', '2022-12-05 15:20:15'),
(6, 'TT06', 'Nước Tẩy Trang Nivea Sạch Sâu Ngăn Ngừa Mụn', 1, 12, 100, 2, 'Nếu bạn đang lo lắng về làn da chứa đầy dầu và mụn của bạn, làm cho bạn thiếu tự tin thì hãy để Hasaki.vn giới thiệu cho bạn một giải pháp hiệu quả đó là sử dụng Nước Tẩy Trang Sạch Sâu Ngăn Ngừa Mụn Nivea Acne Clear Micellair Oxygen Boost Micellar Water đến từ Nivea', 100000, 160000, 140000, 'TT06_1.jpg', 1, 1, '2022-12-05 15:22:15', '2022-12-05 15:22:15'),
(7, 'TT07', 'Nước Tẩy Trang Senka Ngừa Mụn, Kiểm Soát Nhờn', 1, 10, 100, 2, 'Nước Tẩy Trang Senka All Clear Water Micellar Formula là dòng sản phẩm tẩy trang dạng nước từ thương hiệu mỹ phẩm SENKA Nhật Bản, với công thức Micellar giúp giúp làm sạch bụi bẩn, bã nhờn, lớp trang điểm lâu trôi tận sâu lỗ chân lông một cách hiệu quả mà vẫn dịu nhẹ cho làn da. Đặc biệt, mỗi phân loại được bổ sung các chiết xuất thiên nhiên giúp nuôi dưỡng và hỗ trợ cải thiện từng vấn đề về da riêng biệ', 100000, 150000, 130000, 'TT07_1.jpg', 0, 0, NULL, NULL),
(8, 'TT08', 'Nước Tẩy Trang Simple Làm Sạch Trang Điểm Vượt Trội', 1, 13, 100, 2, 'Nước Tẩy Trang Simple Kind To Skin Micellar Cleansing Water là sản phẩm tẩy trang dành cho da mặt đến từ thương hiệu Simple xuất xứ Anh Quốc. Công thức cải tiến với công nghệ làm sạch Micellar chứa hàng triệu bong bóng Micelles thông minh giúp loại bỏ lớp trang điểm và bụi bẩn hiệu quả, làm thông thoáng lỗ chân lông, mang lại cảm giác tươi mát cho da sau khi sử dụng, đồng thời cấp ẩm lên đến 4 giờ mà không để lại dư lượng thừa trên da.', 100000, 189000, 160000, 'TT08_1.jpg', 1, 1, NULL, NULL),
(9, 'TT09', 'Nước Tẩy Trang Garnier Làm Sạch Sâu Lớp Trang Điểm', 1, 15, 100, 2, 'Nước Tẩy Trang Garnier Micellar Cleansing Water là dòng sản phẩm tẩy trang nổi tiếng đến từ thương hiệu Garnier của Pháp, sử dụng công nghệ Micelles (Micellar Technology) có chứa các phân tử mi-xen hoạt động theo cơ chế nam châm giúp nhẹ nhàng làm sạch da và lấy đi bụi bẩn, cặn trang điểm và dầu thừa sâu bên trong lỗ chân lông mà không gây khô da.', 120000, 250000, -1, 'TT09_3.png', 0, 1, NULL, NULL),
(10, 'SRM01', 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm', 2, 15, 100, 2, 'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.', 350000, 500000, 450000, 'SRM01_1.jpg', 0, 1, '2022-12-05 15:55:49', '2022-12-05 15:55:49'),
(11, 'SRM02', 'Sữa Rửa Mặt CeraVe Cho Da Thường Đến Khô', 2, 15, 100, 2, 'Sữa Rửa Mặt Cerave Sạch Sâu là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Cerave của Mỹ, với sự kết hợp của ba Ceramides thiết yếu, Hyaluronic Acid sản phẩm giúp làm sạch và giữ ẩm cho làn da mà không ảnh hưởng đến hàng rào bảo vệ da mặt và cơ thể', 200000, 350000, -1, 'SRM02_1.jpg', 1, 1, '2022-12-05 15:57:20', '2022-12-05 15:57:20'),
(12, 'SRM03', 'Kem Rửa Mặt Hada Labo Sạch Sâu Dưỡng Ẩm ', 2, 13, 100, 2, 'Kem Rửa Mặt Hada Labo Sạch Sâu Dưỡng Ẩm Da là sản phẩm sữa rửa mặt nằm trong dòng dưỡng ẩm Advanced Nourish của Hada Labo, với kết cấu dạng kem tạo bọt mịn, nhẹ nhàng len lỏi sâu vào lỗ chân lông để loại bỏ bụi bẩn & bã nhờn, đồng thời kết hợp hệ dưỡng ẩm sâu HA, SHA, Nano HA giúp cung cấp độ ẩm cho da luôn ẩm mượt và sạch sâu suốt 36 giờ', 50000, 80000, -1, 'SRM03_1.jpg', 1, 1, '2022-12-05 16:00:06', '2022-12-05 16:00:06'),
(13, 'SRM04', 'Sữa Rửa Mặt Senka Tạo Bọt Chiết Xuất Tơ Tằm Trắng', 2, 10, 100, 2, 'Sữa Rửa Mặt Tạo Bọt SENKA Perfect Whip Facial Foam Wash đến từ thương hiệu mỹ phẩm Senka thuộc tập đoàn Shiseido Nhật Bản, với lớp bọt tơ tằm trắng bông mịn giúp làm sạch sâu lỗ chân lông, kết hợp cùng công nghệ Aqua in Pool độc quyền sẽ mang lại cho bạn một làn da sạch hoàn hảo nhưng vẫn ẩm mịn tự nhiên, không gây cảm giác khô căng', 50000, 90000, 75000, 'SRM04_1.jpg', 1, 0, '2022-12-05 16:02:19', '2022-12-05 16:02:19'),
(14, 'SRM05', 'Sữa Rửa Mặt Cho Nam Nivea Than Đen Hoạt Tính', 2, 13, 100, 1, 'Sữa Rửa Mặt Cho Nam Nivea Than Hoạt Tính Giảm Nhờn, Sáng Da Deep White Oil Clear 100g là sản phẩm chăm sóc mặt cho nam đến từ thương hiệu NIVEA xuất xứ tại Đức, chiết xuất từ than hoạt tính hỗ trợ làm sạch sâu, loại bỏ bã nhờn, se khít lỗ chân lông giúp làn da sạch thoáng, tươi mát. ', 50000, 80000, -1, 'SRM05_1.jpg', 1, 0, '2022-12-05 16:13:33', '2022-12-05 16:13:33'),
(15, 'SRM06', 'Sữa Rửa Mặt X-Men Go Refresh Sức Mạnh Mát Lạnh', 2, 13, 100, 1, 'Sữa rửa mặt 100g phiên bản cải tiến mới từ X-Men - thương hiệu chăm sóc cá nhân cho nam giới tại Việt Nam, với công thức đặc chế dành riêng cho da mặt nam giới sẽ mang đến sự chăm sóc toàn diện, an toàn và hiệu quả vượt trội. Dòng sản phẩm nay được cải tiến thêm công năng với sự kết hợp sức mạnh từ các thành phần thiên nhiên cùng diện mạo mới hiện đại, nam tính', 50000, 80000, -1, 'SRM06_1.jpg', 0, 1, '2022-12-05 16:15:16', '2022-12-05 16:15:16'),
(16, 'SRM07', 'Kem Rửa Mặt Oxy Có Hạt Làm Sạch Sâu Giảm Nhờn', 2, 13, 100, 1, 'Kem Rửa Mặt OXY Deep Wash Scrub Formula là sản phẩm sữa rửa mặt chăm sóc da dành cho nam giới đến từ thương hiệu OXY. Công thức chứa sức mạnh từ hàng triệu hạt Than đen kết hợp Công nghệ cấp ẩm HydraTech giúp đánh bay nhờn vượt trội, sạch sâu da và giảm bóng dầu lên đến 8 giờ. Đồng thời, các hạt mát-xa siêu mịn trong sản phẩm sẽ giúp loại bỏ tế bào chết và cải thiện kết cấu da thô ráp, sần sùi hiệu quả.', 50000, 85000, 65000, 'SRM07_1.jpg', 1, 0, '2022-12-05 16:18:31', '2022-12-05 16:18:31'),
(17, 'SRM08', 'Kem Rửa Mặt Acnes Giúp Ngừa Mụn', 2, 12, 100, 1, '', 50000, 75000, -1, 'SRM08_1.jpg', 0, 0, '2022-12-05 16:20:24', '2022-12-05 16:20:24'),
(18, 'SRM09', 'Sữa Rửa Mặt Hatomugi Ý Dĩ Ngừa Mụn, Làm Sáng Da ', 2, 13, 100, 2, 'Sữa Rửa Mặt Hatomugi The Medicated Facial Foam là sản phẩm sữa rửa mặt dành cho da mụn đến từ thương hiệu Hatomugi (thuộc KUMANO COSME), với công thức giàu các thành phần dưỡng ẩm tự nhiên chiết xuất từ hạt Ý Dĩ, Lá Đào và Rễ Cam Thảo giúp loại bỏ bụi bẩn, dầu thừa ẩn sâu trong lỗ chân lông, hỗ trợ ngăn ngừa và làm giảm mụn trứng cá, đồng thời bổ sung độ ẩm, cải thiện tình trạng da khô thô ráp. ', 150000, 250000, 200000, 'SRM09_1.jpg', 0, 1, '2022-12-05 16:22:24', '2022-12-05 16:22:24'),
(19, 'SRM10', 'Sữa Rửa Mặt Kumano Từ Đậu Nành Dưỡng Ẩm Sáng Da', 2, 13, 100, 2, '', 60000, 100000, 80000, 'SRM10_1.jpg', 1, 0, '2022-12-05 16:28:13', '2022-12-05 16:28:13'),
(20, 'SRM11', 'Sữa Rửa Mặt Vichy Sạch Sâu Cho Da Nhờn, Mụn Dạng Gel', 2, 15, 100, 2, '', 250000, 350000, -1, 'SRM11_1.jpg', 0, 1, '2022-12-05 16:29:22', '2022-12-05 16:29:22'),
(21, 'SRM12', 'Sữa Rửa Mặt Cetaphil Dịu Lành Cho Da Nhạy Cảm ', 2, 15, 100, 2, 'Sữa Rửa Mặt Cetaphil Gentle Skin Cleanser phiên bản mới ra mắt năm 2022 từ thương hiệu Cetaphil với công thức khoa học mới cho làn da nhạy cảm, giúp làm sạch da, loại bỏ bụi bẩn, phù hợp cho mọi loại da, không làm khô da và duy trì hàng rào bảo vệ da suốt ngày dài.\r\n\r\nĐược chứng minh lâm sàng có khả năng làm sạch sâu, loại bỏ hoàn toàn bụi bẩn, và tạp chất trên da một cách dịu nhẹ nhưng vẫn duy trì độ ẩm tự nhiên để bảo vệ da khỏi tình trạng khô ráp, Sữa Rửa Mặt Cetaphil Mới với công thức lành tính không gây kích ứng sẽ an toàn cho mọi loại da, kể cả da nhạy cảm.', 300000, 450000, -1, 'SRM12_1.jpg', 0, 1, '2022-12-05 16:31:24', '2022-12-05 16:31:24'),
(22, 'SRM13', 'Sữa Rửa Mặt Isis Pharma Giảm Nhờn Và Ngăn Ngừa Mụn', 2, 14, 100, 1, '', 200000, 350000, -1, 'SRM13_1.jpg', 0, 1, '2022-12-05 16:32:59', '2022-12-05 16:32:59'),
(23, 'SRM14', 'Gel Rửa Mặt SVR Không Chứa Xà Phòng Cho Da Dầu', 2, 15, 100, 2, 'Gel Rửa Mặt SVR Sebiaclear Gel Moussant là sản phẩm sữa rửa mặt dành cho làn da dầu mụn đến từ thương hiệu dược mỹ phẩm SVR, với công thức không chứa xà phòng giúp làm sạch, nhẹ nhàng làm thông thoáng làn da. Khả năng tạo bọt mịn giúp loại trừ các chất bẩn và lượng bã nhờn dư thừa mà không làm khô da. Có thể rửa sạch dễ dàng, mang lại một làn da sạch, tươi mát và khô thoáng.', 300000, 500000, 450000, 'SRM14_1.jpg', 1, 1, '2022-12-05 16:34:30', '2022-12-05 16:34:30'),
(24, 'SRM15', 'Sữa Rửa Mặt L\'Oreal Paris Cấp Ẩm Và Căng Mịn Da ', 2, 10, 100, 2, '', 100000, 150000, -1, 'SRM15_1.jpg', 0, 0, '2022-12-05 16:36:19', '2022-12-05 16:36:19'),
(25, 'SRM16', 'Gel Rửa Mặt Eucerin Cho Da Nhờn Mụn ', 2, 13, 100, 2, 'Gel Rửa Mặt Cho Da Dầu Mụn Eucerin ProAcne Solution Cleansing Gel là giải pháp làm sạch sâu hằng ngày cho làn da nhờn mụn đến từ thương hiệu dược mỹ phẩm Eucerin, với công thức dịu nhẹ không chứa xà phòng và hương liệu, chứa 6% Ampho-Tensides giúp loại bỏ bã nhờn dư thừa, làm sạch bụi bẩn trên da và ngăn ngừa mụn hiệu quả, mang lại một làn da sạch khỏe thoáng mịn.', 200000, 300000, -1, 'SRM16_1.jpg', 0, 1, '2022-12-05 16:39:27', '2022-12-05 16:39:27'),
(26, 'SRM17', 'Sữa Rửa Mặt innisfree Dịu Nhẹ Chiết Xuất Trà Xanh', 2, 10, 100, 2, '', 150000, 350000, 300000, 'SRM17_1.jpeg', 1, 1, '2022-12-05 16:40:49', '2022-12-05 16:40:49'),
(27, 'SRM18', 'Sữa Rửa Mặt Garnier 3 Trong 1 Giảm Mụn & Sáng Da', 2, 13, 100, 2, 'Sữa Rửa Mặt Garnier 3 Trong 1 Giảm Mụn & Sáng Da là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Garnier của Pháp, thành phần bổ sung Vitamin C và Salicylic Acid với công dụng 3 trong 1 làm sạch sâu lỗ chân lông, loại bỏ bụi bẩn, dầu thừa, hỗ trợ giảm mụn, ngăn mụn trở lại và dưỡng sáng da.', 150000, 250000, 230000, 'SRM18_1.jpg', 0, 0, '2022-12-05 16:44:08', '2022-12-05 16:44:08'),
(28, 'SRM19', 'Sữa Rửa Mặt Papulex Ngăn Ngừa & Giảm Mụn Trứng Cá', 2, 13, 100, 1, '', 150000, 200000, -1, 'SRM19_1.jpg', 0, 1, '2022-12-05 16:45:10', '2022-12-05 16:45:10'),
(29, 'SRM20', 'Mặt Nạ Freeman Tinh Bột Nghệ Dưỡng Ẩm Sáng Da ', 2, 10, 100, 2, '', 50000, 100000, -1, 'SRM20_1.jpg', 1, 0, '2022-12-05 16:46:32', '2022-12-05 16:46:32'),
(30, 'SRM21', 'Sữa Rửa Mặt Caryophy Ngăn Ngừa Mụn Giảm Thâm', 2, 13, 100, 2, '', 150000, 250000, 230000, 'SRM21_1.png', 0, 0, '2022-12-05 16:48:20', '2022-12-05 16:48:20'),
(31, 'SRM22', 'Gel Rửa Mặt Bí Đao Cocoon Làm Giảm Dầu & Mụn', 2, 15, 100, 2, 'Gel Bí Đao Rửa Mặt Cocoon Winter Melon Cleanser là sản phẩm sữa rửa mặt độc đáo đến từ thương hiệu mỹ phẩm Việt Nam Cocoon, được chiết xuất từ thành phần tự nhiên phù hợp với làn da dầu mụn như bí đao, rau má, tràm trà... Công thức dạng gel tạo bọt nhẹ nhàng nhưng lại có khả năng làm sạch sâu, ngăn ngừa các tác nhân gây mụn, đặc biệt là mụn ẩn dưới da, mang đến cho sự ẩm mịn tự nhiên cùng cảm giác vô cùng tươi mới và sạch sẽ. Độ pH 5.5 cân bằng lý tưởng, an toàn cho làn da dầu, mụn & nhạy cảm.', 200000, 350000, 300000, 'SRM22_1.jpg', 0, 0, '2022-12-05 16:49:43', '2022-12-05 16:49:43'),
(32, 'SRM23', 'Sữa Rửa Mặt Gilaa Khổ Qua Và Vegan BHA Giảm Mụn', 2, 13, 100, 2, 'Sữa Rửa Mặt Gilaa Khổ Qua Và Vegan BHA Giảm Mụn 160g là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Gilaa của Hàn Quốc, sự kết hợp giữa tinh chất khổ qua GBE và BHA thuần chay giúp làm sạch sâu lỗ chân lông, giảm tình trạng mụn ẩn, mụn đầu đen và sưng viêm. Sản phẩm được Evegan của Pháp chứng nhận mỹ phẩm thuần chay.', 150000, 350000, 280000, 'SRM23_1.jpg', 0, 0, '2022-12-05 16:51:12', '2022-12-05 16:51:12'),
(33, 'SRM24', 'Sữa Rửa Mặt Klairs Dạng Bọt Dưỡng Ẩm, Làm Mềm Da', 2, 13, 100, 2, 'Klairs Rich Moist Foaming Cleanser là sản phẩm sữa rửa mặt dạng bọt đến từ thương hiệu mỹ phẩm Klairs của Hàn Quốc, được thiết kế dành riêng cho làn da nhạy cảm. Công thức với lớp bông tạo bọt siêu mịn và thành phần làm sạch từ các amino acid có độ pH thấp sẽ giúp loại bỏ lớp bụi bẩn, bã nhờn trên bề mặt da một cách dịu nhẹ, giảm thiểu ma sát gây tổn thương & kích ứng, đồng thời giữ được độ ẩm tự nhiên của da.', 150000, 280000, 230000, 'SRM24_1.jpg', 0, 0, '2022-12-05 16:53:10', '2022-12-05 16:53:10'),
(34, 'SRM25', 'Sữa Rửa Mặt Garnier 3 Trong 1 Giảm Mụn & Sáng Da', 2, 15, 100, 2, 'Sữa Rửa Mặt Garnier 3 Trong 1 Giảm Mụn & Sáng Da là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Garnier của Pháp, thành phần bổ sung Vitamin C và Salicylic Acid với công dụng 3 trong 1 làm sạch sâu lỗ chân lông, loại bỏ bụi bẩn, dầu thừa, hỗ trợ giảm mụn, ngăn mụn trở lại và dưỡng sáng da.', 200000, 350000, -1, 'SRM25_1.jpg', 0, 1, '2022-12-05 16:54:54', '2022-12-05 16:54:54'),
(40, 'KD01', 'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da', 3, 10, 100, 2, 'Kem Dưỡng La Roche-Posay Cicaplast Baume B5 Soothing Repairing Balm là sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da. Sản phẩm được khuyên dùng sau các liệu trình điều trị thẩm mỹ & kích ứng da nhẹ ở người lớn, trẻ em và trẻ sơ sinh', 250000, 350000, 300000, 'KD01_1.jpg', 0, 1, '2022-12-05 17:09:47', '2022-12-05 17:09:47'),
(41, 'KD02', 'Kem Dưỡng Bioderma Giúp Se Khít Lỗ Chân Lông', 3, 10, 100, 2, 'Kem Dưỡng Bioderma Sébium Pore Refiner là sản phẩm kem dưỡng chuyên biệt dành cho làn da dầu, lỗ chân lông to đến từ thương hiệu dược mỹ phẩm Bioderma. Với kết cấu mỏng nhẹ, thẩm thấu tức thì, sản phẩm giúp tạo lớp lót trên bề mặt da giúp che phủ lỗ chân lông, hỗ trợ cân bằng bã nhờn đồng thời giúp làm giảm kích thước lỗ chân lông, để lại làn da khô thoáng sau khi sử dụng. Đặc biệt phù hợp cho da dầu và da mụn.', 250000, 400000, 350000, 'KD02_1.jpg', 1, 1, '2022-12-05 17:11:18', '2022-12-05 17:11:18'),
(42, 'KD03', 'Kem Dưỡng Bioderma Hỗ Trợ Phục Hồi Da Tổn Thương', 3, 13, 100, 2, 'Bioderma Cicabio Crème là sản phẩm kem dưỡng ẩm hỗ trợ phục hồi và làm dịu làn da tổn thương, da nhạy cảm - kích ứng đến từ thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp, được các bác sĩ da liễu Pháp tin dùng. Sản phẩm có khả năng làm giảm các triệu chứng ngứa và khó chịu gần như ngay lập tức, đồng thời dưỡng ẩm và khôi phục lớp biểu bì, tạo lớp màng bảo vệ da tối ưu mà vẫn mỏng nhẹ và thoáng khí, giúp da luôn thoải mái dễ chịu.', 300000, 450000, -1, 'KD03_1.jpg', 1, 1, '2022-12-05 17:12:31', '2022-12-05 17:12:31'),
(43, 'KD04', 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm', 3, 13, 100, 2, 'Kem Dưỡng Ẩm Klairs Làm Dịu & Phục Hồi Da Ban Đêm là một loại kem dưỡng dành cho da nhạy cảm đang được yêu thích đến từ thương hiệu Klairs của Hàn Quốc. Nổi bật với thành phần Guaiazulene được chiết xuất từ dầu hoa cúc tạo màu xanh dịu mát tự nhiên, giúp làm dịu da kích ứng, nhạy cảm vô cùng hiệu quả. Cộng với chiết xuất rau má cấp ẩm, làm dịu da và hỗ trợ phục hồi da mụn rất tốt.', 300000, 400000, 380000, 'KD04_1.jpg', 0, 1, '2022-12-05 17:13:39', '2022-12-05 17:13:39'),
(44, 'KD05', 'Kem Dưỡng Hatomugi Cấp Ẩm Da Mặt', 3, 13, 100, 2, 'Kem Dưỡng Hatomugi Chiết Xuất Ý Dĩ Làm Sáng Da 300g là dòng kem dưỡng đến từ thương hiệu mỹ phẩm Hatomugi của Nhật Bản, với thành phần chính từ 81% là nước và hạt ý dĩ cải thiện tình trạng khô ráp và mang đến làn da căng mướt, mịn màng, rạng rỡ. Bên cạnh đó, hỗ trợ làm dịu làn da kích ứng và làm sáng da.', 150000, 250000, -1, 'KD05_1.jpg', 1, 0, '2022-12-05 17:15:13', '2022-12-05 17:15:13'),
(45, 'KD06', 'Kem Dưỡng innisfree Cung Cấp Ẩm Chiết Xuất Trà Xanh', 3, 13, 100, 2, 'Kem Dưỡng Cung Cấp Ẩm Chiết Xuất Trà Xanh innisfree Green Tea Seed Cream là sản phẩm kem dưỡng da đến từ thường hiệu innisfree với chiết xuất trà xanh giúp dưỡng ẩm cho làn da thiếu nước trở nên mịn màng, căng mướt. ', 200000, 350000, -1, 'KD06_1.jpg', 1, 0, '2022-12-05 17:16:31', '2022-12-05 17:16:31'),
(46, 'KD07', 'Tinh Chất La Roche-Posay Phục Hồi, Cấp Ẩm & Tái Tạo Da', 3, 10, 100, 2, 'Tinh Chất La Roche-Posay Cicaplast B5 Ultra Repair Serum là sản phẩm mới nhất thuộc dòng Cicaplast B5 từ thương hiệu dược mỹ phẩm La Roche-Posay. Công thức đột phá mới chứa nồng độ cao đến 10% Vitamin B5 giúp dưỡng da, làm mềm, mượt và ẩm da, hỗ trợ bảo vệ da đến 24H.', 250000, 400000, 380000, 'KD07_1.jpg', 0, 0, '2022-12-05 17:17:58', '2022-12-05 17:17:58'),
(47, 'KD09', 'Serum Timeless HA + Vitamin C Cấp Ẩm, Làm Sáng Da', 3, 10, 100, 2, 'Timeless Hyaluronic Acid + Vitamin C Serum là sản phẩm tinh chất dưỡng da đến từ thương hiệu Timeless, với sự kết hợp giữa Hyaluronic Acid và Vitamin C mang đến công thức serum lý tưởng dành cho làn da dầu, giúp cung cấp độ ẩm mạnh mẽ và làm sáng da, ngăn ngừa lão hóa hiệu quả, đồng thời bổ sung dưỡng chất và làm mờ các nếp nhăn.', 250000, 350000, -1, 'KD09_1.jpg', 0, 0, '2022-12-05 17:19:51', '2022-12-05 17:19:51'),
(50, 'KCN01', 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', 4, 9, 100, 1, 'Kem Chống Nắng La Roche-Posay Anthelios Anti-Shine Gel-Cream Dry Touch Finish Mattifying Effect SPF50+ đến từ thương hiệu dược mỹ phẩm La Roche-Posay là sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.', 300000, 450000, 380000, 'KCN01_1.jpeg', 0, 1, NULL, NULL),
(51, 'KCN01', 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', 4, NULL, 100, 2, 'Kem Chống Nắng La Roche-Posay Anthelios Anti-Shine Gel-Cream Dry Touch Finish Mattifying Effect SPF50+ đến từ thương hiệu dược mỹ phẩm La Roche-Posay là sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.', 300000, 450000, 380000, 'KCN01_1.jpg', 0, 1, '2022-12-06 03:57:49', '2022-12-06 03:57:49'),
(52, 'KCN02', 'Sữa Chống Nắng Sunplay Skin Aqua Dưỡng Da Sáng Mịn', 4, NULL, 100, 2, 'Sữa Chống Nắng Sunplay Skin Aqua Clear White SPF50+ PA++++ là dòng sản phẩm chống nắng cho da mặt đến từ thương hiệu chống nắng Sunplay Skin Aqua, với công thức cải tiến mới năm 2021, ứng dụng công nghệ CHỐNG NẮNG - GIỮ ẨM đột phá từ Nhật Bản giúp chống nắng mạnh mẽ và bền bì trên da, đồng thời hạn chế tình trạng mất nước và duy trì độ ẩm tối ưu. Đặc biệt, sản phẩm còn có công dụng kiểm soát bã nhờn và dưỡng da sáng mịn đều màu, là giải pháp lý tưởng dành cho các cô nàng da dầu nhờn trong mùa hè nóng bức.', 80000, 150000, -1, 'KCN02_1.jpg', 1, 1, '2022-12-06 03:59:55', '2022-12-06 03:59:55'),
(53, 'KCN03', 'Sữa Chống Nắng Sunplay Skin Aqua Dưỡng Da Ngừa Mụn', 4, NULL, 100, 2, 'Sữa Chống Nắng Sunplay Skin Aqua Acne Clear Milk SPF50+ PA++++ là dòng sản phẩm chống nắng chuyên biệt cho làn da dầu và dễ nổi mụn đến từ thương hiệu chống nắng Sunplay Skin Aqua. Công thức cải tiến mới năm 2021 được ứng dụng công nghệ CHỐNG NẮNG - GIỮ ẨM đột phá từ Nhật Bản với chỉ số SPF50+ PA++++ giúp chống nắng mạnh mẽ và bền bỉ trên da, đồng thời hạn chế tình trạng mất nước và duy trì độ ẩm tối ưu. Kết cấu dạng sữa với các hạt phấn siêu mịn giúp hấp thu bã nhờn, kiểm soát dầu, giữ da luôn thoáng mịn và ngăn ngừa hình thành mụn.', 80000, 150000, -1, 'KCN03_1.jpg', 0, 0, '2022-12-06 03:59:55', '2022-12-06 03:59:55'),
(54, 'KCN04', 'Tinh Chất Chống Nắng Sunplay Hiệu Chỉnh Sắc Da', 4, 7, 100, 1, 'Tinh Chất Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up UV Essence là dòng sản phẩm chống nắng da mặt đến từ thương hiệu Sunplay - nhãn hàng chống nắng dưỡng da nổi tiếng xuất xứ Nhật Bản, với 3 tác dụng chỉ trong 1 sản phẩm: khả năng chống nắng cực đỉnh (SPF 50+ PA++++), giữ ẩm và dưỡng sáng da tối ưu (nhờ thành phần dưỡng ẩm Hyaluronic Acid và Vitamin C), khả năng hiệu chỉnh sắc da và nâng tone da rạng rỡ. Kết cấu dạng tinh chất mỏng nhẹ, không nhờn rít giúp da luôn ẩm mượt.', 100000, 189000, 150000, 'KCN04_1.jpg', 0, 0, '2022-12-06 04:02:54', '2022-12-06 04:02:54'),
(55, 'KCN04', 'Tinh Chất Chống Nắng Sunplay Hiệu Chỉnh Sắc Da', 4, 8, 100, 2, 'Tinh Chất Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up UV Essence là dòng sản phẩm chống nắng da mặt đến từ thương hiệu Sunplay - nhãn hàng chống nắng dưỡng da nổi tiếng xuất xứ Nhật Bản, với 3 tác dụng chỉ trong 1 sản phẩm: khả năng chống nắng cực đỉnh (SPF 50+ PA++++), giữ ẩm và dưỡng sáng da tối ưu (nhờ thành phần dưỡng ẩm Hyaluronic Acid và Vitamin C), khả năng hiệu chỉnh sắc da và nâng tone da rạng rỡ. Kết cấu dạng tinh chất mỏng nhẹ, không nhờn rít giúp da luôn ẩm mượt.', 100000, 189000, 150000, 'KCN04_1.jpg', 0, 0, '2022-12-06 04:02:54', '2022-12-06 04:02:54'),
(56, 'KCN05', 'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu', 4, 7, 100, 1, 'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu Bảo Vệ Hoàn Hảo là sản phẩm chống nắng phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp, giúp chống lại tác hại của tia UV & bụi mịn tối ưu dưới mọi điều kiện sinh hoạt, kể cả thời tiết khắc nghiệt nhất. Sản phẩm đặc biệt phù hợp với làn da thiên dầu.', 350000, 590000, 550000, 'KCN05_3.jpg', 0, 1, '2022-12-06 04:05:47', '2022-12-06 04:05:47'),
(57, 'KCN05', 'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu', 4, 7, 100, 2, 'Sữa Chống Nắng Anessa Dưỡng Da Kiềm Dầu Bảo Vệ Hoàn Hảo là sản phẩm chống nắng phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp, giúp chống lại tác hại của tia UV & bụi mịn tối ưu dưới mọi điều kiện sinh hoạt, kể cả thời tiết khắc nghiệt nhất. Sản phẩm đặc biệt phù hợp với làn da thiên dầu.', 450000, 590000, 550000, 'KCN05_3.jpg', 0, 0, '2022-12-06 04:05:47', '2022-12-06 04:05:47'),
(58, 'KCN06', 'Gel Chống Nắng Anessa Dưỡng Ẩm Bảo Vệ Hoàn Hảo', 4, 7, 100, 1, 'Gel Chống Nắng Anessa Dưỡng Ẩm Bảo Vệ Hoàn Hảo là kem chống nắng da mặt phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp. Với kết cấu dạng gel ẩm mượt, sản phẩm giúp bảo vệ da trước tác hại của UV & bụi mịn đồng thời ngăn ngừa lão hóa sớm do UV, đặc biệt lý tưởng cho làn da thiên khô', 400000, 670000, -1, 'KCN06_1.jpg', 0, 0, '2022-12-06 04:09:12', '2022-12-06 04:09:12'),
(59, 'KCN06', 'Gel Chống Nắng Anessa Dưỡng Ẩm Bảo Vệ Hoàn Hảo', 4, 7, 100, 2, 'Gel Chống Nắng Anessa Dưỡng Ẩm Bảo Vệ Hoàn Hảo là kem chống nắng da mặt phiên bản mới nhất năm 2022 đến từ thương hiệu chống nắng dưỡng da ANESSA hàng đầu Nhật Bản suốt 21 năm liên tiếp. Với kết cấu dạng gel ẩm mượt, sản phẩm giúp bảo vệ da trước tác hại của UV & bụi mịn đồng thời ngăn ngừa lão hóa sớm do UV, đặc biệt lý tưởng cho làn da thiên khô', 500000, 700000, -1, 'KCN06_1.jpg', 0, 0, '2022-12-06 04:09:12', '2022-12-06 04:09:12'),
(60, 'KCN07', 'Kem Chống Nắng MartiDerm Phổ Rộng Bảo Vệ Toàn Diện', 4, 10, 100, 2, 'Kem Chống Nắng MartiDerm The Originals Proteos Screen SPF50+ Fluid Cream đến từ thương hiệu dược mỹ phẩm Martiderm của Tây Ban Nha là dòng kem chống nắng dạng lỏng dễ hấp thụ với chỉ số SPF 50+ giúp ngăn ngừa và sửa chữa các dấu hiệu lão hoá da sớm. Sản phẩm cung cấp màng lọc chống nắng phổ rộng chống lại các tia UVA, UVB, IR (hồng ngoại), HEV (ánh sáng xanh). Sự kết hợp của Proteoglycans, phức hợp Spectrum Complex, phức hợp Hyaluronic Acid & Silicon Complex giúp giữ cho làn da trẻ trung, tươi tắn và đều màu. Kết cấu dạng cream-to-powder độc đáo mang lại cảm giác mượt mà, mỏng nhẹ tựa \"vô hình\" trên da.', 60000, 950000, -1, 'KCN07_3.jpg', 0, 1, '2022-12-06 04:10:47', '2022-12-06 04:10:47'),
(61, 'KCN08', 'Sữa Chống Nắng Sunplay Bảo Vệ Vượt Trội ', 4, 6, 100, 2, 'Với khí hậu oi bức ở Việt Nam, đặc biệt là trong những ngày hè tiết trời nắng nóng, ánh nắng chói chang, bỏng rát như thế này thì việc sử dụng kem chống nắng khi ra ngoài là điều vô cùng cần thiết. Thoa kem chống nắng là một trong những bước quan trọng trong quy trình chăm sóc, làm đẹp và bảo vệ làn da giúp da chống lại những tác động xấu của ánh nắng mặt trời, không những thế ánh nắng mặt trời còn là nguyên nhân gây nên các bệnh ung thư da cực kỳ nguy hiểm. Hasaki.vn xin giới thiệu Sữa chống nắng cực mạnh Sunplay Super Block với SPF81 và PA++++ đến từ thương hiệu quen thuộc Sunplay.', 50000, 150000, 130000, 'KCN08_1.jpg', 0, 0, '2022-12-06 04:12:25', '2022-12-06 04:12:25'),
(64, 'KCN09', 'Gel Chống Nắng Fixderma Cho Da Nhờn, Mụn, Nhạy Cảm', 4, 7, 100, 2, 'Fixderma Shadow SPF 30+ Gel là sản phẩm chống nắng dành cho da mặt đến từ thương hiệu mỹ phẩm Fixderma (USA), với kết cấu dạng gel đặc biệt phù hợp cho làn da dầu, mụn, nhạy cảm. Sản phẩm sử dụng màng lọc chống nắng vật lý kết hợp hóa học và chỉ số chống nắng SPF 30+, cung cấp khả năng bảo vệ cao trước tia UV, từ đó ngăn ngừa tổn thương và các dấu hiệu lão hóa, sạm nám da.', 150000, 300000, 250000, 'KCN09_2.jpg', 0, 0, '2022-12-06 04:13:44', '2022-12-06 04:13:44'),
(71, 'NH01', 'Nước Hoa Nam Gota Iconic Eau de Parfum', 5, 7, 100, 1, 'Ngoại hình hay nhan sắc không hẳn là thứ vũ khí duy nhất giúp bạn tạo ấn tượng với người đối diện. Bên cạnh một phong thái đỉnh đạc hay quyến rũ, thì hương thơm chính là bí quyết giúp bạn trở nên thu hút và chiếm được cảm tình với người đối diện. Nước Hoa Nam Gota Perfume For Men Eau de Parfum với thiết kế đơn giản, tinh tế cùng hương thơm trẻ trung đầy mê hoặc được chế tác hoàn toàn bởi Robertet - là nhà sản xuất hương liệu hàng đầu của Pháp, chuyên về nguyên liệu tự nhiên được thành lập vào năm 1850. Còn gì thú vị hơn việc tự khám phá cá tính bản thân thông quá việc trải nghiệm thế giới mùi hương đầy màu sắc đến từ Gota nữa chứ.', 100000, 200000, 150000, 'NH01.jpg', 0, 1, '2022-12-06 04:28:29', '2022-12-06 04:28:29'),
(72, 'NH02', 'Nước Hoa Nam Versace Pour Homme Eau De Toilette', 5, 9, 100, 1, 'Nước Hoa Nam Versace Pour Homme Eau De Toilette 100ml là dòng nước hoa eau de toilette cho nam giới đến từ thương hiệu nước hoa nổi tiếng trên thế giới Versace của Ý. Được dẫn dắt bởi nhà thiết kế táo bạo và có ảnh hưởng nhất thế giới Alberto Morillas. Pour Homme thuộc dòng hương thơm Fougere được ra đời vào năm 2008.\r\n\r\nDiamante Citrus, lá Cam đắng và hoa Neiroli thắp lên hương thơm với điểm nhấn Địa Trung Hải. Trái tim của Versace Pour Homme được đặc trưng bởi hương hoa khoáng, gần như xúc giác, của Clary Sage và Blue Hyacinth. Hổ phách và Xạ hương mang đến hương cuối sâu lắng và gợi cảm, bản chất của sự nam tính thuần khiết.', 1000000, 1800000, 1500000, 'NH02.jpg', 0, 1, '2022-12-06 04:30:32', '2022-12-06 04:30:32'),
(73, 'NH03', 'Nước Hoa Nam Moschino Toy Boy EDP', 5, 9, 100, 1, 'Nước Hoa Nam Moschino Toy Boy EDP là dòng nước hoa Eau De Parfum cho nam giới đến từ thương hiệu nước hoa nổi tiếng trên thế giới Moschino của Ý. Moschino Toy Boy được ra mắt vào năm 2019, thuộc dòng nước hoa Teddy Bear được thiết kế bởi giám đốc sáng tạo Jeremy Scott và tác giả mùi hương này là Yann Vasnier.', 1800000, 2500000, 2300000, 'NH03.png', 0, 0, '2022-12-06 04:31:56', '2022-12-06 04:31:56'),
(74, 'NH04', 'Nước Hoa Calvin Klein One EDT', 5, 13, 100, 1, 'Tập đoàn Calvin Klein được thành lập vào cuối những năm 1960, là một trong những thương hiệu thời trang hàng đầu thế giới được rất nhiều người yêu thích với những thiết kế mang phong cách đơn giản, cổ điển. Cùng với danh tiếng đó, các dòng nước hoa của Calvin Klein cũng đã liên tục mang về nhiều giải thưởng danh giá. Hương thơm hấp dẫn của nước hoa Calvin Klein mang đến một xu hướng hoàn toàn mới, dù đơn giản nhưng vẫn trở thành biểu tượng thời trang về cả kiểu dáng lẫn mùi hương. Mang đến cho chúng ta những hương thơm phù hợp cho cả 2 phái, Calvin Klein đã chứng tỏ được vị trí tiên phong của mình trong lĩnh vực này. Đến nay, hãng Calvin Klein đã có hơn 100 loại nước hoa.', 1000000, 1500000, -1, 'NH04.png', 0, 0, '2022-12-06 04:36:10', '2022-12-06 04:36:10'),
(75, 'NH05', 'Nước Hoa Nam Laura Anne Diamond Pour Homme', 5, 4, 100, 1, 'Ngoại hình hay nhan sắc không hẳn là thứ vũ khí duy nhất giúp bạn tạo ấn tượng với người đối diện. Bên cạnh một phong thái đỉnh đạc hay quyến rũ, thì hương thơm chính là bí quyết giúp bạn trở nên ấn tượng và chiếm được cảm tình. Nước Hoa Laura Anne Diamond 45ml với thiết kế cổ điển, thanh lịch sẽ giúp bạn lưu lại trên người hương thơm đầy quyến rũ, đầy mê hoặc, giúp bạn tự tin hơn khi giao tiếp. Ngoài ra, có thể bạn chưa biết nhưng việc lựa chọn hương thơm phù hợp với thần thái của chính mình là một cách rất tốt để “báo hiệu” cho đối phương biết được tâm trạng hiện tại của bạn ra sao. Bất kể bạn đang buồn hay vui, mùi hương nước hoa trên cơ thể sẽ giúp bạn nhanh chóng đưa tâm trạng đó đến đối phương mà chẳng cần bạn mở lời hay thể hiện. Còn gì thú vị hơn việc tự khám phá cá tính bản thân thông quá việc trải nghiệm thế giới mùi hương đầy màu sắc đến từ Laura Anne nữa chứ.', 300000, 450000, -1, 'NH05.jpg', 0, 0, '2022-12-06 04:36:10', '2022-12-06 04:36:10'),
(76, 'NH06', 'Nước Hoa Nam Calvin Klein Eternity Aqua', 5, 7, 100, 1, 'Tập đoàn Calvin Klein được thành lập vào cuối những năm 1960, là một trong những thương hiệu thời trang hàng đầu thế giới được rất nhiều người yêu thích với những thiết kế mang phong cách đơn giản, cổ điển. Cùng với danh tiếng đó, các dòng nước hoa của Calvin Klein cũng đã liên tục mang về nhiều giải thưởng danh giá. Hương thơm hấp dẫn của nước hoa Calvin Klein mang đến một xu hướng hoàn toàn mới, dù đơn giản nhưng vẫn trở thành biểu tượng thời trang về cả kiểu dáng lẫn mùi hương. Mang đến cho chúng ta những hương thơm phù hợp cho cả 2 phái, Calvin Klein đã chứng tỏ được vị trí tiên phong của mình trong lĩnh vực này. Đến nay, hãng Calvin Klein đã có hơn 100 loại nước hoa.', 1000000, 1500000, -1, 'NH06.jpg', 0, 0, '2022-12-06 04:36:10', '2022-12-06 04:36:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_detail`
--

CREATE TABLE `product_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_store` int(11) NOT NULL,
  `id_color` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_detail`
--

INSERT INTO `product_detail` (`id`, `id_product`, `id_store`, `id_color`, `id_size`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'SP1005', 1, 1, 1, 7, '2018-11-02 19:26:38', '2018-11-27 13:42:01'),
(2, 'SP1005', 1, 1, 2, 6, '2018-11-02 19:26:39', '2018-11-27 13:42:01'),
(3, 'SP1005', 1, 1, 3, 9, '2018-11-02 19:26:39', '2018-11-27 13:42:01'),
(4, 'SP1005', 1, 1, 4, 6, '2018-11-02 19:26:39', '2018-11-27 13:42:01'),
(5, 'SP1005', 1, 1, 5, 0, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(6, 'SP1005', 1, 2, 1, 0, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(7, 'SP1005', 1, 2, 2, 2, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(8, 'SP1005', 1, 2, 3, 5, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(9, 'SP1005', 1, 2, 4, 0, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(10, 'SP1005', 1, 2, 5, 0, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(11, 'SP1005', 2, 1, 1, 0, '2018-11-02 19:48:55', '2018-11-02 19:48:55'),
(12, 'SP1005', 2, 1, 2, 6, '2018-11-02 19:48:55', '2018-11-02 19:48:55'),
(13, 'SP1005', 2, 1, 3, 8, '2018-11-02 19:48:55', '2018-11-02 19:48:55'),
(14, 'SP1005', 2, 1, 4, 7, '2018-11-02 19:48:55', '2018-11-02 19:48:55'),
(15, 'SP1005', 2, 1, 5, 0, '2018-11-02 19:48:55', '2018-11-02 19:48:55'),
(16, 'SP1005', 2, 2, 1, 9, '2018-11-02 19:48:56', '2018-11-02 19:48:56'),
(17, 'SP1005', 2, 2, 2, 9, '2018-11-02 19:48:56', '2018-11-02 19:48:56'),
(18, 'SP1005', 2, 2, 3, 9, '2018-11-02 19:48:56', '2018-11-02 19:48:56'),
(19, 'SP1005', 2, 2, 4, 9, '2018-11-02 19:48:56', '2018-11-02 19:48:56'),
(20, 'SP1005', 2, 2, 5, 0, '2018-11-02 19:48:56', '2018-11-02 19:48:56'),
(21, 'SP1007', 1, 1, 1, 128, '2018-11-13 00:17:33', '2019-03-28 14:04:42'),
(22, 'SP1007', 1, 1, 2, 18, '2018-11-13 00:17:33', '2019-03-28 14:04:42'),
(23, 'SP1007', 1, 1, 3, 10, '2018-11-13 00:17:33', '2019-03-28 14:04:42'),
(24, 'SP1007', 1, 1, 4, 13, '2018-11-13 00:17:33', '2019-03-28 14:04:42'),
(25, 'SP1007', 1, 1, 5, 0, '2018-11-13 00:17:33', '2019-03-28 14:04:42'),
(26, 'SP1007', 1, 7, 1, 4, '2018-11-13 00:17:33', '2019-03-28 14:04:42'),
(27, 'SP1007', 1, 7, 2, 9, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(28, 'SP1007', 1, 7, 3, 14, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(29, 'SP1007', 1, 7, 4, 5, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(30, 'SP1007', 1, 7, 5, 0, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(31, 'SP1007', 1, 2, 1, 4, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(32, 'SP1007', 1, 2, 2, 6, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(33, 'SP1007', 1, 2, 3, 13, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(34, 'SP1007', 1, 2, 4, 9, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(35, 'SP1007', 1, 2, 5, 0, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(36, 'SP1011', 1, 1, 1, 3, '2018-11-23 00:41:00', '2018-11-28 02:29:27'),
(37, 'SP1011', 1, 1, 2, -3, '2018-11-23 00:41:00', '2018-11-27 03:15:35'),
(38, 'SP1011', 1, 1, 3, 4, '2018-11-23 00:41:00', '2018-11-25 08:04:04'),
(39, 'SP1011', 1, 1, 4, 0, '2018-11-23 00:41:00', '2018-11-23 00:41:00'),
(40, 'SP1011', 1, 1, 5, 6, '2018-11-23 00:41:00', '2018-11-23 00:41:00'),
(41, 'SP1011', 1, 8, 1, 3, '2018-11-23 00:41:00', '2018-11-28 02:29:27'),
(42, 'SP1011', 1, 8, 2, -3, '2018-11-23 00:41:00', '2018-11-27 03:15:35'),
(43, 'SP1011', 1, 8, 3, 4, '2018-11-23 00:41:00', '2018-11-25 08:04:04'),
(44, 'SP1011', 1, 8, 4, 7, '2018-11-23 00:41:00', '2018-11-23 00:41:00'),
(45, 'SP1011', 1, 8, 5, 5, '2018-11-23 00:41:00', '2018-11-23 00:41:00'),
(46, 'SP1011', 1, 7, 1, 3, '2018-11-23 00:41:00', '2018-11-28 02:29:27'),
(47, 'SP1011', 1, 7, 2, -3, '2018-11-23 00:41:00', '2018-11-27 03:15:35'),
(48, 'SP1011', 1, 7, 3, 4, '2018-11-23 00:41:00', '2018-11-25 08:04:04'),
(49, 'SP1011', 1, 7, 4, 2, '2018-11-23 00:41:00', '2018-11-23 00:41:00'),
(50, 'SP1011', 1, 7, 5, 0, '2018-11-23 00:41:01', '2018-11-23 00:41:01'),
(51, 'SP1012', 1, 2, 1, 5, '2018-11-23 00:41:29', '2018-11-23 00:41:29'),
(52, 'SP1012', 1, 2, 2, 4, '2018-11-23 00:41:30', '2018-11-25 12:07:39'),
(53, 'SP1012', 1, 2, 3, 4, '2018-11-23 00:41:30', '2018-11-23 02:13:02'),
(54, 'SP1012', 1, 2, 4, 5, '2018-11-23 00:41:30', '2018-11-23 00:41:30'),
(55, 'SP1012', 1, 2, 5, 2, '2018-11-23 00:41:30', '2018-11-23 00:41:30'),
(56, 'SP1013', 1, 2, 1, 6, '2018-11-23 00:42:10', '2018-11-23 00:42:10'),
(57, 'SP1013', 1, 2, 2, 3, '2018-11-23 00:42:10', '2018-11-23 02:13:02'),
(58, 'SP1013', 1, 2, 3, 2, '2018-11-23 00:42:10', '2018-11-25 12:07:39'),
(59, 'SP1013', 1, 2, 4, 3, '2018-11-23 00:42:10', '2018-11-23 00:42:10'),
(60, 'SP1013', 1, 2, 5, 7, '2018-11-23 00:42:10', '2018-11-23 00:42:10'),
(61, 'SP1013', 1, 1, 1, 8, '2018-11-23 00:42:11', '2018-11-23 00:42:11'),
(62, 'SP1013', 1, 1, 2, 3, '2018-11-23 00:42:11', '2018-11-23 02:13:02'),
(63, 'SP1013', 1, 1, 3, 2, '2018-11-23 00:42:11', '2018-11-25 12:07:39'),
(64, 'SP1013', 1, 1, 4, 8, '2018-11-23 00:42:11', '2018-11-23 00:42:11'),
(65, 'SP1013', 1, 1, 5, 4, '2018-11-23 00:42:11', '2018-11-23 00:42:11'),
(66, 'SP1010', 1, 1, 1, 2, '2018-11-23 06:51:42', '2018-11-23 06:51:42'),
(67, 'SP1010', 1, 1, 2, 4, '2018-11-23 06:51:42', '2018-11-23 06:51:42'),
(68, 'SP1010', 1, 1, 3, 0, '2018-11-23 06:51:42', '2018-11-23 06:51:42'),
(69, 'SP1010', 1, 1, 4, 0, '2018-11-23 06:51:42', '2018-11-23 06:51:42'),
(70, 'SP1010', 1, 1, 5, 0, '2018-11-23 06:51:42', '2018-11-23 06:51:42'),
(71, 'SP1024', 2, 1, 1, 4, '2018-11-27 13:43:14', '2018-11-27 13:43:14'),
(72, 'SP1024', 2, 1, 2, 5, '2018-11-27 13:43:14', '2018-11-27 13:43:14'),
(73, 'SP1024', 2, 1, 3, 8, '2018-11-27 13:43:14', '2018-11-27 13:43:14'),
(74, 'SP1024', 2, 1, 4, 9, '2018-11-27 13:43:14', '2018-11-27 13:43:14'),
(75, 'SP1024', 2, 1, 5, 0, '2018-11-27 13:43:14', '2018-11-27 13:43:14'),
(76, 'SP1025', 1, 5, 1, 2, '2018-11-27 13:45:55', '2018-11-27 13:45:55'),
(77, 'SP1025', 1, 5, 2, 2, '2018-11-27 13:45:55', '2018-11-27 13:45:55'),
(78, 'SP1025', 1, 5, 3, 3, '2018-11-27 13:45:55', '2018-11-27 13:45:55'),
(79, 'SP1025', 1, 5, 4, 3, '2018-11-27 13:45:55', '2018-11-27 13:45:55'),
(80, 'SP1025', 1, 5, 5, 5, '2018-11-27 13:45:55', '2018-11-27 13:45:55'),
(81, 'SP1023', 1, 18, 1, 0, '2018-11-27 13:46:38', '2019-04-06 13:33:10'),
(82, 'SP1023', 1, 18, 2, 2, '2018-11-27 13:46:38', '2018-11-27 13:46:38'),
(83, 'SP1023', 1, 18, 3, 4, '2018-11-27 13:46:38', '2018-11-27 13:46:38'),
(84, 'SP1023', 1, 18, 4, 5, '2018-11-27 13:46:38', '2018-11-27 13:46:38'),
(85, 'SP1023', 1, 18, 5, 8, '2018-11-27 13:46:39', '2018-11-27 13:46:39'),
(86, 'SP1021', 1, 3, 1, 4, '2018-11-27 13:48:11', '2018-11-27 13:48:11'),
(87, 'SP1021', 1, 3, 2, 4, '2018-11-27 13:48:11', '2018-11-27 13:48:11'),
(88, 'SP1021', 1, 3, 3, 4, '2018-11-27 13:48:11', '2018-11-27 13:48:11'),
(89, 'SP1021', 1, 3, 4, 4, '2018-11-27 13:48:11', '2018-11-27 13:48:11'),
(90, 'SP1021', 1, 3, 5, 0, '2018-11-27 13:48:11', '2018-11-27 13:48:11'),
(91, 'SP1024', 1, 1, 1, 54, '2018-11-29 01:53:41', '2018-11-29 01:53:41'),
(92, 'SP1024', 1, 1, 2, 3, '2018-11-29 01:53:41', '2018-11-29 01:53:41'),
(93, 'SP1024', 1, 1, 3, 3, '2018-11-29 01:53:41', '2018-11-29 01:53:41'),
(94, 'SP1024', 1, 1, 4, 0, '2018-11-29 01:53:41', '2018-11-29 01:53:41'),
(95, 'SP1024', 1, 1, 5, 0, '2018-11-29 01:53:42', '2018-11-29 01:53:42'),
(96, 'SP1023', 2, 18, 1, 5, '2018-11-29 02:07:19', '2018-11-29 02:07:19'),
(97, 'SP1023', 2, 18, 2, 5, '2018-11-29 02:07:19', '2018-11-29 02:07:19'),
(98, 'SP1023', 2, 18, 3, 5, '2018-11-29 02:07:19', '2018-11-29 02:07:19'),
(99, 'SP1023', 2, 18, 4, 5, '2018-11-29 02:07:19', '2018-11-29 02:07:19'),
(100, 'SP1023', 2, 18, 5, 5, '2018-11-29 02:07:19', '2018-11-29 02:07:19'),
(101, 'SP1015', 1, 17, 1, 4, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(102, 'SP1015', 1, 17, 2, 4, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(103, 'SP1015', 1, 17, 3, 0, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(104, 'SP1015', 1, 17, 4, 4, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(105, 'SP1015', 1, 17, 5, 4, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(106, 'SP1015', 1, 4, 1, 3, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(107, 'SP1015', 1, 4, 2, 3, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(108, 'SP1015', 1, 4, 3, 0, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(109, 'SP1015', 1, 4, 4, 0, '2018-12-02 13:50:26', '2018-12-02 13:50:26'),
(110, 'SP1015', 1, 4, 5, 0, '2018-12-02 13:50:26', '2018-12-02 13:50:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `id_product`, `image`, `created_at`, `updated_at`) VALUES
(1, 'TT01', 'TT01_1.jpg', '2022-12-05 14:47:06', NULL),
(2, 'TT01', 'TT01_2.jpg', '2022-12-05 14:47:25', NULL),
(3, 'TT02', 'TT02_1.jpg', NULL, NULL),
(4, 'TT02', 'TT02_2.jpg', NULL, NULL),
(5, 'TT03', 'TT03_1.jpg', NULL, NULL),
(6, 'TT04', 'TT04_1.jpg', NULL, NULL),
(7, 'TT05', 'TT05_1.jpg', '2022-12-05 14:54:39', NULL),
(8, 'TT06', 'TT06_1.jpg', NULL, NULL),
(9, 'TT06', 'TT06_2.jpg', '2022-12-05 14:55:33', NULL),
(10, 'TT07', 'TT07_1.jpg', NULL, NULL),
(11, 'TT07', 'TT07_2.jpg', NULL, NULL),
(12, 'TT08', 'TT08_1.jpg', NULL, NULL),
(13, 'TT08', 'TT08_2.jpg', NULL, NULL),
(14, 'TT09', 'TT09_1.jpg', NULL, NULL),
(15, 'TT09', 'TT09_2.jpg', NULL, NULL),
(16, 'TT09', 'TT09_3.png', NULL, NULL),
(18, 'SRM01', 'SRM01_1.jpg', NULL, NULL),
(19, 'SRM02', 'SRM02_1.jpg', NULL, NULL),
(20, 'SRM03', 'SRM03_1.jpg', NULL, NULL),
(21, 'SRM04', 'SRM04_1.jpg', NULL, NULL),
(22, 'SRM05', 'SRM05_1.jpg', NULL, NULL),
(23, 'SRM06', 'SRM06_1.jpg', '2022-12-05 15:46:02', NULL),
(24, 'SRM07', 'SRM07_1.jpg', '2022-12-05 15:46:17', NULL),
(25, 'SRM08', 'SRM08_1.jpg', '0000-00-00 00:00:00', NULL),
(26, 'SRM09', 'SRM09_1.jpg', '2022-12-05 15:47:20', NULL),
(27, 'SRM10', 'SRM10_1.jpg', '2022-12-05 15:47:44', NULL),
(28, 'SRM11', 'SRM11_1.jpg', '2022-12-05 15:48:05', NULL),
(29, 'SRM12', 'SRM12_1.jpg', '2022-12-05 15:48:41', NULL),
(30, 'SRM13', 'SRM13_1.jpg', '2022-12-05 15:49:19', NULL),
(31, 'SRM14', 'SRM14_1.jpg', '2022-12-05 15:49:36', NULL),
(32, 'SRM15', 'SRM15_1.jpg', '2022-12-05 15:49:50', NULL),
(33, 'SRM16', 'SRM16_1.jpg', '2022-12-05 15:50:03', NULL),
(34, 'SRM17', 'SRM17_1.jpeg', '2022-12-05 15:50:42', NULL),
(35, 'SRM18', 'SRM18_1.jpg', '2022-12-05 15:51:07', NULL),
(36, 'SRM19', 'SRM19_1.jpg', '2022-12-05 15:51:22', NULL),
(37, 'SRM20', 'SRM20_1.jpg', '2022-12-05 15:51:37', NULL),
(38, 'SRM21', 'SRM21_1.png', '2022-12-05 15:52:15', NULL),
(39, 'SRM22', 'SRM22_1.jpg', '2022-12-05 15:52:29', NULL),
(40, 'SRM23', 'SRM23_1.jpg', '2022-12-05 15:53:23', NULL),
(41, 'SRM24', 'SRM24_1.jpg', '2022-12-05 15:53:41', NULL),
(42, 'SRM25', 'SRM25_1.jpg', '2022-12-05 15:53:57', NULL),
(43, 'SRM26', 'SRM26_1.jpg', '2022-12-05 15:54:10', NULL),
(400, 'KD01', 'KD01_1.jpg', NULL, NULL),
(401, 'KD02', 'KD02_1.jpg', '2022-12-05 17:05:59', NULL),
(402, 'KD03', 'KD03_1.jpg', '2022-12-05 17:06:13', NULL),
(403, 'KD04', 'KD04_1.jpg', '2022-12-05 17:06:36', NULL),
(404, 'KD05', 'KD05_1.jpg', '2022-12-05 17:06:49', NULL),
(405, 'KD06', 'KD06_1.jpg', '2022-12-05 17:07:04', NULL),
(406, 'KD07', 'KD07_1.jpg', '2022-12-05 17:07:19', NULL),
(407, 'KD08', 'KD08_1.jpg', '2022-12-05 17:07:56', NULL),
(408, 'KD09', 'KD09_1.jpg', '2022-12-05 17:08:12', NULL),
(411, 'KCN01', 'KCN01_1.jpeg', NULL, NULL),
(412, 'KCN01', 'KCN01_2.jpg', '2022-12-06 03:29:11', NULL),
(413, 'KCN02', 'KCN02_1.jpg', '2022-12-06 03:30:38', NULL),
(414, 'KCN02', 'KCN02_2.png', '2022-12-06 03:30:58', NULL),
(415, 'KCN03', 'KCN03_1.jpg', '2022-12-06 03:34:59', NULL),
(416, 'KCN03', 'KCN03_2.jpg', '2022-12-06 03:35:14', NULL),
(417, 'KCN03', 'KCN03_1.jpg', '2022-12-06 03:35:28', NULL),
(418, 'KCN04', 'KCN04_1.jpg', '2022-12-06 03:36:12', NULL),
(419, 'KCN04', 'KCN04_2.jpg', '2022-12-06 03:36:38', NULL),
(420, 'KCN05', 'KCN05_1.jpg', '2022-12-06 03:46:25', NULL),
(421, 'KCN05', 'KCN05_2.jpg', '2022-12-06 03:46:25', NULL),
(422, 'KCN05', 'KCN05_3.jpg', '2022-12-06 03:47:20', NULL),
(423, 'KCN05', 'KCN05_4.jpg', '2022-12-06 03:47:20', NULL),
(424, 'KCN06', 'KCN06_1.jpg', '2022-12-06 03:48:06', NULL),
(425, 'KCN06', 'KCN06_2.jpg', '2022-12-06 03:48:06', NULL),
(426, 'KCN06', 'KCN06_3.jpeg', '2022-12-06 03:48:35', NULL),
(427, 'KCN07', 'KCN07_1.png', '2022-12-06 03:49:52', NULL),
(428, 'KCN07', 'KCN07_2.jpg', '2022-12-06 03:49:52', NULL),
(429, 'KCN07', 'KCN07_3.jpg', '2022-12-06 03:49:52', NULL),
(430, 'KCN08', 'KCN08_1.jpg', '2022-12-06 03:51:37', NULL),
(431, 'KCN09', 'KCN09_1.jpg', '2022-12-06 03:51:37', NULL),
(432, 'KCN09', 'KCN09_2.jpg', '2022-12-06 03:51:37', NULL),
(441, 'NH01', 'NH01.jpg', NULL, NULL),
(442, 'NH02', 'NH02.jpg', NULL, NULL),
(443, 'NH03', 'NH03.png', '2022-12-06 04:26:46', NULL),
(444, 'NH04', 'NH04.png', '2022-12-06 04:26:46', NULL),
(445, 'NH05', 'NH05.jpg', '2022-12-06 04:26:46', NULL),
(446, 'NH06', 'NH06.jpg', '2022-12-06 04:26:46', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_store`
--

CREATE TABLE `product_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_store` int(11) NOT NULL,
  `number` int(11) NOT NULL DEFAULT 0,
  `number_tranf` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `number_error` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_store`
--

INSERT INTO `product_store` (`id`, `id_product`, `id_store`, `number`, `number_tranf`, `status`, `number_error`, `created_at`, `updated_at`) VALUES
(1, 'SP1001', 1, 50, 0, 0, 0, NULL, NULL),
(2, 'SP1002', 1, 30, 0, 0, 0, NULL, NULL),
(3, 'SP1003', 1, 30, 0, 0, 0, NULL, NULL),
(4, 'SP1004', 1, 55, 0, 0, 0, NULL, NULL),
(5, 'SP1001', 2, 20, 0, 0, 0, NULL, NULL),
(6, 'SP1002', 2, 50, 0, 0, 0, NULL, NULL),
(7, 'SP1003', 2, 30, 0, 0, 0, NULL, NULL),
(8, 'SP1004', 2, 45, 0, 0, 0, NULL, NULL),
(9, 'SP1005', 1, 35, 0, 0, 0, '2018-11-02 19:26:39', '2018-11-27 13:42:02'),
(10, 'SP1005', 2, 57, 0, 0, 0, '2018-11-02 19:48:56', '2018-11-02 19:48:56'),
(11, 'SP1007', 1, 233, 0, 0, 0, '2018-11-13 00:17:34', '2019-03-28 14:04:42'),
(12, 'SP1011', 1, 61, 9, 0, 0, '2018-11-23 00:41:01', '2018-12-05 03:12:47'),
(13, 'SP1012', 1, 20, 0, 0, 0, '2018-11-23 00:41:30', '2018-11-25 12:07:40'),
(14, 'SP1013', 1, 57, 0, 0, 0, '2018-11-23 00:42:11', '2018-11-25 12:07:39'),
(15, 'SP1010', 1, 6, 0, 0, 0, '2018-11-23 06:51:42', '2018-11-23 06:51:42'),
(16, 'SP1024', 2, 26, 0, 0, 0, '2018-11-27 13:43:15', '2018-11-27 13:43:15'),
(17, 'SP1025', 1, 15, 0, 0, 0, '2018-11-27 13:45:55', '2018-11-27 13:45:55'),
(18, 'SP1023', 1, 19, 0, 0, 0, '2018-11-27 13:46:39', '2019-04-06 13:33:10'),
(19, 'SP1021', 1, 16, 0, 0, 0, '2018-11-27 13:48:11', '2018-11-27 13:48:11'),
(20, 'SP1024', 1, 60, 0, 0, 0, '2018-11-29 01:53:42', '2018-11-29 01:53:42'),
(21, 'SP1023', 2, 25, 0, 0, 0, '2018-11-29 02:07:19', '2018-11-29 02:07:19'),
(22, 'SP1015', 1, 22, 0, 0, 0, '2018-12-02 13:50:26', '2018-12-02 13:50:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_order`
--

CREATE TABLE `status_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `status_order`
--

INSERT INTO `status_order` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mới', NULL, NULL),
(2, 'Đang đóng gói', NULL, NULL),
(3, 'Đang chuyển hàng', NULL, NULL),
(4, 'Đã giao hàng', NULL, NULL),
(5, 'Giao hàng thất bại', NULL, NULL),
(6, 'Khách hủy', NULL, NULL),
(7, 'Hệ thống hủy', NULL, NULL),
(8, 'Trả hàng', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_product`
--

CREATE TABLE `type_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_product`
--

INSERT INTO `type_product` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tẩy trang', NULL, NULL),
(2, 'Sữa rửa mặt', NULL, NULL),
(3, 'Serum & Kem dưỡng', NULL, NULL),
(4, 'Kem chống nắng', NULL, NULL),
(5, 'Nước hoa', '2022-12-05 14:44:45', '2022-12-05 14:44:45'),
(6, 'Phụ kiện', '2022-12-05 14:44:57', '2022-12-05 14:44:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `activation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `full_name`, `phone_number`, `address`, `create_at`, `activation`) VALUES
(1, 'admin', '$2y$10$GBozE2c.k9tRdsm/6A3Bz.hOgyZenayrLQgnCpcRRzLm9Oz6tWdd6', 'abcxyz123@gmail.com', '', '', '', '2020-12-14 08:41:16', ''),
(2, 'wownathan', '$2y$10$FnwFyq/DRT0FwXPNhhCIw.2KXnlgKuZlUNhT2bOjL2KhSKdF7Q5Iq', 'biancadolly1709@gmail.com', 'Nguyễn Thùy Dung', '01653233152', '', '2022-12-05 14:50:07', '9C572EA3C2C9D2FB7A6A');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `my_product`
--
ALTER TABLE `my_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status_order`
--
ALTER TABLE `status_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_product`
--
ALTER TABLE `type_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1070;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `my_product`
--
ALTER TABLE `my_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1094;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;

--
-- AUTO_INCREMENT cho bảng `status_order`
--
ALTER TABLE `status_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `type_product`
--
ALTER TABLE `type_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
