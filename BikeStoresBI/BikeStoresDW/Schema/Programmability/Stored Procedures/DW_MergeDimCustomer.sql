CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN

	UPDATE dc
	SET [FirstName] = sc.[FirstName]
	   ,[LastName]  = sc.[LastName]
	   ,[Phone]     = sc.[Phone]
	   ,[EMail]     = sc.[Email]
	   ,[Street]    = sc.[Street]
	   ,[City]      = sc.[City]
	   ,[State]     = sc.[State]
	   ,[ZipCode]   = sc.[ZipCode]
	FROM [dbo].[DimCustomer]        dc
	INNER JOIN [staging].[customer] sc ON (dc.[CustomerSK]=sc.[CustomerSK])
END
GO