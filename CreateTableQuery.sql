use SWP391_FinalPrjDB
go
alter table users
add [img] char(50);
create table shops
(
	[shop_id] int primary key references[users]([id]) not null,
	[CCCD] char not null, 
	[shop_description] text,
	[shop_img] char(50),
	[shop_reported_count] tinyint default 0 not null,
	[shop_name] char(50)
)

create table [messages]
(
	[message_id] int primary key identity (1,1) ,
	[shop_id] int foreign key references [shops]([shop_id]) not null,
	[customer_id] int foreign key references [users]([id]) not null,
	[time_stamp] date not null,
	[message_status] tinyint not null,
	[content] char(255) not null
)
create table maincategory
(
	[id] int primary key identity(1,1),
	[name] char(50) not null
)
create table shopcategory
(
	[id] int primary key identity(1,1),
	[maincate_id] int foreign key references [maincategory]([id]),
	[shop_id] int foreign key references [shops]([shop_id]),
	[name] char(50) not null
)
create table products
(
	[product_id] int primary key identity(1,1),
	[shop_id] int foreign key references[shops]([shop_id]) not null,
	[mcate_id] int foreign key references[maincategory]([id]) not null,
	[scate_id] int foreign key references[shopcategory]([id]) ,
	[description] text NOT NULL,
	[created_date] date NOT NULL,
	[name] char(50) NOT NULL,
	[price] int NOT NULL,
	[img] text NOT NULL,
	[quantity] int NOT NULL
)
create table cartdetail
(
	[user_id] int foreign key references [users]([id]) not null,
	[product_id] int foreign key references [products]([product_id]) not null,
	[quantity] int NOT NULL
)
create table vouchers
(
	[voucher_id] int identity(1,1) primary key,
	[code] char(10) not null unique,
	[discount_amount] int not null,
	[start_date] date not null,
	[expire_date] date not null,
	[type] int not null,
	[min_require] int not null,
	[description] text NOT NULL,
	[shop_id] int foreign key references [shops]([shop_id]),
	[product_id] int foreign key references [products]([product_id]),
	[use_count] int NOT NULL
)
create table shippingunits
(
	[id] int identity(1,1) primary key,
	[name] char(50) NOT NULL ,
	[cost] money NOT NULL ,
	[support_shippingmethod] tinyint NOT NULL 
)
create table orders
(
	[order_id] int identity(1,1) primary key,
	[customer_id] int foreign key references [users]([id]),
	[shippingunit_id] int foreign key references [shippingunits]([id]),
	[voucher_code] int NOT NULL,
	[total] int NOT NULL,
	[shipping_method] char(50) NOT NULL,
	[payment_method] char(50) NOT NULL,
	[status] char(50) NOT NULL,
	[receiver_name] char(50) NOT NULL,
	[receiver_phone] char(50) NOT NULL,
	[receiver_adress] char(255) NOT NULL,
	[order_date] date NOT NULL,
	[cancel_reason] char(50)
)
create table orderdetail
(
	[orderID] int foreign key references [orders]([order_id]),
	[productID] int foreign key references [products]([product_id]),
	[quantity] int NOT NULL
)
create table shopvoucherdetail
(
	[voucher_id] int foreign key references [vouchers]([voucher_id]),
	[shop_id] int foreign key references [shops]([shop_id])
)
create table productvoucherdetail
(
	[voucher_id] int foreign key references [vouchers]([voucher_id]),
	[product_id] int foreign key references [products]([product_id])
)
alter table orderdetail
add id int identity(1,1) primary key;
create table refundsnreturns
(
	[id] int primary key identity(1,1),
	[orderdetail_id] int references [orderdetail](id),
	[reason] text NOT NULL,
	[status] tinyint NOT NULL
)
create table ratings
(
	[id] int primary key identity(1,1),
	[orderdetail_id] int references [orderdetail](id),
	[time_stamp] date not null,
	[score] int NOT NULL,
	comment text NOT NULL
)