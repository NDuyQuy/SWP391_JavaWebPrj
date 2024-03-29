USE [SWP391_FinalPrjDB]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (1, N'Q                                                 ', N'123456                                            ', N'q@gmail.com                                                                                         ', N'0123456789          ', N'Q                                                 ', N'ABC Street', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (7, N'Qa                                                ', N'1                                                 ', N'qa@gmail.com                                                                                        ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (8, N'aa                                                ', N'1                                                 ', N'QuyAA@gmail.com                                                                                     ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (9, N'J                                                 ', N'2                                                 ', N'J@gmail.com                                                                                         ', N'0123456789          ', N'J M Alexer                                        ', N'AHa Street', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (10, N'tutien                                            ', N'thuhiencho                                        ', N'tientnmde170657@fpt.edu.vn                                                                          ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (14, N'quyndde170660@fpt.edu.vn                          ', N'                                                  ', N'quyndde170660@fpt.edu.vn                                                                            ', N'                    ', N'Nguyen Duy Quy (K17 DN)                           ', N'', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (20, N'swp391c02rt02@gmail.com                           ', N'5P(5mZ7xJq                                        ', N'swp391c02rt02@gmail.com                                                                             ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (23, N'A                                                 ', N'222                                               ', N'duyquy140903@gmail.com                                                                              ', NULL, NULL, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name]) VALUES (23, N'*', NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[maincategory] ON 

INSERT [dbo].[maincategory] ([id], [name]) VALUES (1, N'fashion                                           ')
INSERT [dbo].[maincategory] ([id], [name]) VALUES (2, N'technology                                        ')
SET IDENTITY_INSERT [dbo].[maincategory] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (1, 23, 1, NULL, N'T-shirt', CAST(N'2024-02-27' AS Date), N'T-shirt for boy                                   ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (2, 23, 1, NULL, N'T-shirt', CAST(N'2024-02-27' AS Date), N'T-shirt for girl                                  ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (3, 23, 1, NULL, N'Dress', CAST(N'2024-02-27' AS Date), N'Dres for boy                                      ', 10000, N'no img', 10)
INSERT [dbo].[products] ([product_id], [shop_id], [mcate_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (4, 23, 1, NULL, N'Dress', CAST(N'2024-02-27' AS Date), N'Dres for girl                                     ', 10000, N'no img', 10)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
