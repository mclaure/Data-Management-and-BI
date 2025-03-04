CREATE PROCEDURE [dbo].[GetProductChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

	SELECT prd.[product_id]
		  ,prd.[product_name]
		  ,brd.[brand_name]
		  ,cat.category_name
		  ,prd.[model_year]
		  ,prd.[list_price]
	FROM [production].[products]         prd
	INNER JOIN [production].[brands]     brd ON (brd.[brand_id] = prd.[brand_id]) 
	INNER JOIN [production].[categories] cat ON (prd.category_id = cat.category_id)
	WHERE (prd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND prd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (brd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND brd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (cat.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND cat.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO