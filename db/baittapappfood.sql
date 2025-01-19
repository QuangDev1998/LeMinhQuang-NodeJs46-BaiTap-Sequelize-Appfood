-- Bài Tập APP-FOOD

                                  -- Tạo Table user
CREATE TABLE users (
user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
full_name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL
)

                                  -- Thêm dữ liệu vào user
INSERT INTO users (full_name, email, password) VALUES
('Nguyen Tan Dung', 'nguyentan.dung@example.com', 'password123'),
('Tran Minh Tu', 'tranminhtu@example.com', 'securePass456'),
('Le Thi Mai', 'lethimai@example.com', 'mypassword789'),
('Pham Quang Hieu', 'phamquanghieu@example.com', 'hieu2024'),
('Nguyen Thanh Lan', 'nguyenthanhlan@example.com', 'lan@1234'),
('Do Thi Thu', 'dothithu@example.com', 'thu5678'),
('Hoang Minh Hoang', 'hoangminhoang@example.com', 'hoang@2024'),
('Bui Thi Lan Anh', 'buithilananh@example.com', 'lananh@abc'),
('Nguyen Hong Son', 'nguyenhongson@example.com', 'son321@!'),
('Truong Minh Thu', 'truongminhthu@example.com', 'thu!2024')



                                  -- Tạo Table food_type 
CREATE TABLE IF NOT EXISTS food_type (
  type_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  type_name VARCHAR(255) NOT NULL               
)
INSERT INTO food_type (type_name) VALUES
  ('Đồ ăn nhanh'),
  ('Nước'),
  ('Món chính')




                                  -- Tạo Table food 
CREATE TABLE IF NOT EXISTS food (
  food_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,        
  food_name VARCHAR(255) NOT NULL,         
  image VARCHAR(255) ,                
  price FLOAT NOT NULL,                   
  `desc` VARCHAR(255) ,                 
  type_id INT NOT NULL,                                            
  FOREIGN KEY (type_id) REFERENCES food_type(type_id)  
)
                                  -- Thêm dữ liệu vào food
INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
  ('Bánh Mì', 'banhmi.jpg', 15000, 'Bánh mì thơm ngon với nhân đầy đủ', 1),
  ('Phở Bò', 'phobo.jpg', 50000, 'Món phở đặc trưng với thịt bò tươi ngon', 3),
  ('Gỏi Cuốn', 'goicuon.jpg', 25000, 'Gỏi cuốn tươi ngon, ăn kèm với nước mắm chua ngọt', 1),
  ('Cơm Tấm', 'comtam.jpg', 35000, 'Cơm tấm với sườn nướng và trứng ốp la', 3),
  ('Bánh Xèo', 'banhxeo.jpg', 20000, 'Bánh xèo giòn, nhân tôm, thịt và giá', 1),
  ('Bún Chả', 'buncha.jpg', 45000, 'Bún chả Hà Nội với thịt nướng và nước mắm đặc biệt', 3),
  ('Cháo Lòng', 'chaolong.jpg', 30000, 'Cháo lòng thơm ngon, ăn kèm với rau thơm', 3),
  ('Sushi', 'sushi.jpg', 120000, 'Sushi Nhật Bản với nhiều loại cá tươi ngon', 3),
  ('Trà Sữa', 'trasua.jpg', 35000, 'Trà sữa với trân châu dẻo, ngọt ngào', 2),
  ('Coca-Cola', 'coca-cola.jpg', 15000, 'Nước giải khát Coca-Cola, mát lạnh', 2)




                                  -- Tạo table restaurant
   CREATE TABLE IF NOT EXISTS restaurant (
  res_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,    
  res_name VARCHAR(255) NOT NULL,        
  image VARCHAR(255) ,               
  `desc` VARCHAR(255)                                 
)

                                  -- Thêm data vào restaurant 
INSERT INTO restaurant (res_name, image, `desc`) VALUES
  ('Quán Bánh Mì Hải Đăng', 'imageA.jpg', 'Nhà hàng nổi tiếng với các món ăn nhanh như bánh mì và gỏi cuốn, phục vụ thức ăn tươi ngon'),
  ('Phở Ngon 24h', 'imageB.jpg', 'Phở bò và cơm tấm là món ăn đặc trưng tại đây, luôn tươi mới và hấp dẫn'),
  ('Sushi Kyoto', 'imageC.jpg', 'Chuyên các món chính như sushi, bún chả, và bánh xèo, phong cách Nhật Bản hiện đại'),
  ('Bánh Xèo Đặc Sản', 'imageD.jpg', 'Nhà hàng phục vụ các món ăn nhanh như bánh xèo và gỏi cuốn, nổi tiếng với hương vị đậm đà'),
  ('Cơm Tấm Sài Gòn', 'imageE.jpg', 'Cung cấp các món ăn chính đậm đà, cơm tấm sườn nướng là món không thể bỏ qua tại nhà hàng')




                                   -- Tạo Table order
   CREATE TABLE IF NOT EXISTS `orders` (
  order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,         
  user_id INT,                        
  food_id INT ,                         
  amount INT ,                         
  code VARCHAR(255) ,                 
  arr_sub_id VARCHAR(255) ,                 
                     
  FOREIGN KEY (user_id) REFERENCES users (user_id), 
  FOREIGN KEY (food_id) REFERENCES food (food_id) 
)

                                   -- Thêm data vào order
