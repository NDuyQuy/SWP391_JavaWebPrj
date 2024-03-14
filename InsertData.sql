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
