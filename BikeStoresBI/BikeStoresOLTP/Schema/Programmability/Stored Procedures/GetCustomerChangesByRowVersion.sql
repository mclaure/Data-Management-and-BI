CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [customer_id]
		  ,[first_name]
		  ,[last_name]
		  ,[phone]
		  ,[email]
		  ,[street]
		  ,[city]
		  ,[state]
		  ,[zip_code]
	  FROM [sales].[customers]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO