USE [master]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 20/01/2024 00:22:22 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 20/01/2024 00:22:22 ******/
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
	[shop_description] [text] NULL,
	[shop_reported_count] [tinyint] NOT NULL,
	[shop_name] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [shop_description], [shop_reported_count], [shop_name]) VALUES (1, N'Q                                                 ', N'123456                                            ', N'q@gmail.com                                                                                         ', N'0123456789          ', N'Q                                                 ', N'ABC Street', 1, NULL, 0, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [shop_description], [shop_reported_count], [shop_name]) VALUES (7, N'Qa                                                ', N'1                                                 ', N'qa@gmail.com                                                                                        ', NULL, NULL, NULL, 1, NULL, 0, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [shop_description], [shop_reported_count], [shop_name]) VALUES (8, N'aa                                                ', N'1                                                 ', N'QuyAA@gmail.com                                                                                     ', NULL, NULL, NULL, 1, NULL, 0, NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [phone], [fullname], [address], [role], [shop_description], [shop_reported_count], [shop_name]) VALUES (9, N'J                                                 ', N'2                                                 ', N'J@gmail.com                                                                                         ', N'0123456789          ', N'J M Alexer                                        ', N'AHa Street', 1, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616466CED5A0]    Script Date: 20/01/2024 00:22:22 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572ADCC116E]    Script Date: 20/01/2024 00:22:22 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__B43B145F1A1440E5]    Script Date: 20/01/2024 00:22:22 ******/
CREATE NONCLUSTERED INDEX [UQ__users__B43B145F1A1440E5] ON [dbo].[users]
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  READ_WRITE 
GO
