USE [SWP391_FinalPrjDB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__vouchers__shop_i__5070F446]') AND parent_object_id = OBJECT_ID(N'[dbo].[vouchers]'))
ALTER TABLE [dbo].[vouchers] DROP CONSTRAINT [FK__vouchers__shop_i__5070F446]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__vouchers__produc__5165187F]') AND parent_object_id = OBJECT_ID(N'[dbo].[vouchers]'))
ALTER TABLE [dbo].[vouchers] DROP CONSTRAINT [FK__vouchers__produc__5165187F]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__shopvouch__vouch__5CD6CB2B]') AND parent_object_id = OBJECT_ID(N'[dbo].[shopvoucherdetail]'))
ALTER TABLE [dbo].[shopvoucherdetail] DROP CONSTRAINT [FK__shopvouch__vouch__5CD6CB2B]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__shopvouch__shop___5DCAEF64]') AND parent_object_id = OBJECT_ID(N'[dbo].[shopvoucherdetail]'))
ALTER TABLE [dbo].[shopvoucherdetail] DROP CONSTRAINT [FK__shopvouch__shop___5DCAEF64]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__shops__shop_id__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[shops]'))
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [FK__shops__shop_id__3B75D760]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__shopcateg__shop___46E78A0C]') AND parent_object_id = OBJECT_ID(N'[dbo].[shopcategory]'))
ALTER TABLE [dbo].[shopcategory] DROP CONSTRAINT [FK__shopcateg__shop___46E78A0C]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__shopcateg__mainc__45F365D3]') AND parent_object_id = OBJECT_ID(N'[dbo].[shopcategory]'))
ALTER TABLE [dbo].[shopcategory] DROP CONSTRAINT [FK__shopcateg__mainc__45F365D3]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__refundsnr__order__6383C8BA]') AND parent_object_id = OBJECT_ID(N'[dbo].[refundsnreturns]'))
ALTER TABLE [dbo].[refundsnreturns] DROP CONSTRAINT [FK__refundsnr__order__6383C8BA]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ratings__orderde__66603565]') AND parent_object_id = OBJECT_ID(N'[dbo].[ratings]'))
ALTER TABLE [dbo].[ratings] DROP CONSTRAINT [FK__ratings__orderde__66603565]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__productvo__vouch__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[dbo].[productvoucherdetail]'))
ALTER TABLE [dbo].[productvoucherdetail] DROP CONSTRAINT [FK__productvo__vouch__5FB337D6]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__productvo__produ__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[productvoucherdetail]'))
ALTER TABLE [dbo].[productvoucherdetail] DROP CONSTRAINT [FK__productvo__produ__60A75C0F]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__products__shop_i__49C3F6B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[products]'))
ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK__products__shop_i__49C3F6B7]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__products__scate___4AB81AF0]') AND parent_object_id = OBJECT_ID(N'[dbo].[products]'))
ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK__products__scate___4AB81AF0]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__orders__shipping__571DF1D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[orders]'))
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__shipping__571DF1D5]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__orders__customer__5629CD9C]') AND parent_object_id = OBJECT_ID(N'[dbo].[orders]'))
ALTER TABLE [dbo].[orders] DROP CONSTRAINT [FK__orders__customer__5629CD9C]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__orderdeta__produ__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[dbo].[orderdetail]'))
ALTER TABLE [dbo].[orderdetail] DROP CONSTRAINT [FK__orderdeta__produ__5AEE82B9]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__orderdeta__order__59FA5E80]') AND parent_object_id = OBJECT_ID(N'[dbo].[orderdetail]'))
ALTER TABLE [dbo].[orderdetail] DROP CONSTRAINT [FK__orderdeta__order__59FA5E80]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__messages__shop_i__403A8C7D]') AND parent_object_id = OBJECT_ID(N'[dbo].[messages]'))
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [FK__messages__shop_i__403A8C7D]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__messages__custom__412EB0B6]') AND parent_object_id = OBJECT_ID(N'[dbo].[messages]'))
ALTER TABLE [dbo].[messages] DROP CONSTRAINT [FK__messages__custom__412EB0B6]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__custom_or__custo__6E01572D]') AND parent_object_id = OBJECT_ID(N'[dbo].[custom_order_detail]'))
ALTER TABLE [dbo].[custom_order_detail] DROP CONSTRAINT [FK__custom_or__custo__6E01572D]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__custom_or__selle__6A30C649]') AND parent_object_id = OBJECT_ID(N'[dbo].[custom_order]'))
ALTER TABLE [dbo].[custom_order] DROP CONSTRAINT [FK__custom_or__selle__6A30C649]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__custom_or__custo__6B24EA82]') AND parent_object_id = OBJECT_ID(N'[dbo].[custom_order]'))
ALTER TABLE [dbo].[custom_order] DROP CONSTRAINT [FK__custom_or__custo__6B24EA82]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__cartdetai__user___4CA06362]') AND parent_object_id = OBJECT_ID(N'[dbo].[cartdetail]'))
ALTER TABLE [dbo].[cartdetail] DROP CONSTRAINT [FK__cartdetai__user___4CA06362]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__cartdetai__produ__4D94879B]') AND parent_object_id = OBJECT_ID(N'[dbo].[cartdetail]'))
ALTER TABLE [dbo].[cartdetail] DROP CONSTRAINT [FK__cartdetai__produ__4D94879B]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__users__img__38996AB5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF__users__img__38996AB5]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__users__role__37A5467C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF__users__role__37A5467C]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__shops__shop_repo__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [DF__shops__shop_repo__3D5E1FD2]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__shops__shop_desc__3C69FB99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[shops] DROP CONSTRAINT [DF__shops__shop_desc__3C69FB99]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ratings__time_st__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ratings] DROP CONSTRAINT [DF__ratings__time_st__6754599E]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__custom_or__creat__6EF57B66]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[custom_order_detail] DROP CONSTRAINT [DF__custom_or__creat__6EF57B66]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__custom_or__creat__6C190EBB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[custom_order] DROP CONSTRAINT [DF__custom_or__creat__6C190EBB]
END
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vouchers]') AND type in (N'U'))
DROP TABLE [dbo].[vouchers]
GO
/****** Object:  Table [dbo].[users]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[shopvoucherdetail]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shopvoucherdetail]') AND type in (N'U'))
DROP TABLE [dbo].[shopvoucherdetail]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shops]') AND type in (N'U'))
DROP TABLE [dbo].[shops]
GO
/****** Object:  Table [dbo].[shopcategory]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shopcategory]') AND type in (N'U'))
DROP TABLE [dbo].[shopcategory]
GO
/****** Object:  Table [dbo].[shippingunits]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[shippingunits]') AND type in (N'U'))
DROP TABLE [dbo].[shippingunits]
GO
/****** Object:  Table [dbo].[refundsnreturns]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[refundsnreturns]') AND type in (N'U'))
DROP TABLE [dbo].[refundsnreturns]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ratings]') AND type in (N'U'))
DROP TABLE [dbo].[ratings]
GO
/****** Object:  Table [dbo].[productvoucherdetail]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[productvoucherdetail]') AND type in (N'U'))
DROP TABLE [dbo].[productvoucherdetail]
GO
/****** Object:  Table [dbo].[products]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND type in (N'U'))
DROP TABLE [dbo].[products]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[orders]') AND type in (N'U'))
DROP TABLE [dbo].[orders]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[orderdetail]') AND type in (N'U'))
DROP TABLE [dbo].[orderdetail]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[messages]') AND type in (N'U'))
DROP TABLE [dbo].[messages]
GO
/****** Object:  Table [dbo].[maincategory]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maincategory]') AND type in (N'U'))
DROP TABLE [dbo].[maincategory]
GO
/****** Object:  Table [dbo].[custom_order_detail]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custom_order_detail]') AND type in (N'U'))
DROP TABLE [dbo].[custom_order_detail]
GO
/****** Object:  Table [dbo].[custom_order]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[custom_order]') AND type in (N'U'))
DROP TABLE [dbo].[custom_order]
GO
/****** Object:  Table [dbo].[cartdetail]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cartdetail]') AND type in (N'U'))
DROP TABLE [dbo].[cartdetail]
GO
USE [master]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 13/03/2024 13:45:01 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'SWP391_FinalPrjDB')
DROP DATABASE [SWP391_FinalPrjDB]
GO
/****** Object:  Database [SWP391_FinalPrjDB]    Script Date: 13/03/2024 13:45:01 ******/
CREATE DATABASE [SWP391_FinalPrjDB] ON  PRIMARY 
( NAME = N'SWP391_FinalPrjDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUYQUY\MSSQL\DATA\SWP391_FinalPrjDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_FinalPrjDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.DUYQUY\MSSQL\DATA\SWP391_FinalPrjDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [SWP391_FinalPrjDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_FinalPrjDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_FinalPrjDB', N'ON'
GO
USE [SWP391_FinalPrjDB]
GO
/****** Object:  Table [dbo].[cartdetail]    Script Date: 13/03/2024 13:45:01 ******/
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
