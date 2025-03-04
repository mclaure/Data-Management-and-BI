CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN

	UPDATE dc
	SET [ProductName]  = sc.[ProductName]
	   ,[BrandName]    = sc.[BrandName]
	   ,[CategoryName] = sc.[CategoryName]
	   ,[ModelYear]    = sc.[ModelYear]
	   ,[ListPrice]    = sc.[ListPrice]
	FROM [dbo].[DimProduct]         dc
	INNER JOIN [staging].[product] sc ON (dc.[ProductSK]=sc.[ProductSK])
END
GO
