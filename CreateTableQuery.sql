use master
go

CREATE DATABASE SWP391_FinalPrjDB 

use SWP391_FinalPrjDB
go

create table users
(
	[id] int primary key identity(1,1),
	[username]  nvarchar(50),
	[password]  nvarchar(50),
	[email] nvarchar(100),
	[phone]  nvarchar(15),
	[fullname]  nvarchar(50),
	[address]  nvarchar(200),
	[role] tinyint default 1,
	[img]  nvarchar(50) default '/img/users/default/1.jsp'
)
create table shops
(
	[shop_id] int primary key references[users]([id]),
	[CCCD]  nvarchar(12), 
	[shop_description] text default 'Welcome to my shop',
	[shop_img]  nvarchar(50),
	[shop_reported_count] tinyint default 0,
	[shop_name]  nvarchar(50),
	[ban_time] datetime,
	[ban_status] bit default 0
)

create table [messages]
(
	[message_id] int primary key identity (1,1) ,
	[shop_id] int foreign key references [shops]([shop_id]) ,
	[customer_id] int foreign key references [users]([id]) ,
	[time_stamp] datetime default GETDATE(),
	[message_status] tinyint ,
	[content] text
)
create table maincategory
(
	[id] int primary key identity(1,1),
	[name]  nvarchar(50),
	[description] text
)
create table shopcategory
(
	[id] int primary key identity(1,1),
	[maincate_id] int foreign key references [maincategory]([id]),
	[shop_id] int foreign key references [shops]([shop_id]),
	[name]  nvarchar(50),
	[description] text
)
create table products
(
	[product_id] int primary key identity(1,1),
	[shop_id] int foreign key references[shops]([shop_id]) ,
	[scate_id] int foreign key references[shopcategory]([id]) ,
	[description] text ,
	[created_date] datetime default GETDATE() ,
	[name]  nvarchar(50) ,
	[price] money ,
	[img] text ,
	[quantity] int 
)
create table cartdetail
(
	[user_id] int foreign key references [users]([id]) ,
	[product_id] int foreign key references [products]([product_id]) ,
	[quantity] int 
)
-- NOTE: !! VOUCHER TYPE 
--  TYPE = 0 -> VOUCHER APPLY FOR WHOLE SYSTEM
--  TYPE = 1 -> VOUCHER APPLY FOR A WHOLE SHOP
--	TYPE = 2 -> VOUCHER APPLY FOR A PRODUCT
create table vouchers
(
	[voucher_id] int identity(1,1) primary key,
	[code]  nvarchar(10),
	[discount_amount] int,
	[start_date] date ,
	[expire_date] date ,
	[type] tinyint default 0,
	[min_require] int ,
	[description] text ,
	[shop_id] int foreign key references [shops]([shop_id]),
	[product_id] int foreign key references [products]([product_id]),
	[use_count] int 
)
create table shippingunits
(
	[id] int primary key references [users]([id]),
	[name]  nvarchar(50) ,
	[cost] money,
	[support_shippingmethod] tinyint 
)
-- NORMAL ORDER -> TYPE = 1 
-- CUSTOM ORDER -> TYPE = 2
create table orders
(
	[order_id] int identity(1,1) primary key,
	[customer_id] int foreign key references [users]([id]),
	[shop_id] int foreign key references [shops]([shop_id]),
	[shipping_cost] money ,
	[total] money ,
	[payment_method]  nvarchar(50) ,
	[status]  nvarchar(50) ,
	[receiver_name]  nvarchar(50) ,
	[receiver_phone]  nvarchar(50),
	[receiver_adress]  nvarchar(255) ,
	[shipping_method]  nvarchar(50),
	[shippingunit_id] int foreign key references [shippingunits]([id]),
	[order_date] datetime default GETDATE(),
	[type] tinyint default 1
)
create table orderdetail
(
	[id] int identity(1,1) primary key,
	[orderID] int foreign key references [orders]([order_id]),
	[productID] int foreign key references [products]([product_id]),
	[quantity] int,
	[cancel_reason]  nvarchar(50)
)
--waiting repose admin => status = 0
-- admin accept -> status = 1
-- seller accept -> status = 2
-- seller | admin unaccept -> status = 3

create table refundsnreturns
(
	[id] int primary key identity(1,1),
	[orderdetail_id] int references [orderdetail](id),
	[reason] text,
	[status] tinyint,
	[img]   nvarchar(50)
)
create table ratings
(
	[id] int primary key identity(1,1),
	[orderdetail_id] int references [orderdetail](id),
	[time_stamp] datetime default GETDATE(),
	[score] int ,
	[comment] text 
)
-- Re add the custom order table
CREATE TABLE [custom_order]
(
	[id] int primary key references [orders]([order_id]),
	[product_name]  nvarchar(50) ,
	[expected_complete_date] date
)
-- description the current process of making the product
CREATE TABLE [custom_order_detail] 
(
	[customorder_id] int foreign key references [custom_order]([id]),
	[process_img] nvarchar(50) ,
	[process_video] nvarchar(50),
	[description]  nvarchar(50),
	[created_date] date default GETDATE()
)

CREATE TABLE [used_voucher_detail]
(
	[voucher_id] int foreign key references [vouchers]([voucher_id]),
	[order_id] int foreign key references[orders]([order_id])
)

create table report_detail
(
	[id] int IDENTITY(1,1) primary key ,
	[shop_id] int foreign key references [shops]([shop_id]),
	[reporter_id] int foreign key references[users]([id]),
	[created_date] datetime default GETDATE(),
	[reason] text
)