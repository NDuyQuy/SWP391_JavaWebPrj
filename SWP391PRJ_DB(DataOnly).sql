USE [SWP391_FinalPrjDB]
GO
DELETE FROM [dbo].[ratings]
GO
DELETE FROM [dbo].[refundsnreturns]
GO
DELETE FROM [dbo].[productvoucherdetail]
GO
DELETE FROM [dbo].[orderdetail]
GO
DELETE FROM [dbo].[shopvoucherdetail]
GO
DELETE FROM [dbo].[vouchers]
GO
DELETE FROM [dbo].[orders]
GO
DELETE FROM [dbo].[shippingunits]
GO
DELETE FROM [dbo].[cartdetail]
GO
DELETE FROM [dbo].[products]
GO
DELETE FROM [dbo].[shopcategory]
GO
DELETE FROM [dbo].[maincategory]
GO
DELETE FROM [dbo].[messages]
GO
DELETE FROM [dbo].[notifications]
GO
DELETE FROM [dbo].[sellerrequest]
GO
DELETE FROM [dbo].[reportedusers]
GO
DELETE FROM [dbo].[custom_order_detail]
GO
DELETE FROM [dbo].[custom_order]
GO
DELETE FROM [dbo].[shops]
GO
DELETE FROM [dbo].[users]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (1, N'Q                                                 ', N'123456                                            ', N'q@gmail.com                                                                                         ', N'0123456789          ', N'Q                                                 ', N'ABC Street', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (7, N'Qa                                                ', N'1                                                 ', N'qa@gmail.com                                                                                        ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (8, N'aa                                                ', N'1                                                 ', N'QuyAA@gmail.com                                                                                     ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (9, N'J                                                 ', N'2                                                 ', N'J@gmail.com                                                                                         ', N'0123456789          ', N'J M Alexer                                        ', N'AHa Street', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (10, N'tutien                                            ', N'thuhiencho                                        ', N'tientnmde170657@fpt.edu.vn                                                                          ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (14, N'quyndde170660@fpt.edu.vn                          ', N'                                                  ', N'quyndde170660@fpt.edu.vn                                                                            ', N'                    ', N'Nguyen Duy Quy (K17 DN)                           ', N'', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (20, N'swp391c02rt02@gmail.com                           ', N'5P(5mZ7xJq                                        ', N'swp391c02rt02@gmail.com                                                                             ', NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (23, N'A                                                 ', N'1                                                 ', N'duyquy140903@gmail.com                                                                              ', NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (24, N'b                                                 ', N'1                                                 ', N'b                                                                                                   ', NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (25, N'c                                                 ', N'1                                                 ', N'c                                                                                                   ', NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (26, N'd                                                 ', N'1                                                 ', N'd                                                                                                   ', NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (27, N'user1                                             ', N'p1                                                ', N'user1@email.com                                                                                     ', N'123456789           ', N'User 1                                            ', N'Address 1', 1, N'user1.jpg                                         ')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (28, N'user2                                             ', N'password2                                         ', N'user2@email.com                                                                                     ', N'987654321           ', N'User 2                                            ', N'Address 2', 2, N'user2.jpg                                         ')
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (30, N'tutien29042003@gmail.com                          ', N'3I9vqI3"$f                                        ', N'tutien29042003@gmail.com                                                                            ', NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name]) VALUES (23, N'*', NULL, NULL, 0, NULL)
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name]) VALUES (24, N'1', NULL, NULL, 0, NULL)
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name]) VALUES (25, N'1', NULL, NULL, 0, NULL)
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name]) VALUES (26, N'1', NULL, NULL, 0, NULL)
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name]) VALUES (28, N'*', NULL, NULL, 0, N'Shop cua Quy                                      ')
GO
INSERT [dbo].[custom_order] ([id], [product_name], [expected_complete_date], [seller_id], [customer_id], [status], [created_date], [cost]) VALUES (1, N'Custom product 1', CAST(N'3924-04-15' AS Date), 23, NULL, N'new create', CAST(N'2024-03-13' AS Date), 10000.0000)
INSERT [dbo].[custom_order] ([id], [product_name], [expected_complete_date], [seller_id], [customer_id], [status], [created_date], [cost]) VALUES (2, N'Custom product 2', CAST(N'3924-04-15' AS Date), 23, NULL, N'new create', CAST(N'2024-03-13' AS Date), 10000.0000)
GO
SET IDENTITY_INSERT [dbo].[maincategory] ON 

