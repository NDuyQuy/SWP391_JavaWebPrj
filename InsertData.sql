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
('P','1','P@gmail.com')
insert into [shops](shop_id,CCCD,shop_name) values 
(1,'123456','A Shop'),
(2,'654321','B Shop')

insert into [maincategory]([name])values
('fashion'),('technology'),('houseware')

insert into [products]([shop_id], [mcate_id],[description],[created_date],[name],[price],[img],[quantity]) values
(23,1,'T-shirt',GETDATE(),'T-shirt for boy',10000,'no img',10),
(23,1,'T-shirt',GETDATE(),'T-shirt for girl',10000,'no img',10),
(23,1,'Dress',GETDATE(),'Dress for boy',10000,'no img',10),
(23,1,'Dress',GETDATE(),'Dress for girl',10000,'no img',10)
insert into [shippingunits]([name],[support_shippingmethod],[cost])
values ('QuyNguyen Express',1,100000),
('NguyenDuy Express',3,100000)
insert into [orders]([customer_id],[shippingunit_id],[voucher_code],[total],[shipping_method],[payment_method],
[status],[receiver_name],[receiver_phone],[receiver_adress],[order_date])
values (1,1,0,0,'none','none','none','a','0123456789','A street',GETDATE())
-- Done 13:54 27/02/2024
--Demo insert data into shops which shop_id AKA user's id dont exist
--insert into [shops](shop_id,CCCD) values (30,123456)
--Demo finished 22:55 27/02/2024. Result Insert statement conflict.
---
INSERT INTO [shopcategory](maincate_id,shop_id,name)VALUES(1,23,'T-shirt'),(1,23,'Jean'),(1,23,'Dress')
--1/03/2024 01:04 data insertion 
insert into [users]([username],[password],[email],[role]) values
('b','1','b',2),('c','1','c',2),('d','1','d',2)
INSERT INTO [shops](shop_id,CCCD) values
(24,1),(25,1),(26,1)
INSERT INTO [vouchers]([code],[discount_amount],[start_date],[expire_date],[type],[min_require],[description],[shop_id],[use_count]) VALUES
('Mv01',1,'01-03-2024','02-03-2024',2,1,'no description',23,10),
('Mv02',1,'01-03-2024','02-03-2024',2,1,'no description',23,10),
('MvI',1,'01-03-2024','02-03-2024',2,1,'no description',24,10),
('MvII',1,'01-03-2024','02-03-2024',2,1,'no description',24,10)