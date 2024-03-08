USE [SWP391_FinalPrjDB]
GO

/****** Object:  Table [dbo].[users] ******/

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [char](50) NOT NULL,
	[password] [char](50) NOT NULL,
	[email] [char](100) NOT NULL,
	[phone] [char](20) DEFAULT 'None',
	[fullname] [char](50) NULL,
	[address] [text] DEFAULT 'None',
	[role] [tinyint] NOT NULL,
	[img] [char](50) NULL,
	[status] [int] DEFAULT (1),
	[bantime] [datetime] NULL,
	[createdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[shops] ******/

CREATE TABLE [dbo].[shops](
	[shop_id] [int] NOT NULL,
	[CCCD] [char](10) NOT NULL,
	[shop_description] [text] DEFAULT 'Welcome to my shop',
	[shop_img] [char](50) NULL,
	[shop_reported_count] [tinyint] NOT NULL,
	[shop_name] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[shops] ADD  DEFAULT ((0)) FOR [shop_reported_count]
GO

ALTER TABLE [dbo].[shops]  WITH CHECK ADD FOREIGN KEY([shop_id])
REFERENCES [dbo].[users] ([id])
GO

/****** Object:  Table [dbo].[maincategory] ******/

CREATE TABLE [dbo].[maincategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](50) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[refundsnreturns] ******/

CREATE TABLE [dbo].[refundsnreturns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderdetail_id] [int] NULL,
	[reason] [text] NOT NULL,
	[status] [tinyint] NOT NULL,
	[detail] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[refundsnreturns]  WITH CHECK ADD FOREIGN KEY([orderdetail_id])
REFERENCES [dbo].[orderdetail] ([id])
GO

/****** Object:  Table [dbo].[reportedusers] ******/

CREATE TABLE [dbo].[reportedusers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[reporter_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[reason] [char](100) NULL,
	[detail] [text] NULL,
	[img] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[reportedusers]  WITH CHECK ADD  CONSTRAINT [FK_Reporterid] FOREIGN KEY([reporter_id])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[reportedusers] CHECK CONSTRAINT [FK_Reporterid]
GO

ALTER TABLE [dbo].[reportedusers]  WITH CHECK ADD  CONSTRAINT [FK_Userid] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[reportedusers] CHECK CONSTRAINT [FK_Userid]
GO

/****** Object:  Table [dbo].[sellerrequest] ******/

CREATE TABLE [dbo].[sellerrequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[request_date] [datetime] NOT NULL,
	[shopname] [char](100) NOT NULL,
	[CCCD] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[sellerrequest]  WITH CHECK ADD  CONSTRAINT [FK_SellerId] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[sellerrequest] CHECK CONSTRAINT [FK_SellerId]
GO

/****** Object:  Table [dbo].[notifications] ******/

CREATE TABLE [dbo].[notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[detail] [char](200) NOT NULL,
	[status] [int] NOT NULL,
	[createdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FK_UserID2] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FK_UserID2]
GO

/****** Object:  Table [dbo].[vouchers] ******/

CREATE TABLE [dbo].[vouchers](
	[voucher_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [char](10) NOT NULL,
	[discount_amount] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[expire_date] [datetime] NULL,
	[type] [int] NOT NULL,
	[min_require] [int] NOT NULL,
	[description] [text] NOT NULL,
	[use_count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[voucher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



