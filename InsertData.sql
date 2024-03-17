USE SWP391_FinalPrjDB
GO
insert into [users]([username],[password],[email]) VALUES
('A','1','A@gmail.com'),
('B','1','B@gmail.com'),
('C','1','C@gmail.com'),
('D','1','D@gmail.com'),
('E','1','E@gmail.com'),
('F','1','F@gmail.com'),
('G','1','G@gmail.com'),
('H','1','H@gmail.com'),
('J','1','J@gmail.com'),
('K','1','K@gmail.com'),
('L','1','L@gmail.com'),
('M','1','M@gmail.com'),
('N','1','N@gmail.com'),
('O','1','O@gmail.com'),
('P','1','P@gmail.com');
insert into [shops](shop_id,CCCD,shop_name) values 
(1,'123456','A Shop'),
(2,'654321','B Shop');

--DATA INSERT FOR MAIN CATEGORY ID
insert into [maincategory]([name])values
('fashion'),('technology'),('houseware'),('food'),('travel'),('fitness'),('entertainment'),('books'),('home decor'),('electronics');
--DATA INSERT FOR SHOPCATEGORY ID
INSERT INTO [shopcategory](maincate_id,shop_id,name)VALUES
(1,1,'T-shirt'),(1,1,'Jean'),(1,1,'Dress'),(1, 1, 'Skirts'),(1, 1, 'Blouses'),(1, 1, 'Jackets'),(9, 2, 'Curtains'),
(9, 2, 'Lamps'),(9, 2, 'Rugs'),(9, 2, 'Decorative Pillows'),(9, 2, 'Wall Art');

--DATA INSERT FOR PRODUCT
INSERT INTO [products] ([shop_id], [scate_id], [description], [name], [price], [quantity])
VALUES
  (1, 1, 'High-quality Cotton T-shirt', 'Cotton T-shirt', 19999, 50),
  (1, 2, 'Stylish Blue Jeans', 'Blue Jeans', 39999, 30),
  (1, 3, 'Elegant Evening Dress', 'Evening Dress', 89999, 20),
  (1, 4, 'Casual Skirts', 'Casual Skirts', 29999, 40),
  (1, 5, 'Formal Blouses', 'Formal Blouses', 49999, 25),
  (1, 6, 'Fashionable Jackets', 'Fashionable Jackets', 69999, 15),

  (2, 7, 'Floral Pattern Curtains', 'Floral Curtains', 29999, 15),
  (2, 8, 'Modern Table Lamp', 'Table Lamp', 49999, 25),
  (2, 9, 'Soft and Cozy Area Rug', 'Cozy Area Rug', 79999, 10),
  (2, 10, 'Decorative Pillows Set', 'Decorative Pillows Set', 39999, 18),
  (2, 11, 'Abstract Wall Art', 'Abstract Wall Art', 69999, 12);

--14/03/24 7:17
insert into [shippingunits]([id],[name],[support_shippingmethod],[cost])
values (1,'QuyNguyen Express',1,10000),
(2,'NguyenDuy Express',3,20000)
INSERT INTO [vouchers]([code],[discount_amount],[start_date],[expire_date],[type],[min_require],[description],[shop_id],[use_count]) VALUES
('Mv01',1,'01-03-2024','02-03-2024',2,1,'no description',1,10),
('Mv02',1,'01-03-2024','02-03-2024',2,1,'no description',1,10),
('MvI',1,'01-03-2024','02-03-2024',2,1,'no description',2,10),
('MvII',1,'01-03-2024','02-03-2024',2,1,'no description',2,10)

-- CHANGE THE DEFAULT VALUE OF ROW IMG IN USERS
ALTER TABLE [users]
DROP CONSTRAINT DF__users__img__38996AB5; 

ALTER TABLE [users]
ADD CONSTRAINT DF__users__img__38996AB5 DEFAULT 'img/users/default/1.jpg' FOR [img];
--
--ADD DEFAULT VALUE FOR STATUS IN ORDER
ALTER TABLE[orders]
ADD CONSTRAINT DF_orders_status_1 DEFAULT 'wait for seller respond' FOR [status]

