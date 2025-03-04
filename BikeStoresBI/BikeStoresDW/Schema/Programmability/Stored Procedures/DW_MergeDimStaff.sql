CREATE PROCEDURE [dbo].[DW_MergeDimStaff]
AS
BEGIN

	UPDATE ds
	SET [FirstName] = sc.[FirstName]
	   ,[LastName]  = sc.[LastName]
	   ,[EMail]     = sc.[Email]
	   ,[Phone]     = sc.[Phone]
	   ,[Active]    = sc.[Active]
	   ,[ManagerSk] = sc.[ManagerID]
	FROM [dbo].[DimStaff]           ds
	INNER JOIN [staging].[staff] sc ON (ds.[StaffSK] = sc.[StaffSK])
END
GO