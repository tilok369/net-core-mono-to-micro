Use MonoDB
GO

create schema config
Go

Create table [config].[Product]
(
	Id int not null primary key identity(1,1),
	[Name] nvarchar(50) not null,
	[Status] bit not null,
	[SortOrder] int not null,
	[StartDate] datetime not null,
	[EndDate] datetime not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null
)

Go

Create table [config].[InstallmentFrequency]
(
	Id int not null primary key identity(1,1),
	[Name] nvarchar(50) not null,
	[Status] bit not null,
	[SortOrder] int not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null
)

GO

Create table [config].[Duration]
(
	Id int not null primary key identity(1,1),
	[Duration] int not null unique,
	[Status] bit not null,
	[SortOrder] int not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null
)

Go


Create table [config].[ProductDuration]
(
	Id int not null primary key identity(1,1),
	[ProductId] int not null,
	[Duration] int not null,
	[SortOrder] int not null,
	[StartDate] datetime not null,
	[EndDate] datetime not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null,
	foreign key (ProductId) references [config].[Product](Id),
	foreign key (Duration) references [config].[Duration](Duration)
)

Go


Create table [config].[ProductInstallmentFrequency]
(
	Id int not null primary key identity(1,1),
	[ProductId] int not null,
	[InstallmentFrequencyId] int not null,
	[SortOrder] int not null,
	[StartDate] datetime not null,
	[EndDate] datetime not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null,
	foreign key (ProductId) references [config].[Product](Id),
	foreign key (InstallmentFrequencyId) references [config].[InstallmentFrequency](Id)
)

GO

--insert into config.Product values ('Primary Loan', 1, 1, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.Product values ('Secondary Loan', 1, 2, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--select * from config.Product

--insert into config.InstallmentFrequency values ('Weekly', 1, 1, GETDATE(), 'System', GETDATE(), 'System')
--insert into config.InstallmentFrequency values ('Monthly', 1, 2, GETDATE(), 'System', GETDATE(), 'System')
--insert into config.InstallmentFrequency values ('Quarterly', 1, 3, GETDATE(), 'System', GETDATE(), 'System')
--select * from config.InstallmentFrequency

--insert into config.Duration values (3, 1, 1, GETDATE(), 'System', GETDATE(), 'System')
--insert into config.Duration values (6, 1, 2, GETDATE(), 'System', GETDATE(), 'System')
--insert into config.Duration values (12, 1, 3, GETDATE(), 'System', GETDATE(), 'System')
--select * from config.Duration

--insert into config.ProductDuration values (1, 3, 1, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductDuration values (1, 6, 2, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductDuration values (1, 12, 3, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductDuration values (2, 3, 1, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductDuration values (2, 6, 2, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--select * from config.ProductDuration

--insert into config.ProductInstallmentFrequency values (1, 1, 1, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductInstallmentFrequency values (1, 2, 2, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductInstallmentFrequency values (1, 3, 3, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductInstallmentFrequency values (2, 1, 1, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--insert into config.ProductInstallmentFrequency values (2, 2, 2, '2021-01-01', '2099-12-31', GETDATE(), 'System', GETDATE(), 'System')
--select * from config.ProductInstallmentFrequency