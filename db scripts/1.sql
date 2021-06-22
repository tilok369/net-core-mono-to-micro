Use MonoDB
GO

Create table [dbo].[Role]
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

Create table [dbo].[User]
(
	Id int not null primary key identity(1,1),
	UserId nvarchar(20) not null,
	Email nvarchar(50) not null,
	[Password] nvarchar(15) not null,
	RoleId int not null,
	[Status] bit not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null,
	foreign key (RoleId) references [dbo].[Role](Id)
)

GO