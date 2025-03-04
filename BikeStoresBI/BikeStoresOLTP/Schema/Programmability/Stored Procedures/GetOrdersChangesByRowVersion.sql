CREATE PROCEDURE [dbo].[GetOrdersChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT ord.[order_id]
		  ,ori.item_id
		  ,OrderDateKey = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.[order_date]))
						  + CASE 
								WHEN DATEPART(MONTH,ord.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[order_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[order_date]))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[order_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[order_date]))
							END))
		  ,RequiredDateKey = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.[required_date]))
						  + CASE 
								WHEN DATEPART(MONTH,ord.[required_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[required_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[required_date]))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.[required_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[required_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[required_date]))
							END))
		  ,ShippedDateKey = CASE
							WHEN ord.[shipped_date] IS NULL THEN 0
							ELSE (CONVERT(INT,
										(CONVERT(CHAR(4),DATEPART(YEAR,ord.[shipped_date]))
										+ CASE 
											WHEN DATEPART(MONTH,ord.[shipped_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[shipped_date]))
											ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[shipped_date]))
										END
										+ CASE 
											WHEN DATEPART(DAY,ord.[shipped_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[shipped_date]))
											ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[shipped_date]))
										END)))
							END
		  ,ord.[customer_id]
		  ,ord.[staff_id]
		  ,ord.[store_id]
		  ,ori.product_id
		  ,ori.quantity
		  ,ori.list_price
		  ,ori.discount
		  ,ord.[order_status]
		  ,ord.[order_date]
		  ,ord.[required_date]
		  ,ord.[shipped_date]
	FROM [sales].[orders]            ord
	INNER JOIN [sales].[order_items] ori ON (ord.order_id = ori.order_id)
	WHERE (ord.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND ord.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (ori.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND ori.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
