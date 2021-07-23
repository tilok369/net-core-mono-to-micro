USE [MicroOperationsDB]
GO
/****** Object:  Schema [config]    Script Date: 7/23/2021 11:40:47 AM ******/
CREATE SCHEMA [config]
GO
/****** Object:  Schema [operation]    Script Date: 7/23/2021 11:40:47 AM ******/
CREATE SCHEMA [operation]
GO
/****** Object:  Table [config].[Duration]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Duration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Duration] [int] NOT NULL,
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
/****** Object:  Table [config].[InstallmentFrequency]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[InstallmentFrequency](
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
/****** Object:  Table [config].[Product]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
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
/****** Object:  Table [config].[ProductDuration]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ProductDuration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
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
/****** Object:  Table [config].[ProductInstallmentFrequency]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [config].[ProductInstallmentFrequency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[InstallmentFrequencyId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
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
/****** Object:  Table [config].[TransactionType]    Script Date: 7/23/2021 11:40:47 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
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
/****** Object:  Table [dbo].[User]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
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
/****** Object:  Table [operation].[Identity]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operation].[Identity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[IdentityNumber] [nvarchar](50) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
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
/****** Object:  Table [operation].[IdentityType]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operation].[IdentityType](
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
/****** Object:  Table [operation].[LoanAccount]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operation].[LoanAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[InstallmentFrequencyId] [int] NOT NULL,
	[DisbursedDate] [datetime] NOT NULL,
	[Amount] [int] NOT NULL,
	[Status] [bit] NOT NULL,
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
/****** Object:  Table [operation].[LoanSchedule]    Script Date: 7/23/2021 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [operation].[LoanSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoanAccountId] [int] NOT NULL,
	[InstallmentNo] [int] NOT NULL,
	[ScheduledDate] [datetime] NOT NULL,
	[InstallmentAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[OutstandingAmount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [config].[Duration] ON 
GO
INSERT [config].[Duration] ([Id], [Duration], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 3, 1, 1, CAST(N'2021-07-02T18:22:34.870' AS DateTime), N'System', CAST(N'2021-07-02T18:22:34.870' AS DateTime), N'System')
GO
INSERT [config].[Duration] ([Id], [Duration], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 6, 1, 2, CAST(N'2021-07-02T18:22:34.873' AS DateTime), N'System', CAST(N'2021-07-02T18:22:34.873' AS DateTime), N'System')
GO
INSERT [config].[Duration] ([Id], [Duration], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 12, 1, 3, CAST(N'2021-07-02T18:22:34.873' AS DateTime), N'System', CAST(N'2021-07-02T18:22:34.873' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[Duration] OFF
GO
SET IDENTITY_INSERT [config].[InstallmentFrequency] ON 
GO
INSERT [config].[InstallmentFrequency] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Weekly', 1, 1, CAST(N'2021-07-02T18:21:19.740' AS DateTime), N'System', CAST(N'2021-07-02T18:21:19.740' AS DateTime), N'System')
GO
INSERT [config].[InstallmentFrequency] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Monthly', 1, 2, CAST(N'2021-07-02T18:21:19.743' AS DateTime), N'System', CAST(N'2021-07-02T18:21:19.743' AS DateTime), N'System')
GO
INSERT [config].[InstallmentFrequency] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Quarterly', 1, 3, CAST(N'2021-07-02T18:21:19.743' AS DateTime), N'System', CAST(N'2021-07-02T18:21:19.743' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[InstallmentFrequency] OFF
GO
SET IDENTITY_INSERT [config].[Product] ON 
GO
INSERT [config].[Product] ([Id], [Name], [Status], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Primary Loan', 1, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:20:01.300' AS DateTime), N'System', CAST(N'2021-07-02T18:20:01.300' AS DateTime), N'System')
GO
INSERT [config].[Product] ([Id], [Name], [Status], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Secondary Loan', 1, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:20:01.303' AS DateTime), N'System', CAST(N'2021-07-02T18:20:01.303' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[Product] OFF
GO
SET IDENTITY_INSERT [config].[ProductDuration] ON 
GO
INSERT [config].[ProductDuration] ([Id], [ProductId], [Duration], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 3, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System', CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System')
GO
INSERT [config].[ProductDuration] ([Id], [ProductId], [Duration], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, 6, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System', CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System')
GO
INSERT [config].[ProductDuration] ([Id], [ProductId], [Duration], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 1, 12, 3, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System', CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System')
GO
INSERT [config].[ProductDuration] ([Id], [ProductId], [Duration], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 2, 3, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System', CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System')
GO
INSERT [config].[ProductDuration] ([Id], [ProductId], [Duration], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, 2, 6, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System', CAST(N'2021-07-02T18:24:21.410' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[ProductDuration] OFF
GO
SET IDENTITY_INSERT [config].[ProductInstallmentFrequency] ON 
GO
INSERT [config].[ProductInstallmentFrequency] ([Id], [ProductId], [InstallmentFrequencyId], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, 1, 1, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System', CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System')
GO
INSERT [config].[ProductInstallmentFrequency] ([Id], [ProductId], [InstallmentFrequencyId], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, 1, 2, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System', CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System')
GO
INSERT [config].[ProductInstallmentFrequency] ([Id], [ProductId], [InstallmentFrequencyId], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 1, 3, 3, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System', CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System')
GO
INSERT [config].[ProductInstallmentFrequency] ([Id], [ProductId], [InstallmentFrequencyId], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 2, 1, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System', CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System')
GO
INSERT [config].[ProductInstallmentFrequency] ([Id], [ProductId], [InstallmentFrequencyId], [SortOrder], [StartDate], [EndDate], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, 2, 2, 2, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2099-12-31T00:00:00.000' AS DateTime), CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System', CAST(N'2021-07-02T18:24:59.413' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[ProductInstallmentFrequency] OFF
GO
SET IDENTITY_INSERT [config].[TransactionType] ON 
GO
INSERT [config].[TransactionType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'LOAN_DISBURSED', 1, 1, CAST(N'2021-07-03T13:34:39.703' AS DateTime), N'System', CAST(N'2021-07-03T13:34:39.703' AS DateTime), N'System')
GO
INSERT [config].[TransactionType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'LOAN_COLLECTION', 1, 2, CAST(N'2021-07-03T13:34:39.707' AS DateTime), N'System', CAST(N'2021-07-03T13:34:39.707' AS DateTime), N'System')
GO
SET IDENTITY_INSERT [config].[TransactionType] OFF
GO
SET IDENTITY_INSERT [operation].[Identity] ON 
GO
INSERT [operation].[Identity] ([Id], [FirstName], [LastName], [Email], [Phone], [IdentityNumber], [TypeId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'AMB', N'XYZ', N'abc@xyz.com', N'01708516936', N'123456789', 1, 1, CAST(N'2021-06-24T13:38:51.233' AS DateTime), N'admin', CAST(N'2021-06-24T13:38:51.243' AS DateTime), N'admin')
GO
INSERT [operation].[Identity] ([Id], [FirstName], [LastName], [Email], [Phone], [IdentityNumber], [TypeId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'DEF1', N'UVW1', N'def1@uvw.com', N'01548412569', N'2213654789', 1, 1, CAST(N'2021-07-02T07:57:36.217' AS DateTime), N'admin', CAST(N'2021-07-02T14:18:08.900' AS DateTime), N'admin')
GO
INSERT [operation].[Identity] ([Id], [FirstName], [LastName], [Email], [Phone], [IdentityNumber], [TypeId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'DEF2', N'UVW2', N'def2@uvw.com', N'01578412569', N'1223654789', 1, 1, CAST(N'2021-07-02T14:17:15.720' AS DateTime), N'admin', CAST(N'2021-07-02T14:17:15.720' AS DateTime), N'admin')
GO
INSERT [operation].[Identity] ([Id], [FirstName], [LastName], [Email], [Phone], [IdentityNumber], [TypeId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, N'TANJEER', N'HAQUE', N'tbh.tilok@live.com', N'01708516936', N'1243141', 1, 1, CAST(N'2021-07-12T01:12:48.450' AS DateTime), N'admin', CAST(N'2021-07-12T01:12:48.450' AS DateTime), N'admin')
GO
INSERT [operation].[Identity] ([Id], [FirstName], [LastName], [Email], [Phone], [IdentityNumber], [TypeId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (5, N'qrqe', N'qrq', N'qr@qw.com', N'01708516936', N'2452452', 1, 1, CAST(N'2021-07-12T01:13:59.920' AS DateTime), N'admin', CAST(N'2021-07-12T01:13:59.920' AS DateTime), N'admin')
GO
INSERT [operation].[Identity] ([Id], [FirstName], [LastName], [Email], [Phone], [IdentityNumber], [TypeId], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, N'asfaf', N'sdgdg', N'gsdga@asas.com', N'01708516936', N'2463574', 1, 1, CAST(N'2021-07-12T01:15:57.500' AS DateTime), N'admin', CAST(N'2021-07-12T01:15:57.500' AS DateTime), N'admin')
GO
SET IDENTITY_INSERT [operation].[Identity] OFF
GO
SET IDENTITY_INSERT [operation].[IdentityType] ON 
GO
INSERT [operation].[IdentityType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (1, N'Client', 1, 1, CAST(N'2021-06-24T12:23:30.920' AS DateTime), N'system', CAST(N'2021-06-24T12:23:30.920' AS DateTime), N'system')
GO
INSERT [operation].[IdentityType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (2, N'Nominee', 1, 2, CAST(N'2021-06-24T12:23:30.920' AS DateTime), N'system', CAST(N'2021-06-24T12:23:30.920' AS DateTime), N'system')
GO
INSERT [operation].[IdentityType] ([Id], [Name], [Status], [SortOrder], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, N'Guarantor', 1, 3, CAST(N'2021-06-24T12:23:30.920' AS DateTime), N'system', CAST(N'2021-06-24T12:23:30.920' AS DateTime), N'system')
GO
SET IDENTITY_INSERT [operation].[IdentityType] OFF
GO
SET IDENTITY_INSERT [operation].[LoanAccount] ON 
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (3, 1, 1, 6, 1, CAST(N'2021-07-05T00:00:00.000' AS DateTime), 6000, 1, CAST(N'2021-07-05T17:08:02.227' AS DateTime), N'admin', CAST(N'2021-07-05T17:08:02.227' AS DateTime), N'admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (4, 2, 2, 3, 2, CAST(N'2021-07-05T00:00:00.000' AS DateTime), 12000, 1, CAST(N'2021-07-05T17:08:02.227' AS DateTime), N'admin', CAST(N'2021-07-05T17:08:02.227' AS DateTime), N'admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (6, 1, 1, 3, 1, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T12:53:37.890' AS DateTime), N'Admin', CAST(N'2021-07-10T12:53:37.890' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (7, 1, 2, 6, 2, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 1000, 1, CAST(N'2021-07-10T12:59:42.810' AS DateTime), N'Admin', CAST(N'2021-07-10T12:59:42.810' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (8, 1, 1, 3, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:22:23.100' AS DateTime), N'Admin', CAST(N'2021-07-10T20:22:23.100' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (9, 1, 1, 3, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 101111, 1, CAST(N'2021-07-10T20:22:58.057' AS DateTime), N'Admin', CAST(N'2021-07-10T20:22:58.057' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (10, 1, 1, 3, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 909, 1, CAST(N'2021-07-10T20:29:19.613' AS DateTime), N'Admin', CAST(N'2021-07-10T20:29:19.613' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (11, 1, 1, 3, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 909, 1, CAST(N'2021-07-10T20:29:34.540' AS DateTime), N'Admin', CAST(N'2021-07-10T20:29:34.540' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (12, 1, 1, 3, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 909, 1, CAST(N'2021-07-10T20:29:56.113' AS DateTime), N'Admin', CAST(N'2021-07-10T20:29:56.113' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (13, 1, 1, 3, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 9091, 1, CAST(N'2021-07-10T20:29:58.710' AS DateTime), N'Admin', CAST(N'2021-07-10T20:29:58.710' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (14, 1, 1, 3, 1, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 10, 1, CAST(N'2021-07-10T20:30:09.463' AS DateTime), N'Admin', CAST(N'2021-07-10T20:30:09.463' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (15, 1, 1, 3, 1, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 1000, 1, CAST(N'2021-07-10T20:33:31.960' AS DateTime), N'Admin', CAST(N'2021-07-10T20:33:31.960' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (16, 1, 1, 3, 1, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 123123, 1, CAST(N'2021-07-10T20:33:40.430' AS DateTime), N'Admin', CAST(N'2021-07-10T20:33:40.430' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (17, 1, 1, 3, 1, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 123123, 1, CAST(N'2021-07-10T20:33:56.587' AS DateTime), N'Admin', CAST(N'2021-07-10T20:33:56.587' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (18, 1, 1, 3, 1, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 123123, 1, CAST(N'2021-07-10T20:33:56.753' AS DateTime), N'Admin', CAST(N'2021-07-10T20:33:56.753' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (19, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:34:43.653' AS DateTime), N'Admin', CAST(N'2021-07-10T20:34:43.653' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (20, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:40:48.890' AS DateTime), N'Admin', CAST(N'2021-07-10T20:40:48.890' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (21, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:41:03.733' AS DateTime), N'Admin', CAST(N'2021-07-10T20:41:03.733' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (22, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:41:16.110' AS DateTime), N'Admin', CAST(N'2021-07-10T20:41:16.110' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (23, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:42:00.230' AS DateTime), N'Admin', CAST(N'2021-07-10T20:42:00.230' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (24, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-10T20:42:12.740' AS DateTime), N'Admin', CAST(N'2021-07-10T20:42:12.740' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (25, 1, 1, 3, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 10022, 1, CAST(N'2021-07-10T20:42:27.947' AS DateTime), N'Admin', CAST(N'2021-07-10T20:42:27.947' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (26, 1, 1, 3, 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-11T15:27:28.147' AS DateTime), N'Admin', CAST(N'2021-07-11T15:27:28.147' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (27, 1, 1, 3, 1, CAST(N'2021-07-04T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-11T15:27:52.687' AS DateTime), N'Admin', CAST(N'2021-07-11T15:27:52.687' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (28, 1, 1, 3, 1, CAST(N'2021-07-04T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-11T15:28:50.613' AS DateTime), N'Admin', CAST(N'2021-07-11T15:28:50.727' AS DateTime), N'Admin')
GO
INSERT [operation].[LoanAccount] ([Id], [IdentityId], [ProductId], [Duration], [InstallmentFrequencyId], [DisbursedDate], [Amount], [Status], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy]) VALUES (29, 1, 1, 3, 1, CAST(N'2021-07-04T00:00:00.000' AS DateTime), 100, 1, CAST(N'2021-07-11T15:30:25.780' AS DateTime), N'Admin', CAST(N'2021-07-11T15:30:25.900' AS DateTime), N'Admin')
GO
SET IDENTITY_INSERT [operation].[LoanAccount] OFF
GO
SET IDENTITY_INSERT [operation].[LoanSchedule] ON 
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (1, 3, 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 1000, 0, 6000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (2, 3, 2, CAST(N'2021-07-19T00:00:00.000' AS DateTime), 1000, 0, 6000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (3, 3, 3, CAST(N'2021-07-26T00:00:00.000' AS DateTime), 1000, 0, 6000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (4, 3, 4, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 1000, 0, 6000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (5, 3, 5, CAST(N'2021-08-09T00:00:00.000' AS DateTime), 1000, 0, 6000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (6, 3, 6, CAST(N'2021-08-16T00:00:00.000' AS DateTime), 1000, 0, 6000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (7, 4, 1, CAST(N'2021-08-05T00:00:00.000' AS DateTime), 4000, 0, 12000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (8, 4, 2, CAST(N'2021-09-05T00:00:00.000' AS DateTime), 4000, 0, 12000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (9, 4, 3, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 4000, 0, 12000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (10, 6, 1, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (11, 6, 2, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (12, 6, 3, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (13, 7, 1, CAST(N'2021-08-07T00:00:00.000' AS DateTime), 166.66666666666666, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (14, 7, 2, CAST(N'2021-09-07T00:00:00.000' AS DateTime), 166.66666666666666, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (15, 7, 3, CAST(N'2021-10-07T00:00:00.000' AS DateTime), 166.66666666666666, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (16, 7, 4, CAST(N'2021-11-07T00:00:00.000' AS DateTime), 166.66666666666666, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (17, 7, 5, CAST(N'2021-12-07T00:00:00.000' AS DateTime), 166.66666666666666, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (18, 7, 6, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 166.66666666666666, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (19, 8, 1, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (20, 8, 2, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (21, 8, 3, CAST(N'2021-07-29T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (22, 9, 1, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 33703.666666666664, 0, 101111)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (23, 9, 2, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 33703.666666666664, 0, 101111)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (24, 9, 3, CAST(N'2021-07-29T00:00:00.000' AS DateTime), 33703.666666666664, 0, 101111)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (25, 10, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (26, 10, 2, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (27, 10, 3, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (28, 11, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (29, 11, 2, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (30, 11, 3, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (31, 12, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (32, 12, 2, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (33, 12, 3, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 303, 0, 909)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (34, 13, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 3030.3333333333335, 0, 9091)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (35, 13, 2, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 3030.3333333333335, 0, 9091)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (36, 13, 3, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 3030.3333333333335, 0, 9091)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (37, 14, 1, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 3.3333333333333335, 0, 10)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (38, 14, 2, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 3.3333333333333335, 0, 10)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (39, 14, 3, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 3.3333333333333335, 0, 10)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (40, 15, 1, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 333.33333333333331, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (41, 15, 2, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 333.33333333333331, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (42, 15, 3, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 333.33333333333331, 0, 1000)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (43, 16, 1, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (44, 16, 2, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (45, 16, 3, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (46, 17, 1, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (47, 17, 2, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (48, 17, 3, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (49, 18, 1, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (50, 18, 2, CAST(N'2021-07-21T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (51, 18, 3, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 41041, 0, 123123)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (52, 19, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (53, 19, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (54, 19, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (55, 20, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (56, 20, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (57, 20, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (58, 21, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (59, 21, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (60, 21, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (61, 22, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (62, 22, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (63, 22, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (64, 23, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (65, 23, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (66, 23, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (67, 24, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (68, 24, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (69, 24, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (70, 25, 1, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 3340.6666666666665, 0, 10022)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (71, 25, 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 3340.6666666666665, 0, 10022)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (72, 25, 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), 3340.6666666666665, 0, 10022)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (73, 26, 1, CAST(N'2021-07-19T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (74, 26, 2, CAST(N'2021-07-26T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (75, 26, 3, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (76, 27, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (77, 27, 2, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (78, 27, 3, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (79, 28, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (80, 28, 2, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (81, 28, 3, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (82, 29, 1, CAST(N'2021-07-11T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (83, 29, 2, CAST(N'2021-07-18T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
INSERT [operation].[LoanSchedule] ([Id], [LoanAccountId], [InstallmentNo], [ScheduledDate], [InstallmentAmount], [PaidAmount], [OutstandingAmount]) VALUES (84, 29, 3, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 33.333333333333336, 0, 100)
GO
SET IDENTITY_INSERT [operation].[LoanSchedule] OFF
GO
/****** Object:  Index [UQ__Duration__AE1EFC914EF26A8B]    Script Date: 7/23/2021 11:40:47 AM ******/
ALTER TABLE [config].[Duration] ADD UNIQUE NONCLUSTERED 
(
	[Duration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [config].[ProductDuration]  WITH CHECK ADD FOREIGN KEY([Duration])
REFERENCES [config].[Duration] ([Duration])
GO
ALTER TABLE [config].[ProductDuration]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [config].[Product] ([Id])
GO
ALTER TABLE [config].[ProductInstallmentFrequency]  WITH CHECK ADD FOREIGN KEY([InstallmentFrequencyId])
REFERENCES [config].[InstallmentFrequency] ([Id])
GO
ALTER TABLE [config].[ProductInstallmentFrequency]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [config].[Product] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [operation].[Identity]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [operation].[IdentityType] ([Id])
GO
ALTER TABLE [operation].[LoanAccount]  WITH CHECK ADD FOREIGN KEY([Duration])
REFERENCES [config].[Duration] ([Duration])
GO
ALTER TABLE [operation].[LoanAccount]  WITH CHECK ADD FOREIGN KEY([IdentityId])
REFERENCES [operation].[Identity] ([Id])
GO
ALTER TABLE [operation].[LoanAccount]  WITH CHECK ADD FOREIGN KEY([InstallmentFrequencyId])
REFERENCES [config].[InstallmentFrequency] ([Id])
GO
ALTER TABLE [operation].[LoanAccount]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [config].[Product] ([Id])
GO
ALTER TABLE [operation].[LoanSchedule]  WITH CHECK ADD FOREIGN KEY([LoanAccountId])
REFERENCES [operation].[LoanAccount] ([Id])
GO
