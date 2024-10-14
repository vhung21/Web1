-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 14, 2024 lúc 06:06 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `learncode5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`id`, `price`, `quantity`, `order_id`, `product_id`, `user_id`) VALUES
(1, 100, 1, 1, 39, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `category_name`, `description`, `name`) VALUES
(1, 'SHIRT', NULL, NULL),
(2, 'TROUSERS', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount` bigint(20) DEFAULT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `discount` bigint(20) DEFAULT NULL,
  `order_description` varchar(255) DEFAULT NULL,
  `order_status` tinyint(4) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `total_amount` bigint(20) DEFAULT NULL,
  `tracking_id` binary(16) DEFAULT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `address`, `amount`, `date`, `discount`, `order_description`, `order_status`, `payment`, `total_amount`, `tracking_id`, `coupon_id`, `user_id`) VALUES
(1, NULL, 100, NULL, 0, NULL, 0, NULL, 100, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `added_by` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `img` mediumblob DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `manufacturer`, `price`, `product_code`, `product_name`, `quantity`, `category_id`, `added_by`, `description`, `img`, `name`) VALUES
(39, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(42, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(43, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(44, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(45, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(46, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(47, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(48, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(49, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(50, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(51, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 10', 'Tên sản phẩm mới 11', 10, 2, 'anonymousUser', NULL, NULL, NULL),
(52, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 11', 'Tên sản phẩm mới 12', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(53, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 11', 'Tên sản phẩm mới 12', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(54, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 12', 'Tên sản phẩm mới 12', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(55, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 12', 'Tên sản phẩm mới 13', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(56, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 12', 'Tên sản phẩm mới 13', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(57, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 15', 'Tên sản phẩm mới 15', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(58, 'Nhà sản xuất mới 11', 100, 'Mã sản phẩm mới 16', 'Tên sản phẩm mới 16', 10, 1, 'anonymousUser', NULL, NULL, NULL),
(59, 'Nhà sản xuất mới 8', 100, 'Mã sản phẩm mới 8', 'admin', 10, 2, 'admin1', NULL, NULL, NULL),
(60, 'Nhà sản xuất mới 8', 100, 'Mã sản phẩm mới 9', 'admin1', 10, 2, 'admin1', NULL, NULL, NULL),
(61, 'Nhà sản xuất mới 8', 100, 'Mã sản phẩm mới 100', 'admin100', 10, 2, 'admin1', NULL, NULL, NULL),
(62, 'Nhà sản xuất mới 8', 100, 'Mã sản phẩm mới 101', 'admin101', 10, 2, 'admin1', NULL, NULL, NULL),
(63, 'Nhà sản xuất mới 8', 100, 'Mã sản phẩm mới 102', 'admin102', 10, 2, 'admin1', NULL, NULL, NULL),
(64, 'Nhà sản xuất mới 8', 100, 'Mã sản phẩm mới 103', 'admin103', 10, 2, 'admin1', NULL, NULL, NULL),
(65, 'Nhà sản xuất mới 5', 15546, '1', 'Tên sản phẩm mới 0010101', 2, 1, 'admin1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `id` bigint(20) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `img` longblob DEFAULT NULL,
  `rating` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `fullname`, `password`, `username`) VALUES
(1, 'admin1@gmail.com', 'Nghiêm Việt Hùng', '$2a$10$5uakiYG/ejDX0G2Fi0FaP.rTKRzM2trGQzRgD/jEHEiZLB8YcDPC.', 'admin1'),
(14, 'admin5@gmail.com', 'Đào Hải Phong', '$2a$10$c5XcqXppWBixjuF2ERP.NO3H9NFCyD3W6y4hSCvwXXintPXzDBT3m', 'admin4'),
(15, 'admin3@gmail.com', 'Đào Khánh Vy', '$2a$10$xrbpsrmZBnERaRiIg1zq0.ClTbuI0Co5lE/tGY03Ga0wqePMs.1vi', 'admin3'),
(25, 'admin8@gmail.com', 'admin8', '$2a$10$V2qFLfZ0pXJ/zfdtIO6OgumX7sghTMt7QyQtdV5vnMiFDHq1gImcW', 'admin8'),
(26, 'admin9@gmail.com', 'admin9', '$2a$10$2QdN3LbgAoNVWEaMbI0rtur6IlSdgLiTiElE9WO7OtgeKFGxD0fHi', 'admin9'),
(27, 'admin11@gmail.com', 'admin11', '$2a$10$HxKWOpIUoJuNqo.Hy30qK.WWq11g62W9Y7HEOHVHiZjuk8CjfLg7i', 'admin11'),
(28, 'admin28@gmail.com', 'Đào Khánh Vy 1', '$2a$10$I18g9XUjRGBtjNpAnXT1PuGw49ub2NvqkspmFXTRdBrMls.f/ggTS', 'admin12'),
(35, 'admin10@gmail.com', 'Đ', '$2a$10$ytJ3TqTd3Gf/VLVH/LlBY.CJ6a6/tdUozaBZq7GQeYzSnWu2KwZgG', 'admin10'),
(37, 'john.doe@example.com', 'A', '$2a$10$Py1YXp0KNb9AuUJjeqF8C.irjDaLkbaeTgGkxSHcmitK4qAj2kHr.', 'john_doe'),
(39, 'admin2@gmail.com', 'Nghiêm Việt Hùng 1', '$2a$10$myK5eu6Gt2A5iqlBIQ5WzO.Xx5VkxHASwD.2BcClQg06kw6J3E7zG', 'admin2'),
(48, 'admin123@gmail.com', 'Nghiêm Việt Hùng 2', '$2a$10$VKv9tdEzUNMQ/xRG8N/3zOAgugiHCXm8RSBc/II50iEh9XM1d6LtS', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img` longblob DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `img`, `name`, `password`, `role`) VALUES
(1, 'admin@gmail.com', NULL, 'admin', '$2a$10$Cn6Lr3o9om11wpsJxv63EOOkoDPx4K4PSawGSVKMp8TIjV52HDlyG', 0),
(2, 'vhung2002@gmail.com', NULL, 'Nghiêm Việt Hùng', '$2a$10$QXT4PvN9a/R4.7adsbYKl.vOy4lK5SNule.mpMnZ7Khs.qeP.4A5m', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(26, 2),
(27, 2),
(15, 1),
(25, 2),
(1, 1),
(28, 1),
(35, 2),
(37, 1),
(37, 2),
(39, 2),
(14, 1),
(48, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_shvxaq4vg05f3q75fnnel0klb` (`order_id`),
  ADD KEY `FKl7je3auqyq1raj52qmwrgih8x` (`product_id`),
  ADD KEY `FK709eickf3kc0dujx3ub9i7btf` (`user_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8bd3bvckkrykatc3dxp9cchp0` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_hy4cwtbxgq00s7bldwc96ulx9` (`coupon_id`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKiyof1sindb9qiqr9o8npj8klt` (`product_id`),
  ADD KEY `FK6cpw2nlklblpvc7hyt7ko6v3e` (`user_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  ADD UNIQUE KEY `UK_jfn4eqw0voflq81o9y4eyavyn` (`fullname`),
  ADD UNIQUE KEY `UK_kiqfjabx9puw3p1eg7kily8kg` (`password`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqchevbfw5wq0f4uqacns02rp7` (`product_id`),
  ADD KEY `FKtrd6335blsefl2gxpb8lr0gr7` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK709eickf3kc0dujx3ub9i7btf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKiuhn9mru62vgqy1h0t1ggc3s7` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKl7je3auqyq1raj52qmwrgih8x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `FK8bd3bvckkrykatc3dxp9cchp0` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKn1d1gkxckw648m2n2d5gx0yx5` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK6cpw2nlklblpvc7hyt7ko6v3e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FKqchevbfw5wq0f4uqacns02rp7` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FKtrd6335blsefl2gxpb8lr0gr7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
