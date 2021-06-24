Use MonoDB
GO

INSERT INTO [operation].[IdentityType]
           ([Name]
           ,[Status]
           ,[SortOrder]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[UpdatedOn]
           ,[UpdatedBy])
select 'Client', 1, 1, GETDATE(), 'system', GETDATE(), 'system'
union all
select 'Nominee', 1, 2, GETDATE(), 'system', GETDATE(), 'system'
union all
select 'Guarantor', 1, 3, GETDATE(), 'system', GETDATE(), 'system'