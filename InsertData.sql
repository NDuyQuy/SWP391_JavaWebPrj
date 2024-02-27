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