INSERT [dbo].[maincategory] ([id], [name]) VALUES (1, N'fashion                                           ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (2, N'technology                                        ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (3, N'houseware                                         ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (4, N'bruh                                              ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (5, N'qqq                                               ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (6, N'len                                               ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (7, N'bông                                              ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (9, N'fashion                                           ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (10, N'technology                                        ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (11, N'fashion                                           ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (12, N'technology                                        ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (13, N'fashion                                           ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (14, N'technology                                        ')
SET IDENTITY_INSERT [dbo].[maincategory] OFF
GO
SET IDENTITY_INSERT [dbo].[shopcategory] ON 

INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name]) VALUES (1, 1, 23, N'T-shirt                                           ')
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name]) VALUES (2, 1, 23, N'Jean                                              ')
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name]) VALUES (3, 1, 23, N'Blazer                                            ')
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name]) VALUES (5, 1, 23, N'Dress                                             ')
INSERT [dbo].[shopcategory] ([id], [maincate_id], [shop_id], [name]) VALUES (6, 1, 23, N'Skirt                                             ')
SET IDENTITY_INSERT [dbo].[shopcategory] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (1, 23, 1, NULL, N'T-shirt', CAST(N'2024-02-27' AS Date), N'T-shirt for boy                                   ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (2, 23, 1, NULL, N'T-shirt', CAST(N'2024-02-27' AS Date), N'T-shirt for girl                                  ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (3, 23, 1, NULL, N'Dress', CAST(N'2024-02-27' AS Date), N'Dres for boy                                      ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (4, 23, 1, NULL, N'Dress', CAST(N'2024-02-27' AS Date), N'Dres for girl                                     ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (5, 23, 1, NULL, N'Meme nong hoi vua thoi vua an', CAST(N'2024-03-07' AS Date), N'Meme                                              ', 100000, N'img\seller\23\062e45a2-a459-48c9-bbbd-1be2379e455d', 9)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (6, 23, 4, NULL, N'SP2 thuoc nganh bruh', CAST(N'2024-03-07' AS Date), N'SP2                                               ', 11000000, N'img\seller\23\e2f26840-1527-411a-a036-8a6ebcfb5fcc', 3)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (8, 28, 3, NULL, N'T-shirt', CAST(N'2024-02-27' AS Date), N'T-shirt for boy                                   ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (9, 28, 3, NULL, N'T-shirt', CAST(N'2024-02-27' AS Date), N'T-shirt for girl                                  ', 10000, N'https://www.elle.vn/wp-content/uploads/2017/07/25/hinh-anh-dep-1.jpg', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (10, 28, 3, NULL, N'Dress', CAST(N'2024-02-27' AS Date), N'Dres for boy                                      ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (11, 28, 3, NULL, N'Dress', CAST(N'2024-02-27' AS Date), N'Dres for girl                                     ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (16, 23, 1, NULL, N'', CAST(N'2024-03-13' AS Date), N'SP1                                               ', 3000000, N'img\seller\23\b74fcfa8-6ff4-48d0-aaa9-4b5682375fde', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (17, 23, 1, NULL, N'', CAST(N'2024-03-13' AS Date), N'SPA                                               ', 3000000, N'img\seller\23\ad28c88a-67ca-46c8-93b6-a3c9eafafb3f', 10)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (27, 9, 15)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (30, 9, 1)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (27, 11, 4)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (30, 11, 2)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (30, 8, 1)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (30, 10, 1)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (27, 10, 1)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (27, 5, 1)
INSERT [dbo].[cartdetail] ([user_id], [product_id], [quantity]) VALUES (27, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[shippingunits] ON 

INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (1, N'Shipper1                                          ', 15000.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (2, N'Unit2                                             ', 10.0000, 2)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (3, N'Unit1                                             ', 5.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (4, N'Unit2                                             ', 10.0000, 2)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (5, N'QuyNguyen Express                                 ', 100000.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (6, N'NguyenDuy Express                                 ', 100000.0000, 3)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (7, N'QuyNguyen Express                                 ', 100000.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (8, N'NguyenDuy Express                                 ', 100000.0000, 3)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (9, N'QuyNguyen Express                                 ', 100000.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (10, N'NguyenDuy Express                                 ', 100000.0000, 3)
SET IDENTITY_INSERT [dbo].[shippingunits] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [customer_id], [shippingunit_id], [voucher_code], [total], [shipping_method], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_adress], [order_date], [cancel_reason], [type], [deadline], [cproductName]) VALUES (4, 27, 1, 0, 0, N'1                                                 ', N'thanh toan khi nhan hang                          ', N'da nhan hang                                      ', N'a                                                 ', N'0123456789                                        ', N'A street                                                                                                                                                                                                                                                       ', CAST(N'2024-02-27' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shippingunit_id], [voucher_code], [total], [shipping_method], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_adress], [order_date], [cancel_reason], [type], [deadline], [cproductName]) VALUES (5, 27, 1, 0, 0, N'1                                                 ', N'none                                              ', N'dang van chuyen                                   ', N'a                                                 ', N'0123456789                                        ', N'A street                                                                                                                                                                                                                                                       ', CAST(N'2024-02-27' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[orders] ([order_id], [customer_id], [shippingunit_id], [voucher_code], [total], [shipping_method], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_adress], [order_date], [cancel_reason], [type], [deadline], [cproductName]) VALUES (6, 27, 1, 4, 786576, N'1                                                 ', N'vcv                                               ', N'da nhan hang                                      ', N'dv                                                ', N'5465465                                           ', N'gfxvc                                                                                                                                                                                                                                                          ', CAST(N'2024-02-22' AS Date), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[vouchers] ON 

INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (2, N'Mv01      ', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 23, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (3, N'Mv02      ', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 23, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (4, N'MvI       ', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 24, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (5, N'MvII      ', 1, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 24, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (6, N'Mv03      ', 2, CAST(N'3924-04-01' AS Date), CAST(N'3924-04-02' AS Date), 3, 1, N'none', 23, 1, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (7, N'PvZZZ     ', 5, CAST(N'2024-03-06' AS Date), CAST(N'2024-03-07' AS Date), 1, 1000000, N'Voucher toan shop', 23, 1, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (11, N'MvVVV     ', 5000, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-22' AS Date), 2, 1000, N'Voucher san pham', 23, 1, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (12, N'MvGG      ', 50000, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-15' AS Date), 1, 50000, N'Voucher toan shop', 23, 1, 10)
SET IDENTITY_INSERT [dbo].[vouchers] OFF
GO
INSERT [dbo].[shopvoucherdetail] ([voucher_id], [shop_id]) VALUES (NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[orderdetail] ON 

INSERT [dbo].[orderdetail] ([orderID], [productID], [quantity], [id]) VALUES (4, 8, 1, 3)
INSERT [dbo].[orderdetail] ([orderID], [productID], [quantity], [id]) VALUES (4, 11, 3, 6)
INSERT [dbo].[orderdetail] ([orderID], [productID], [quantity], [id]) VALUES (6, 8, 6, 7)
SET IDENTITY_INSERT [dbo].[orderdetail] OFF
GO
