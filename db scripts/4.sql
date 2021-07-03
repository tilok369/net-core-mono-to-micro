Use MonoDB
GO

Create table [operation].[LoanAccount]
(
	Id int not null primary key identity(1,1),
	[IdentityId] int not null,
	[ProductId] int not null,
	[Duration] int not null,
	[InstallmentFrequencyId] int not null,
	[DisbursedDate] datetime not null,
	[Amount] int not null,
	[Status] bit not null,
	CreatedOn datetime not null,
	CreatedBy nvarchar(50) not null,
	UpdatedOn datetime null,
	UpdatedBy nvarchar(50) null,
	foreign key ([IdentityId]) references [operation].[Identity](Id),
	foreign key ([ProductId]) references [config].[Product](Id),
	foreign key ([Duration]) references [config].[Duration]([Duration]),
	foreign key ([InstallmentFrequencyId]) references [config].[InstallmentFrequency](Id)
)

GO

Create table [operation].[LoanSchedule]
(
	Id int not null primary key identity(1,1),
	[LoanAccountId] int not null,
	[InstallmentNo] int not null,
	[ScheduledDate] datetime not null,
	[InstallmentAmount] float not null,
	[PaidAmount] float not null,
	[OutstandingAmount] float not null,
	foreign key ([LoanAccountId]) references [operation].[LoanAccount](Id)
)