INSERT INTO `orders` (user_id, food_id, amount, code, arr_sub_id) VALUES
  (1, 1, 2, 'ORDER12345', 1),  
  (1, 3, 1, 'ORDER12346', 1),  
  (2, 2, 3, 'ORDER12347', 3),  
  (2, 4, 2, 'ORDER12348', 3),  
  (3, 5, 1, 'ORDER12349', 1),  
  (3, 7, 2, 'ORDER12350', 3), 
  (4, 6, 3, 'ORDER12351', 3),  
  (4, 8, 1, 'ORDER12352', 3),  
  (5, 9, 4, 'ORDER12353', 2),  
  (5, 10, 5, 'ORDER12354', 2)


                                   -- Tạo Table sub_food
CREATE TABLE IF NOT EXISTS sub_food (
  sub_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,       
  sub_name VARCHAR(255) NOT NULL,           
  sub_price FLOAT NOT NULL,                 
  food_id INT NOT NULL,                     
                       
  FOREIGN KEY (food_id) REFERENCES food (food_id)  
)

                                   -- Thêm data vào sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
 ('Trứng ốp la', 5000, 1),
 ('Giò Chả', 15000, 2),
 ('Sườn Nướng', 20000, 4),
 ('Thịt',2000,3),
 ('Thịt Nướng', 25000, 5),
 ('Chả Giò', 10000, 5),
 ('Tôm', 12000, 6), 
 ('Trân Châu', 8000, 8),
 ('Thịt Bò', 10000, 2),
 ('Rau', 5000, 6)
 
 

                                    -- Tạo Table rate_res
 CREATE TABLE IF NOT EXISTS rate_res (
  rate_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,      
  user_id INT NOT NULL,                     
  res_id INT NOT NULL,                      
  amount INT NOT NULL,                     
  date_rate DATETIME DEFAULT CURRENT_TIMESTAMP,
                      
  FOREIGN KEY (user_id) REFERENCES users (user_id), 
  FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
)

                                    -- Thêm Data vào rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
  (1, 1, 5, '2024-12-01'),  
  (2, 1, 4, '2024-12-02'),  
  (3, 2, 3, '2024-12-02'),  
  (4, 3, 5, '2024-12-03'),  
  (5, 4, 2, '2024-12-04'),  
  (8, 2, 3, '2024-12-07'),  
  (9, 1, 4, '2024-12-08'),  
  (10, 3, 1, '2024-12-09')


                                    -- Tạo Table like_res
CREATE TABLE IF NOT EXISTS like_res (
  like_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,     
  user_id INT NOT NULL,                     
  res_id INT NOT NULL,                      
  date_like DATETIME DEFAULT CURRENT_TIMESTAMP,  
                     
  FOREIGN KEY (user_id) REFERENCES users (user_id),  
  FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
)

                                    -- Thêm data vào like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
  (1, 1, '2024-12-01'),
  (2, 1, '2024-12-01'),
  (3, 2, '2024-12-02'),
  (4, 3, '2024-12-02'),
  (5, 4, '2024-12-03'),
  (1, 2, '2024-12-03'),
  (2, 3, '2024-12-04'),
  (3, 4, '2024-12-04'),
  (4, 5, '2024-12-05'),
  (5, 1, '2024-12-05'),
  (8, 2, '2024-12-06'),
  (9, 3, '2024-12-06'),
  (10, 4, '2024-12-07'),
  (1, 5, '2024-12-07'),
  (2, 4, '2024-12-08'),
  (3, 1, '2024-12-08'),
  (4, 2, '2024-12-09'),
  (5, 3, '2024-12-09'),
  (8, 5, '2024-12-10'),
  (9, 4, '2024-12-10')
  
  
                                                   ---- Bài Tập ----
  
  
-- Tìm 5 người đã like nhà hàng nhiều nhất.
   SELECT  COUNT(like_res.user_id) AS count_like_res,like_res.user_id, users.user_id, users.full_name, users.email
FROM like_res
INNER JOIN users ON like_res.user_id = users.user_id
GROUP BY like_res.user_id
ORDER BY count_like_res DESC
LIMIT 5


-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT restaurant.res_id, restaurant.res_name, COUNT(like_res.res_id) AS like_res_count
FROM like_res
INNER JOIN restaurant ON like_res.res_id = restaurant.res_id
GROUP BY restaurant.res_id, restaurant.res_name
ORDER BY like_res_count DESC
LIMIT 2

-- Tìm người đã dặt hàng nhiều nhất
SELECT  COUNT(orders.user_id) AS order_count,orders.user_id, users.user_id, users.full_name, users.email
FROM orders
INNER JOIN users ON orders.user_id = users.user_id
GROUP BY orders.user_id
ORDER BY order_count DESC
LIMIT 1


-- Tìm người dùng không hoạt động trong hệ thống(không đặt hàng, không like, không đánh giá nhà hàng)
SELECT users.user_id, users.full_name, users.email
FROM users 
LEFT JOIN orders ON users.user_id = orders.user_id
LEFT JOIN like_res ON users.user_id = like_res.user_id
LEFT JOIN rate_res  ON users.user_id = rate_res.user_id
WHERE orders.user_id IS NULL
AND like_res.user_id IS NULL
AND rate_res.user_id IS NULL

