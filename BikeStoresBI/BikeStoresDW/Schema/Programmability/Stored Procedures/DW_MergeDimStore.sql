CREATE PROCEDURE [dbo].[DW_MergeDimStore]
AS
BEGIN

	UPDATE dc
	SET [StoreName] = sc.[StoreName]
	   ,[Phone]     = sc.[Phone]
	   ,[EMail]     = sc.[Email]
	   ,[Street]    = sc.[Street]
	   ,[City]      = sc.[City]
	   ,[State]     = sc.[State]
	   ,[ZipCode]   = sc.[ZipCode]
	FROM [dbo].[DimStore]        dc
	INNER JOIN [staging].[store] sc ON (dc.[StoreSK]=sc.[StoreSK])
END
GO