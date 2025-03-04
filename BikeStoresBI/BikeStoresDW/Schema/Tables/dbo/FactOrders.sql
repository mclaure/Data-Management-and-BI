CREATE TABLE [dbo].[FactOrders]
(
	[OrderID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[OrderDateKey] [int] NOT NULL,
	[RequiredDateKey] [int] NOT NULL,
	[ShippedDateKey] [int] NOT NULL,
	[CustomerSK] [int] NULL,
	[StaffSK] [int] NULL,
	[StoreSK] [int] NULL,
	[ProductSK] [int] NULL,
	[Quantity] [int] NOT NULL,
	[ListPrice] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](10, 2) NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[RequiredDate] [date] NOT NULL,
	[ShippedDate] [date] NULL
);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT PK_FactOrders PRIMARY KEY(OrderID,ItemID);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimCustomer] FOREIGN KEY([CustomerSK]) REFERENCES [dbo].[DimCustomer] ([CustomerSK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimDate_OrderDate] FOREIGN KEY([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimDate_RequiredDate] FOREIGN KEY([RequiredDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimDate_ShippedDate] FOREIGN KEY([ShippedDateKey]) REFERENCES [dbo].[DimDate] ([DateKey]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimProduct] FOREIGN KEY([ProductSK]) REFERENCES [dbo].[DimProduct] ([ProductSK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimStaff] FOREIGN KEY([StaffSK]) REFERENCES [dbo].[DimStaff] ([StaffSK]);
GO

ALTER TABLE [dbo].[FactOrders] ADD CONSTRAINT [FK_DimStore] FOREIGN KEY([StoreSK]) REFERENCES [dbo].[DimStore] ([StoreSK]);
GO