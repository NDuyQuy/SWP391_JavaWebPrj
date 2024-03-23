USE [master]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 23/03/2024 11:20:18 ******/
CREATE DATABASE [SWP391_FinalPrjDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_FinalPrjDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUYQUY\MSSQL\DATA\SWP391_FinalPrjDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_FinalPrjDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUYQUY\MSSQL\DATA\SWP391_FinalPrjDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_FinalPrjDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_FinalPrjDB', N'ON'
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391_FinalPrjDB]
GO
/****** Object:  Table [dbo].[cartdetail]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartdetail](
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custom_order]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_order](
	[id] [int] NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[expected_complete_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custom_order_detail]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_order_detail](
	[customorder_id] [int] NULL,
	[process_img] [nvarchar](50) NULL,
	[process_video] [nvarchar](50) NULL,
	[created_date] [date] NULL,
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maincategory]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maincategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NULL,
	[customer_id] [int] NULL,
	[time_stamp] [datetime] NULL,
	[message_status] [tinyint] NULL,
	[content] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NULL,
	[cancel_reason] [nvarchar](50) NULL,
	[totalPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[shop_id] [int] NULL,
	[shipping_cost] [money] NULL,
	[total] [money] NULL,
	[payment_method] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[receiver_name] [nvarchar](50) NULL,
	[receiver_phone] [nvarchar](50) NULL,
	[receiver_address] [nvarchar](255) NULL,
	[shipping_method] [nvarchar](50) NULL,
	[shippingunit_id] [int] NULL,
	[order_date] [datetime] NULL,
	[type] [tinyint] NULL,
	[voucher_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NULL,
	[scate_id] [int] NULL,
	[created_date] [datetime] NULL,
	[name] [nvarchar](50) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[img] [nvarchar](75) NULL,
	[description] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[time_stamp] [datetime] NULL,
	[score] [int] NULL,
	[comment] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refundsnreturns]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refundsnreturns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[status] [tinyint] NULL,
	[img] [nvarchar](50) NULL,
	[reason] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_detail]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NULL,
	[reporter_id] [int] NULL,
	[created_date] [datetime] NULL,
	[reason] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shippingunits]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippingunits](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[cost] [money] NULL,
	[support_shippingmethod] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopcategory]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maincate_id] [int] NULL,
	[shop_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shops](
	[shop_id] [int] NOT NULL,
	[CCCD] [nvarchar](12) NULL,
	[shop_img] [nvarchar](50) NULL,
	[shop_reported_count] [tinyint] NULL,
	[shop_name] [nvarchar](50) NULL,
	[ban_time] [datetime] NULL,
	[ban_status] [bit] NULL,
	[shop_description] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](15) NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[role] [tinyint] NULL,
	[img] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vouchers](
	[voucher_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[discount_amount] [int] NULL,
	[start_date] [date] NULL,
	[expire_date] [date] NULL,
	[type] [tinyint] NULL,
	[min_require] [int] NULL,
	[shop_id] [int] NULL,
	[product_id] [int] NULL,
	[use_count] [int] NULL,
	[description] [nvarchar](750) NULL,
PRIMARY KEY CLUSTERED 
(
	[voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[custom_order_detail] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[messages] ADD  DEFAULT (getdate()) FOR [time_stamp]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_status_1]  DEFAULT ('wait for seller respond') FOR [status]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[ratings] ADD  DEFAULT (getdate()) FOR [time_stamp]
GO
ALTER TABLE [dbo].[report_detail] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[shops] ADD  DEFAULT ((0)) FOR [shop_reported_count]
GO
ALTER TABLE [dbo].[shops] ADD  DEFAULT ((0)) FOR [ban_status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [role]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__img__38996AB5]  DEFAULT ('img/users/default/1.jpg') FOR [img]
GO
ALTER TABLE [dbo].[vouchers] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[cartdetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[cartdetail]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[custom_order]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[custom_order_detail]  WITH CHECK ADD FOREIGN KEY([customorder_id])
REFERENCES [dbo].[custom_order] ([id])
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([shippingunit_id])
REFERENCES [dbo].[shippingunits] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([voucher_id])
REFERENCES [dbo].[vouchers] ([voucher_id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([scate_id])
REFERENCES [dbo].[shopcategory] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[orderdetail] ([id])
GO
ALTER TABLE [dbo].[refundsnreturns]  WITH CHECK ADD FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[orderdetail] ([id])
GO
ALTER TABLE [dbo].[report_detail]  WITH CHECK ADD FOREIGN KEY([reporter_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[report_detail]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[shippingunits]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[shopcategory]  WITH CHECK ADD FOREIGN KEY([maincate_id])
REFERENCES [dbo].[maincategory] ([id])
GO
ALTER TABLE [dbo].[shopcategory]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[shops]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
/****** Object:  StoredProcedure [dbo].[CalculateTotalRevenueForShopAndMonth]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateTotalRevenueForShopAndMonth]
    @ShopID INT,
    @Month INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @TotalRevenue DECIMAL(18, 2);

SELECT  @TotalRevenue = SUM(total_price - total_price * 0.1)
    FROM (
        SELECT 
            o.order_id, 
            SUM(od.totalPrice) AS total_price
        FROM 
            orders o
        JOIN 
            orderdetail od ON o.order_id = od.orderID
        
        WHERE 
            od.cancel_reason IS NULL
            AND o.status = N'đã nhận' -- Add condition for order status
            AND o.shop_id = @ShopID -- Filter by shop_id
            AND MONTH(o.order_date) = @Month -- Filter by month
            AND YEAR(o.order_date) = @Year -- Filter by year
        GROUP BY 
            o.order_id, o.voucher_id
    ) AS order_revenue;
	SELECT @TotalRevenue AS TotalRevenue;
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATECUSTOMORDERS]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATECUSTOMORDERS]
@ShopId Int, @Price Money, @ProductName NVarChar(50), @Deadline Date
AS
BEGIN
	DECLARE @OrderId Int
	INSERT INTO [orders]([shop_id],[total],[status],[type]) 
	VALUES (@ShopId,@Price,'WAC',2)
	SELECT @OrderId = SCOPE_IDENTITY();
	INSERT INTO [custom_order]
	VALUES (@OrderId,@ProductName, @Deadline)
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalProductSell]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalProductSell]
@ShopId INT, @Month INT, @Year INT
AS
BEGIN
	SELECT SUM(od.quantity) as [totalProductQuantity] 
	FROM [orders] o JOIN orderdetail od ON o.order_id = od.orderID
	WHERE [shop_id] = @ShopId 
	AND MONTH(order_date) = @Month 
	AND YEAR(order_date) = @Year 
	AND [status] = N'đã nhận'
	AND [cancel_reason] IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[SearchShippingUnitsByAddress]    Script Date: 23/03/2024 11:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchShippingUnitsByAddress]
    @input_address NVARCHAR(MAX)
AS
BEGIN
    SELECT u.id, u.address, s.name, s.support_shippingmethod
    FROM users u
    JOIN shippingunits s ON u.id = s.id
    WHERE @input_address LIKE CONCAT('%', u.address, '%');
END;
GO
USE [master]
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  READ_WRITE 
GO
