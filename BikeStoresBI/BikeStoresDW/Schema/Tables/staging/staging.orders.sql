CREATE TABLE [staging].[orders]
(
	[OrderID]         [int] NOT NULL,
	[ItemID]          [int] NOT NULL,
	[OrderDateKey]    [int] NOT NULL,
	[RequiredDateKey] [int] NOT NULL,
	[ShippedDateKey]  [int] NOT NULL,
	[CustomerSK]      [int] NULL,
	[StaffSK]         [int] NULL,
	[StoreSK]         [int] NULL,
	[ProductSK]       [int] NULL,
	[Quantity]        [int] NOT NULL,
	[ListPrice]       [decimal](10, 2) NOT NULL,
	[Discount]        [decimal](10, 2) NOT NULL,
	[OrderStatus]     [tinyint] NOT NULL,
	[OrderDate]       [date] NOT NULL,
	[RequiredDate]    [date] NOT NULL,
	[ShippedDate]     [date] NULL
);
GO