insert into [shops](shop_id,CCCD)
values (23,123456)
insert into [maincategory]([name])values
('fashion'),('technology')
insert into [products]([shop_id], [mcate_id],[description],[created_date],[name],[price],[img],[quantity]) values
(23,1,'T-shirt',GETDATE(),'T-shirt for boy',10000,'no img',10),
(23,1,'T-shirt',GETDATE(),'T-shirt for girl',10000,'no img',10),
(23,1,'Dress',GETDATE(),'Dres for boy',10000,'no img',10),
(23,1,'Dress',GETDATE(),'Dres for girl',10000,'no img',10)
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