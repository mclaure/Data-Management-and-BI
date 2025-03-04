CREATE TABLE [sales].[orders]
(
	[order_id]      [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_orders PRIMARY KEY,
	[customer_id]   [int]               NULL,
	[order_status]  [tinyint]           NOT NULL,
	[order_date]    [date]              NOT NULL,
	[required_date] [date]              NOT NULL,
	[shipped_date]  [date]              NULL,
	[store_id]      [int]               NOT NULL,
	[staff_id]      [int]               NOT NULL,
	[rowversion]    [timestamp]         NOT NULL
);
GO

ALTER TABLE [sales].[orders] ADD CONSTRAINT FK_orders_customers FOREIGN KEY([customer_id]) REFERENCES [sales].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [sales].[orders] ADD CONSTRAINT FK_orders_staffs FOREIGN KEY([staff_id]) REFERENCES [sales].[staffs] ([staff_id])
GO

ALTER TABLE [sales].[orders] ADD CONSTRAINT FK_orders_stores FOREIGN KEY([store_id]) REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO