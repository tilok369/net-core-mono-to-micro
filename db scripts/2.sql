Use MonoDB
GO

Create schema operation
GO

Create table [operation].[IdentityType]
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

Create table [operation].[Identity]
(
	Id int not null primary key identity(1,1),
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[Email] nvarchar(50) null,
	[Phone] nvarchar(50) not null,
	[IdentityNumber] nvarchar(50) not null,
	[TypeId] int not null,
	[Status] bit not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null,
	foreign key (TypeId) references [operation].[IdentityType](Id)
)