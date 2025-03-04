CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
(
	@tableName VARCHAR(50)
)
  AS
  BEGIN
	SELECT LastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE TableName = @tableName;
  END
GO