CREATE TABLE [sales].[order_items]
(
	[order_id] [int]              NOT NULL,
	[item_id] [int]               NOT NULL,
	[product_id] [int]            NOT NULL,
	[quantity] [int]              NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2)    NOT NULL,
	[rowversion] [timestamp]      NOT NULL
);
GO

ALTER TABLE [sales].[order_items] ADD CONSTRAINT PK_order_items PRIMARY KEY([order_id],[item_id]);
GO

ALTER TABLE [sales].[order_items] ADD  DEFAULT ((0)) FOR [discount];
GO

ALTER TABLE [sales].[order_items] ADD CONSTRAINT FK_order_items_orders FOREIGN KEY([order_id]) REFERENCES [sales].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [sales].[order_items] ADD CONSTRAINT FK_order_items_products FOREIGN KEY([product_id]) REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO