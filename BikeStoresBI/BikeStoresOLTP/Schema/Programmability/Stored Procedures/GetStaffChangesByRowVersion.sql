CREATE PROCEDURE [dbo].[GetStaffChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [staff_id]
		,[first_name]
		,[last_name]
		,[email]
		,[phone]
		,[active]
		,[manager_id]
	FROM [sales].[staffs]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow);
END
GO