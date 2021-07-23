USE [MicroTransactionsDB]
GO
/****** Object:  Schema [config]    Script Date: 7/23/2021 11:46:20 AM ******/
CREATE SCHEMA [config]
GO
/****** Object:  Schema [operation]    Script Date: 7/23/2021 11:46:20 AM ******/
CREATE SCHEMA [operation]
GO
/****** Object:  Table [config].[TransactionType]    Script Date: 7/23/2021 11:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[TransactionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [operation].[Transaction]    Script Date: 7/23/2021 11:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operation].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoanAccountId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [config].[TransactionType] ON 
GO
INSERT [config].[TransactionType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'LOAN_DISBURSED', 1, 1, CAST(N'2021-07-03T13:34:39.703' AS DateTime), N'System', CAST(N'2021-07-03T13:34:39.703' AS DateTime), N'System')
GO
INSERT [config].[TransactionType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'LOAN_COLLECTION', 1, 2, CAST(N'2021-07-03T13:34:39.707' AS DateTime), N'System', CAST(N'2021-07-03T13:34:39.707' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[TransactionType] OFF
GO
SET IDENTITY_INSERT [operation].[Transaction] ON 
GO
INSERT [operation].[Transaction] ([Id], [LoanAccountId], [Amount], [Date], [Type], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 3, 100, CAST(N'2021-06-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-10T00:00:00.000' AS DateTime), N'admin', CAST(N'2021-07-10T00:00:00.000' AS DateTime), N'admin')
GO
INSERT [operation].[Transaction] ([Id], [LoanAccountId], [Amount], [Date], [Type], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 3, 1000, CAST(N'2021-07-10T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-11T15:42:41.027' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [operation].[Transaction] ([Id], [LoanAccountId], [Amount], [Date], [Type], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 3, 213123, CAST(N'2021-07-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-11T15:44:14.237' AS DateTime), N'Admin', CAST(N'2021-07-11T15:44:14.237' AS DateTime), N'Admin')
GO
INSERT [operation].[Transaction] ([Id], [LoanAccountId], [Amount], [Date], [Type], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, 4, 100, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-15T01:01:16.883' AS DateTime), N'Admin', CAST(N'2021-07-15T01:01:16.883' AS DateTime), N'Admin')
GO
SET IDENTITY_INSERT [operation].[Transaction] OFF
GO
ALTER TABLE [operation].[Transaction]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [config].[TransactionType] ([Id])
GO
