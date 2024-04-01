USE [SWP391_FinalPrjDB]
GO

CREATE TABLE [dbo].[notification] (
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[content] [ntext] NOT NULL,
	[time_stamp] [datetime] NULL,
	[status] [tinyint] NOT NULL,
	[stack] [int] NULL,
	[userid] [int] NOT NULL REFERENCES [dbo].[users] ([id])
)

GO