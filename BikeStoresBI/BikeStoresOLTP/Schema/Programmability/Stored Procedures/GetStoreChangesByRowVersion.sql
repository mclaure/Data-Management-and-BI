CREATE PROCEDURE [dbo].[GetStoreChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [store_id]
		,[store_name]
		,[phone]
		,[email]
		,[street]
		,[city]
		,[state]
		,[zip_code]
	FROM [sales].[stores]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO