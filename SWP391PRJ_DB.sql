USE [master]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 21/02/2024 23:10:47 ******/
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
/****** Object:  Table [dbo].[cartdetail]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartdetail](
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maincategory]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maincategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[time_stamp] [date] NOT NULL,
	[message_status] [tinyint] NOT NULL,
	[content] [char](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[shippingunit_id] [int] NULL,
	[voucher_code] [int] NOT NULL,
	[total] [int] NOT NULL,
	[shipping_method] [char](50) NOT NULL,
	[payment_method] [char](50) NOT NULL,
	[status] [char](50) NOT NULL,
	[receiver_name] [char](50) NOT NULL,
	[receiver_phone] [char](50) NOT NULL,
	[receiver_adress] [char](255) NOT NULL,
	[order_date] [date] NOT NULL,
	[cancel_reason] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NOT NULL,
	[mcate_id] [int] NOT NULL,
	[scate_id] [int] NULL,
	[description] [text] NOT NULL,
	[created_date] [date] NOT NULL,
	[name] [char](50) NOT NULL,
	[price] [int] NOT NULL,
	[img] [text] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productvoucherdetail]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productvoucherdetail](
	[voucher_id] [int] NULL,
	[product_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[time_stamp] [date] NOT NULL,
	[score] [int] NOT NULL,
	[comment] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refundsnreturns]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refundsnreturns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[reason] [text] NOT NULL,
	[status] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shippingunits]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shippingunits](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](50) NOT NULL,
	[cost] [money] NOT NULL,
	[support_shippingmethod] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopcategory]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maincate_id] [int] NULL,
	[shop_id] [int] NULL,
	[name] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shops](
	[shop_id] [int] NOT NULL,
	[CCCD] [char](1) NOT NULL,
	[shop_description] [text] NULL,
	[shop_img] [char](50) NULL,
	[shop_reported_count] [tinyint] NOT NULL,
	[shop_name] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopvoucherdetail]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopvoucherdetail](
	[voucher_id] [int] NULL,
	[shop_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [char](50) NOT NULL,
	[password] [char](50) NOT NULL,
	[email] [char](100) NOT NULL,
	[phone] [char](20) NULL,
	[fullname] [char](50) NULL,
	[address] [text] NULL,
	[role] [tinyint] NOT NULL,
	[img] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 21/02/2024 23:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vouchers](
	[voucher_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [char](10) NOT NULL,
	[discount_amount] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[expire_date] [date] NOT NULL,
	[type] [int] NOT NULL,
	[min_require] [int] NOT NULL,
	[description] [text] NOT NULL,
	[shop_id] [int] NULL,
	[product_id] [int] NULL,
	[use_count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (1, N'Q                                                 ', N'123456                                            ', N'q@gmail.com                                                                                         ', N'0123456789          ', N'Q                                                 ', N'ABC Street', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (7, N'Qa                                                ', N'1                                                 ', N'qa@gmail.com                                                                                        ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (8, N'aa                                                ', N'1                                                 ', N'QuyAA@gmail.com                                                                                     ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (9, N'J                                                 ', N'2                                                 ', N'J@gmail.com                                                                                         ', N'0123456789          ', N'J M Alexer                                        ', N'AHa Street', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (10, N'tutien                                            ', N'thuhiencho                                        ', N'tientnmde170657@fpt.edu.vn                                                                          ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (14, N'quyndde170660@fpt.edu.vn                          ', N'                                                  ', N'quyndde170660@fpt.edu.vn                                                                            ', N'                    ', N'Nguyen Duy Quy (K17 DN)                           ', N'', 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (20, N'swp391c02rt02@gmail.com                           ', N'5P(5mZ7xJq                                        ', N'swp391c02rt02@gmail.com                                                                             ', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [img]) VALUES (23, N'A                                                 ', N'222                                               ', N'duyquy140903@gmail.com                                                                              ', NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616466CED5A0]    Script Date: 21/02/2024 23:10:47 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572ADCC116E]    Script Date: 21/02/2024 23:10:47 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__B43B145F1A1440E5]    Script Date: 21/02/2024 23:10:47 ******/
CREATE NONCLUSTERED INDEX [UQ__users__B43B145F1A1440E5] ON [dbo].[users]
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__vouchers__357D4CF992CEFEDB]    Script Date: 21/02/2024 23:10:47 ******/
ALTER TABLE [dbo].[vouchers] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[shops] ADD  DEFAULT ((0)) FOR [shop_reported_count]
GO
ALTER TABLE [dbo].[cartdetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[cartdetail]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
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
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([mcate_id])
REFERENCES [dbo].[maincategory] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([scate_id])
REFERENCES [dbo].[shopcategory] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[productvoucherdetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[productvoucherdetail]  WITH CHECK ADD FOREIGN KEY([voucher_id])
REFERENCES [dbo].[vouchers] ([voucher_id])
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[orderdetail] ([id])
GO
ALTER TABLE [dbo].[refundsnreturns]  WITH CHECK ADD FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[orderdetail] ([id])
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
ALTER TABLE [dbo].[shopvoucherdetail]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
ALTER TABLE [dbo].[shopvoucherdetail]  WITH CHECK ADD FOREIGN KEY([voucher_id])
REFERENCES [dbo].[vouchers] ([voucher_id])
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[shops] ([shop_id])
GO
USE [master]
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  READ_WRITE 
GO
