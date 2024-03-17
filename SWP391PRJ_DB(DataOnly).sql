USE [SWP391_FinalPrjDB]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (1, N'A', N'1', N'A@gmail.com', N'0123456789', N'Quy', N'ABC HaHa Street', 2, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (2, N'B', N'1', N'B@gmail.com', NULL, NULL, NULL, 2, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (3, N'C', N'1', N'C@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (4, N'D', N'1', N'D@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (5, N'E', N'1', N'E@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (6, N'F', N'1', N'F@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (7, N'G', N'1', N'G@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (8, N'H', N'1', N'H@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (9, N'J', N'1', N'J@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (10, N'K', N'1', N'K@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (11, N'L', N'1', N'L@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (12, N'M', N'1', N'M@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (13, N'N', N'1', N'N@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (14, N'O', N'1', N'O@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (15, N'P', N'1', N'P@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (16, N'swp391c02rt02@gmail.com', N'{78w(K$o>q', N'swp391c02rt02@gmail.com', NULL, NULL, NULL, 1, N'img/users/default/1.jpg')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name], [ban_time], [ban_status]) VALUES (1, N'123456', N'Welcome to my shop', NULL, 0, N'A Shop', NULL, 0)
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name], [ban_time], [ban_status]) VALUES (2, N'654321', N'Welcome to my shop', NULL, 0, N'B Shop', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[maincategory] ON 

INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (1, N'fashion', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (2, N'technology', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (3, N'houseware', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (4, N'food', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (5, N'travel', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (6, N'fitness', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (7, N'entertainment', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (8, N'books', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (9, N'home decor', NULL)
INSERT [dbo].[maincategory] ([id], [name], [description]) VALUES (10, N'electronics', NULL)
SET IDENTITY_INSERT [dbo].[maincategory] OFF
GO
SET IDENTITY_INSERT [dbo].[shopcategory] ON 

INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (1, 1, 1, N'T-shirt', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (2, 1, 1, N'Jean', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (3, 1, 1, N'Dress', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (4, 1, 1, N'Skirts', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (5, 1, 1, N'Blouses', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (6, 1, 1, N'Jackets', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (7, 9, 2, N'Curtains', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (8, 9, 2, N'Lamps', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (9, 9, 2, N'Rugs', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (10, 9, 2, N'Decorative Pillows', NULL)
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name], [description]) VALUES (11, 9, 2, N'Wall Art', NULL)
SET IDENTITY_INSERT [dbo].[shopcategory] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (1, 1, 1, N'High-quality Cotton T-shirt', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Cotton T-shirt', 20000.0000, N'img/seller/1/1', 50)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (2, 1, 2, N'Stylish Blue Jeans', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Blue Jeans', 40000.0000, N'img/seller/1/2', 30)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (3, 1, 3, N'Elegant Evening Dress', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Evening Dress', 90000.0000, N'img/seller/1/3', 20)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (4, 1, 4, N'Casual Skirts', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Casual Skirts', 30000.0000, N'img/seller/1/4', 40)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (5, 1, 5, N'Formal Blouses', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Formal Blouses', 50000.0000, N'img/seller/1/1', 25)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (6, 1, 6, N'Fashionable Jackets', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Fashionable Jackets', 70000.0000, N'img/seller/1/2', 15)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (7, 2, 7, N'Floral Pattern Curtains', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Floral Curtains', 30000.0000, NULL, 15)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (8, 2, 8, N'Modern Table Lamp', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Table Lamp', 50000.0000, NULL, 25)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (9, 2, 9, N'Soft and Cozy Area Rug', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Cozy Area Rug', 80000.0000, NULL, 10)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (10, 2, 10, N'Decorative Pillows Set', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Decorative Pillows Set', 40000.0000, NULL, 18)
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (11, 2, 11, N'Abstract Wall Art', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Abstract Wall Art', 70000.0000, NULL, 12)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (1, N'QuyNguyen Express', 10000.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (2, N'NguyenDuy Express', 20000.0000, 3)
GO
SET IDENTITY_INSERT [dbo].[vouchers] ON 

INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (1, N'Mv01', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (2, N'Mv02', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (3, N'MvI', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (4, N'MvII', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (5, N'MvAA', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, 1, 0)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (6, N'MvBB', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1000, N'no description', 1, 1, 7)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (7, N'MvI', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (8, N'MvII', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
SET IDENTITY_INSERT [dbo].[vouchers] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (1, 4, 1, 5000.0000, 50000.0000, N'COD', N'chờ người bán xác nhận', N'John Doe', N'123456789', N'123 Main St', N'nhanh', NULL, CAST(N'2024-03-16T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (2, 5, 1, 5000.0000, 60000.0000, N'OnlineBanking', N'chờ người bán xác nhận', N'Jane Smith', N'987654321', N'456 Oak St', N'hỏa tốc', NULL, CAST(N'2024-03-16T18:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (3, 4, 1, 5000.0000, 55000.0000, N'COD', N'chờ người bán xác nhận', N'Alice Johnson', N'111222333', N'789 Elm St', N'tiết kiệm', NULL, CAST(N'2024-03-16T22:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (4, 5, 1, 5000.0000, 70000.0000, N'OnlineBanking', N'chờ người bán xác nhận', N'Bob Brown', N'444555666', N'321 Pine St', N'nhanh', NULL, CAST(N'2024-03-17T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (5, 4, 1, 5000.0000, 52000.0000, N'COD', N'chờ người bán xác nhận', N'Sarah Davis', N'777888999', N'654 Maple St', N'hỏa tốc', NULL, CAST(N'2024-03-17T00:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (6, 5, 1, 5000.0000, 58000.0000, N'OnlineBanking', N'chờ người bán xác nhận', N'Michael Wilson', N'666777888', N'987 Cedar St', N'tiết kiệm', NULL, CAST(N'2024-03-17T00:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (7, 4, 1, 5000.0000, 65000.0000, N'COD', N'chờ người bán xác nhận', N'Emily Taylor', N'222333444', N'753 Birch St', N'nhanh', NULL, CAST(N'2024-03-17T01:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (8, 5, 1, 5000.0000, 75000.0000, N'OnlineBanking', N'chờ người bán xác nhận', N'David Martinez', N'999888777', N'159 Walnut St', N'hỏa tốc', NULL, CAST(N'2024-03-17T01:30:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (9, 4, 1, 5000.0000, 53000.0000, N'COD', N'chờ người bán xác nhận', N'Olivia Anderson', N'333444555', N'369 Oak St', N'tiết kiệm', NULL, CAST(N'2024-03-17T01:45:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (10, 5, 1, 5000.0000, 63000.0000, N'OnlineBanking', N'chờ người bán xác nhận', N'Sophia Hernandez', N'555444333', N'753 Elm St', N'nhanh', NULL, CAST(N'2024-03-17T02:45:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (11, 6, 1, 10000.0000, 70000.0000, N'COD', N'đã nhận', N'Quý', N'0123456789', N'1 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-16T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (12, 6, 1, 10000.0000, 70000.0000, N'OnlineBanking', N'đã nhận', N'Khanh', N'0123456789', N'2 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-16T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (13, 6, 1, 10000.0000, 70000.0000, N'COD', N'đã nhận', N'Khánh', N'0123456789', N'3 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-16T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (14, 6, 1, 10000.0000, 70000.0000, N'OnlineBanking', N'đã nhận', N'Quân', N'0123456789', N'4 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-16T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (15, 6, 1, 10000.0000, 70000.0000, N'COD', N'đã nhận', N'Quyền', N'0123456789', N'5 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-05T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (16, 6, 1, 10000.0000, 70000.0000, N'OnlineBanking', N'đã nhận', N'Huyền', N'0123456789', N'6 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-05T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (17, 6, 1, 10000.0000, 70000.0000, N'COD', N'đã nhận', N'Hiền', N'0123456789', N'7 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-11T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (18, 6, 1, 10000.0000, 70000.0000, N'OnlineBanking', N'đã nhận', N'Hà', N'0123456789', N'8 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-11T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (19, 6, 1, 10000.0000, 70000.0000, N'COD', N'đã nhận', N'Hạnh', N'0123456789', N'9 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-06T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (20, 6, 1, 10000.0000, 70000.0000, N'OnlineBanking', N'đã nhận', N'Thu', N'0123456789', N'10 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-06T12:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (21, 6, 1, 10000.0000, 70000.0000, N'COD', N'đã nhận', N'Đức', N'0123456789', N'11 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-07T12:00:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