SET IDENTITY_INSERT [orders] ON
INSERT INTO [orders]
([order_id], [customer_id],[shop_id],[shipping_cost],[total],[payment_method],[receiver_name],[receiver_phone],[receiver_address],[shipping_method],[order_date])
VALUES
(1, 4, 1, 5.00, 50.00, N'Cash', N'John Doe', N'123456789', N'123 Main St', N'nhanh', '2024-03-16T12:00:00'),
(2, 5, 1, 7.00, 60.00, N'OnlineBanking', N'Jane Smith', N'987654321', N'456 Oak St', N'hỏa tốc', '2024-03-16T18:00:00'),
(3, 4, 1, 6.00, 55.00, N'Cash', N'Alice Johnson', N'111222333', N'789 Elm St', N'tiết kiệm', '2024-03-16T22:00:00'),
(4, 5, 1, 8.00, 70.00, N'OnlineBanking', N'Bob Brown', N'444555666', N'321 Pine St', N'nhanh', '2024-03-17T00:00:00'),
(5, 4, 1, 5.50, 52.00, N'Cash', N'Sarah Davis', N'777888999', N'654 Maple St', N'hỏa tốc', '2024-03-17T00:30:00'),
(6, 5, 1, 6.50, 58.00, N'OnlineBanking', N'Michael Wilson', N'666777888', N'987 Cedar St', N'tiết kiệm', '2024-03-17T00:30:00'),
(7, 4, 1, 7.50, 65.00, N'Cash', N'Emily Taylor', N'222333444', N'753 Birch St', N'nhanh', '2024-03-17T01:00:00'),
(8, 5, 1, 8.50, 75.00, N'OnlineBanking', N'David Martinez', N'999888777', N'159 Walnut St', N'hỏa tốc', '2024-03-17T01:30:00'),
(9, 4, 1, 5.75, 53.00, N'Cash', N'Olivia Anderson', N'333444555', N'369 Oak St', N'tiết kiệm', '2024-03-17T01:45:00'),
(10, 5, 1, 6.75, 63.00, N'OnlineBanking', N'Sophia Hernandez', N'555444333', N'753 Elm St', N'nhanh', '2024-03-17T02:45:00');

SET IDENTITY_INSERT [orders] OFF
GO

SET IDENTITY_INSERT [orders] ON
INSERT INTO [orders]
(order_id,customer_id,shop_id,shipping_cost,total,payment_method,status,receiver_name,
receiver_phone,receiver_address,shipping_method,shippingunit_id,order_date)
VALUES
(11,6,1,10000,70000,N'COD',N'đã nhận',N'Quý',N'0123456789',N'1 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(12,6,1,10000,70000,N'OnlineBanking',N'đã nhận',N'Khanh',N'0123456789',N'2 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(13,6,1,10000,70000,N'COD',N'đã nhận',N'Khánh',N'0123456789',N'3 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(14,6,1,10000,70000,N'OnlineBanking',N'đã nhận',N'Quân',N'0123456789',N'4 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(15,6,1,10000,70000,N'COD',N'đã nhận',N'Quyền',N'0123456789',N'5 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(16,6,1,10000,70000,N'OnlineBanking',N'đã nhận',N'Huyền',N'0123456789',N'6 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(17,6,1,10000,70000,N'COD',N'đã nhận',N'Hiền',N'0123456789',N'7 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(18,6,1,10000,70000,N'OnlineBanking',N'đã nhận',N'Hà',N'0123456789',N'8 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(19,6,1,10000,70000,N'COD',N'đã nhận',N'Hạnh',N'0123456789',N'9 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(20,6,1,10000,70000,N'OnlineBanking',N'đã nhận',N'Thu',N'0123456789',N'10 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00'),
(21,6,1,10000,70000,N'COD',N'đã nhận',N'Đức',N'0123456789',N'11 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng',N'nhanh',1, '2024-03-16T12:00:00')
SET IDENTITY_INSERT [orders] OFF
GO