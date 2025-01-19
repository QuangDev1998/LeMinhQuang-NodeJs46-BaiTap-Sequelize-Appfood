/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Bánh Mì', 'banhmi.jpg', 15000, 'Bánh mì thơm ngon với nhân đầy đủ', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(2, 'Phở Bò', 'phobo.jpg', 50000, 'Món phở đặc trưng với thịt bò tươi ngon', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(3, 'Gỏi Cuốn', 'goicuon.jpg', 25000, 'Gỏi cuốn tươi ngon, ăn kèm với nước mắm chua ngọt', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(4, 'Cơm Tấm', 'comtam.jpg', 35000, 'Cơm tấm với sườn nướng và trứng ốp la', 3),
(5, 'Bánh Xèo', 'banhxeo.jpg', 20000, 'Bánh xèo giòn, nhân tôm, thịt và giá', 1),
(6, 'Bún Chả', 'buncha.jpg', 45000, 'Bún chả Hà Nội với thịt nướng và nước mắm đặc biệt', 3),
(7, 'Cháo Lòng', 'chaolong.jpg', 30000, 'Cháo lòng thơm ngon, ăn kèm với rau thơm', 3),
(8, 'Sushi', 'sushi.jpg', 120000, 'Sushi Nhật Bản với nhiều loại cá tươi ngon', 3),
(9, 'Trà Sữa', 'trasua.jpg', 35000, 'Trà sữa với trân châu dẻo, ngọt ngào', 2),
(10, 'Coca-Cola', 'coca-cola.jpg', 15000, 'Nước giải khát Coca-Cola, mát lạnh', 2);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Đồ ăn nhanh');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Nước');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Món chính');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2024-12-01 00:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 2, 1, '2024-12-01 00:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 3, 2, '2024-12-02 00:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 4, 3, '2024-12-02 00:00:00'),
(5, 5, 4, '2024-12-03 00:00:00'),
(6, 1, 2, '2024-12-03 00:00:00'),
(7, 2, 3, '2024-12-04 00:00:00'),
(8, 3, 4, '2024-12-04 00:00:00'),
(9, 4, 5, '2024-12-05 00:00:00'),
(10, 5, 1, '2024-12-05 00:00:00'),
(11, 8, 2, '2024-12-06 00:00:00'),
(12, 9, 3, '2024-12-06 00:00:00'),
(13, 10, 4, '2024-12-07 00:00:00'),
(14, 1, 5, '2024-12-07 00:00:00'),
(15, 2, 4, '2024-12-08 00:00:00'),
(16, 3, 1, '2024-12-08 00:00:00'),
(17, 4, 2, '2024-12-09 00:00:00'),
(18, 5, 3, '2024-12-09 00:00:00'),
(19, 8, 5, '2024-12-10 00:00:00'),
(20, 9, 4, '2024-12-10 00:00:00');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORDER12345', '1');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 1, 3, 1, 'ORDER12346', '1');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 2, 2, 3, 'ORDER12347', '3');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 2, 4, 2, 'ORDER12348', '3'),
(5, 3, 5, 1, 'ORDER12349', '1'),
(6, 3, 7, 2, 'ORDER12350', '3'),
(7, 4, 6, 3, 'ORDER12351', '3'),
(8, 4, 8, 1, 'ORDER12352', '3'),
(9, 5, 9, 4, 'ORDER12353', '2'),
(10, 5, 10, 5, 'ORDER12354', '2');

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2024-12-01 00:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 1, 4, '2024-12-02 00:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 2, 3, '2024-12-02 00:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 3, 5, '2024-12-03 00:00:00'),
(5, 5, 4, 2, '2024-12-04 00:00:00'),
(6, 8, 2, 3, '2024-12-07 00:00:00'),
(7, 9, 1, 4, '2024-12-08 00:00:00'),
(8, 10, 3, 1, '2024-12-09 00:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'Quán Bánh Mì Hải Đăng', 'imageA.jpg', 'Nhà hàng nổi tiếng với các món ăn nhanh như bánh mì và gỏi cuốn, phục vụ thức ăn tươi ngon');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'Phở Ngon 24h', 'imageB.jpg', 'Phở bò và cơm tấm là món ăn đặc trưng tại đây, luôn tươi mới và hấp dẫn');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'Sushi Kyoto', 'imageC.jpg', 'Chuyên các món chính như sushi, bún chả, và bánh xèo, phong cách Nhật Bản hiện đại');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(4, 'Bánh Xèo Đặc Sản', 'imageD.jpg', 'Nhà hàng phục vụ các món ăn nhanh như bánh xèo và gỏi cuốn, nổi tiếng với hương vị đậm đà'),
(5, 'Cơm Tấm Sài Gòn', 'imageE.jpg', 'Cung cấp các món ăn chính đậm đà, cơm tấm sườn nướng là món không thể bỏ qua tại nhà hàng');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Trứng ốp la', 5000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Giò Chả', 15000, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Sườn Nướng', 20000, 4);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Thịt', 2000, 3),
(5, 'Thịt Nướng', 25000, 5),
(6, 'Chả Giò', 10000, 5),
(7, 'Tôm', 12000, 6),
(8, 'Trân Châu', 8000, 8),
(9, 'Thịt Bò', 10000, 2),
(10, 'Rau', 5000, 6);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyen Tan Dung', 'nguyentan.dung@example.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Tran Minh Tu', 'tranminhtu@example.com', 'securePass456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Le Thi Mai', 'lethimai@example.com', 'mypassword789');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Pham Quang Hieu', 'phamquanghieu@example.com', 'hieu2024'),
(5, 'Nguyen Thanh Lan', 'nguyenthanhlan@example.com', 'lan@1234'),
(6, 'Do Thi Thu', 'dothithu@example.com', 'thu5678'),
(7, 'Hoang Minh Hoang', 'hoangminhoang@example.com', 'hoang@2024'),
(8, 'Bui Thi Lan Anh', 'buithilananh@example.com', 'lananh@abc'),
(9, 'Nguyen Hong Son', 'nguyenhongson@example.com', 'son321@!'),
(10, 'Truong Minh Thu', 'truongminhthu@example.com', 'thu!2024');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;