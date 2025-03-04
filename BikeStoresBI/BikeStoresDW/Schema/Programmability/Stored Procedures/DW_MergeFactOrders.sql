CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN

	UPDATE dc
	SET [OrderDateKey]    = sc.[OrderDateKey]
	   ,[RequiredDateKey] = sc.[RequiredDateKey]
	   ,[ShippedDateKey]  = sc.[ShippedDateKey]
       ,[CustomerSK]      = sc.[CustomerSK]
	   ,[StaffSK]         = sc.[StaffSK]
	   ,[StoreSK]         = sc.[StoreSK]
	   ,[ProductSK]       = sc.[ProductSK]
	   ,[Quantity]        = sc.[Quantity]
	   ,[ListPrice]       = sc.[ListPrice]
	   ,[Discount]        = sc.[Discount]
	   ,[OrderStatus]     = sc.[OrderStatus]
	   ,[OrderDate]       = sc.[OrderDate] 
	   ,[RequiredDate]    = sc.[RequiredDate]
	   ,[ShippedDate]     = sc.[ShippedDate]
	FROM [dbo].[FactOrders]         dc
	INNER JOIN [staging].[orders] sc ON (dc.[OrderID] = sc.[OrderID] AND dc.ItemID = sc.[ItemID])
END
GO