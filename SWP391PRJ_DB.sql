USE [SWP391_FinalPrjDB]
GO
/****** Object:  StoredProcedure [dbo].[GetTotalProductSell]    Script Date: 18/03/2024 09:32:34 ******/
DROP PROCEDURE [dbo].[GetTotalProductSell]
GO
/****** Object:  StoredProcedure [dbo].[CREATECUSTOMORDERS]    Script Date: 18/03/2024 09:32:34 ******/
DROP PROCEDURE [dbo].[CREATECUSTOMORDERS]
GO
/****** Object:  StoredProcedure [dbo].[CalculateTotalRevenueForShopAndMonth]    Script Date: 18/03/2024 09:32:34 ******/
DROP PROCEDURE [dbo].[CalculateTotalRevenueForShopAndMonth]
GO
ALTER TABLE [dbo].[vouchers] DROP CONSTRAINT [FK__vouchers__shop_i__5441852A]
GO
ALTER TABLE [dbo].[vouchers] DROP CONSTRAINT [FK__vouchers__produc__5535A963]
GO
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [FK__shops__shop_id__3B75D760]
GO
ALTER TABLE [dbo].[shopcategory] DROP CONSTRAINT [FK__shopcateg__shop___48CFD27E]
GO
ALTER TABLE [dbo].[shopcategory] DROP CONSTRAINT [FK__shopcateg__mainc__47DBAE45]
GO
ALTER TABLE [dbo].[shippingunits] DROP CONSTRAINT [FK__shippingunit__id__5812160E]
GO
ALTER TABLE [dbo].[report_detail] DROP CONSTRAINT [FK__report_de__shop___74AE54BC]
GO
ALTER TABLE [dbo].[report_detail] DROP CONSTRAINT [FK__report_de__repor__75A278F5]
GO
ALTER TABLE [dbo].[refundsnreturns] DROP CONSTRAINT [FK__refundsnr__order__656C112C]
GO
ALTER TABLE [dbo].[ratings] DROP CONSTRAINT [FK__ratings__orderde__68487DD7]
GO
ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK__products__shop_i__4BAC3F29]
GO
ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK__products__scate___4CA06362]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__voucher___02FC7413]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__shop_id__5BE2A6F2]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__shipping__5CD6CB2B]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__customer__5AEE82B9]
GO
ALTER TABLE [dbo].[orderdetail] DROP CONSTRAINT [FK__orderdeta__produ__628FA481]
GO
ALTER TABLE [dbo].[orderdetail] DROP CONSTRAINT [FK__orderdeta__order__619B8048]
GO
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [FK__messages__shop_i__412EB0B6]
GO
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [FK__messages__custom__4222D4EF]
GO
ALTER TABLE [dbo].[custom_order_detail] DROP CONSTRAINT [FK__custom_or__custo__6E01572D]
GO
ALTER TABLE [dbo].[custom_order] DROP CONSTRAINT [FK__custom_order__id__6C190EBB]
GO
ALTER TABLE [dbo].[cartdetail] DROP CONSTRAINT [FK__cartdetai__user___4F7CD00D]
GO
ALTER TABLE [dbo].[cartdetail] DROP CONSTRAINT [FK__cartdetai__produ__5070F446]
GO
ALTER TABLE [dbo].[vouchers] DROP CONSTRAINT [DF__vouchers__type__534D60F1]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF__users__img__38996AB5]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF__users__role__37A5467C]
GO
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [DF__shops__ban_statu__3E52440B]
GO
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [DF__shops__shop_repo__3D5E1FD2]
GO
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [DF__shops__shop_desc__3C69FB99]
GO
ALTER TABLE [dbo].[report_detail] DROP CONSTRAINT [DF__report_de__creat__76969D2E]
GO
ALTER TABLE [dbo].[ratings] DROP CONSTRAINT [DF__ratings__time_st__693CA210]
GO
ALTER TABLE [dbo].[products] DROP CONSTRAINT [DF__products__create__4D94879B]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [DF__orders__type__5EBF139D]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [DF__orders__order_da__5DCAEF64]
GO
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [DF_orders_status_1]
GO
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [DF__messages__time_s__4316F928]
GO
ALTER TABLE [dbo].[custom_order_detail] DROP CONSTRAINT [DF__custom_or__creat__6EF57B66]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vouchers]') AND type in (N'U'))
DROP TABLE [dbo].[vouchers]
GO
/****** Object:  Table [dbo].[users]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shops]') AND type in (N'U'))
DROP TABLE [dbo].[shops]
GO
/****** Object:  Table [dbo].[shopcategory]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shopcategory]') AND type in (N'U'))
DROP TABLE [dbo].[shopcategory]
GO
/****** Object:  Table [dbo].[shippingunits]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shippingunits]') AND type in (N'U'))
DROP TABLE [dbo].[shippingunits]
GO
/****** Object:  Table [dbo].[report_detail]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[report_detail]') AND type in (N'U'))
DROP TABLE [dbo].[report_detail]
GO
/****** Object:  Table [dbo].[refundsnreturns]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[refundsnreturns]') AND type in (N'U'))
DROP TABLE [dbo].[refundsnreturns]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ratings]') AND type in (N'U'))
DROP TABLE [dbo].[ratings]
GO
/****** Object:  Table [dbo].[products]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND type in (N'U'))
DROP TABLE [dbo].[products]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[orders]') AND type in (N'U'))
DROP TABLE [dbo].[orders]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[orderdetail]') AND type in (N'U'))
DROP TABLE [dbo].[orderdetail]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messages]') AND type in (N'U'))
DROP TABLE [dbo].[messages]
GO
/****** Object:  Table [dbo].[maincategory]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maincategory]') AND type in (N'U'))
DROP TABLE [dbo].[maincategory]
GO
/****** Object:  Table [dbo].[custom_order_detail]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custom_order_detail]') AND type in (N'U'))
DROP TABLE [dbo].[custom_order_detail]
GO
/****** Object:  Table [dbo].[custom_order]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custom_order]') AND type in (N'U'))
DROP TABLE [dbo].[custom_order]
GO
/****** Object:  Table [dbo].[cartdetail]    Script Date: 18/03/2024 09:32:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cartdetail]') AND type in (N'U'))
DROP TABLE [dbo].[cartdetail]
GO
USE [master]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 18/03/2024 09:32:34 ******/
DROP DATABASE [SWP391_FinalPrjDB]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 18/03/2024 09:32:34 ******/
CREATE DATABASE [SWP391_FinalPrjDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_FinalPrjDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUYQUY\MSSQL\DATA\SWP391_FinalPrjDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[cartdetail]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[custom_order]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[custom_order_detail]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[maincategory]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maincategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 18/03/2024 09:32:35 ******/
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
	[content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[products]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NULL,
	[scate_id] [int] NULL,
	[description] [text] NULL,
	[created_date] [datetime] NULL,
	[name] [nvarchar](50) NULL,
	[price] [money] NULL,
	[img] [text] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[time_stamp] [datetime] NULL,
	[score] [int] NULL,
	[comment] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refundsnreturns]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refundsnreturns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[reason] [text] NULL,
	[status] [tinyint] NULL,
	[img] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_detail]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NULL,
	[reporter_id] [int] NULL,
	[created_date] [datetime] NULL,
	[reason] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shippingunits]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[shopcategory]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maincate_id] [int] NULL,
	[shop_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 18/03/2024 09:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shops](
	[shop_id] [int] NOT NULL,
	[CCCD] [nvarchar](12) NULL,
	[shop_description] [text] NULL,
	[shop_img] [nvarchar](50) NULL,
	[shop_reported_count] [tinyint] NULL,
	[shop_name] [nvarchar](50) NULL,
	[ban_time] [datetime] NULL,
	[ban_status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  Table [dbo].[vouchers]    Script Date: 18/03/2024 09:32:35 ******/
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
	[description] [text] NULL,
	[shop_id] [int] NULL,
	[product_id] [int] NULL,
	[use_count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[custom_order] ([id], [product_name], [expected_complete_date]) VALUES (37, N'Anima thú bông làm tay', CAST(N'2024-04-10' AS Date))
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
SET IDENTITY_INSERT [dbo].[orderdetail] ON 

INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (1, 11, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (2, 12, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (3, 13, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (4, 14, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (5, 15, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (6, 16, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (7, 17, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (8, 18, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (9, 19, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (10, 20, 11, 1, NULL, 60000.0000)
INSERT [dbo].[orderdetail] ([id], [orderID], [productID], [quantity], [cancel_reason], [totalPrice]) VALUES (11, 21, 11, 1, NULL, 60000.0000)
SET IDENTITY_INSERT [dbo].[orderdetail] OFF
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
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (19, 6, 1, 10000.0000, 65000.0000, N'COD', N'đã nhận', N'Hạnh', N'0123456789', N'9 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-06T12:00:00.000' AS DateTime), 1, 7)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (20, 6, 1, 10000.0000, 68000.0000, N'OnlineBanking', N'đã nhận', N'Thu', N'0123456789', N'10 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-06T12:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (21, 6, 1, 10000.0000, 69000.0000, N'COD', N'đã nhận', N'Đức', N'0123456789', N'11 Nguyễn Minh Châu, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng', N'nhanh', 1, CAST(N'2024-02-07T12:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[orders] ([order_id], [customer_id], [shop_id], [shipping_cost], [total], [payment_method], [status], [receiver_name], [receiver_phone], [receiver_address], [shipping_method], [shippingunit_id], [order_date], [type], [voucher_id]) VALUES (37, NULL, 1, NULL, 100000.0000, NULL, N'WAC', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-03-18T03:33:57.203' AS DateTime), 2, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
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
INSERT [dbo].[products] ([product_id], [shop_id], [scate_id], [description], [created_date], [name], [price], [img], [quantity]) VALUES (11, 2, 11, N'Abstract Wall Art', CAST(N'2024-03-13T23:06:24.420' AS DateTime), N'Abstract Wall Art', 60000.0000, NULL, 12)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (1, N'QuyNguyen Express', 10000.0000, 1)
INSERT [dbo].[shippingunits] ([id], [name], [cost], [support_shippingmethod]) VALUES (2, N'NguyenDuy Express', 20000.0000, 3)
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
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name], [ban_time], [ban_status]) VALUES (1, N'123456', N'Welcome to my shop', NULL, 0, N'A Shop', NULL, 0)
INSERT [dbo].[shops] ([shop_id], [CCCD], [shop_description], [shop_img], [shop_reported_count], [shop_name], [ban_time], [ban_status]) VALUES (2, N'654321', N'Welcome to my shop', NULL, 0, N'B Shop', NULL, 0)
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
SET IDENTITY_INSERT [dbo].[vouchers] ON 

INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (1, N'Mv01', 1000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (2, N'Mv02', 2000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (3, N'MvI', 1000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (4, N'MvII', 1000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (5, N'MvAA', 1000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, 1, 0)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (6, N'MvBB', 1000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1000, N'no description', 1, 1, 7)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (7, N'MvI', 5000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 1, NULL, 10)
INSERT [dbo].[vouchers] ([voucher_id], [code], [discount_amount], [start_date], [expire_date], [type], [min_require], [description], [shop_id], [product_id], [use_count]) VALUES (8, N'MvII', 1000, CAST(N'2024-01-03' AS Date), CAST(N'2024-02-03' AS Date), 2, 1, N'no description', 2, NULL, 10)
SET IDENTITY_INSERT [dbo].[vouchers] OFF
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
ALTER TABLE [dbo].[shops] ADD  DEFAULT ('Welcome to my shop') FOR [shop_description]
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
/****** Object:  StoredProcedure [dbo].[CalculateTotalRevenueForShopAndMonth]    Script Date: 18/03/2024 09:32:35 ******/
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

SELECT  @TotalRevenue = SUM(total_price - discount_amount - total_price * 0.1)
    FROM (
        SELECT 
            o.order_id, 
            SUM(od.totalPrice) AS total_price,
            COALESCE(v.discount_amount, 0) AS discount_amount
        FROM 
            orders o
        JOIN 
            orderdetail od ON o.order_id = od.orderID
        LEFT JOIN 
            vouchers v ON o.voucher_id = v.voucher_id
        WHERE 
            od.cancel_reason IS NULL
            AND (v.type = 1 OR v.type = 2 OR o.voucher_id IS NULL)
            AND o.status = N'đã nhận' -- Add condition for order status
            AND o.shop_id = @ShopID -- Filter by shop_id
            AND MONTH(o.order_date) = @Month -- Filter by month
            AND YEAR(o.order_date) = @Year -- Filter by year
        GROUP BY 
            o.order_id, o.voucher_id,discount_amount
    ) AS order_revenue;
	SELECT @TotalRevenue AS TotalRevenue;
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATECUSTOMORDERS]    Script Date: 18/03/2024 09:32:35 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTotalProductSell]    Script Date: 18/03/2024 09:32:35 ******/
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
USE [master]
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  READ_WRITE 
GO
