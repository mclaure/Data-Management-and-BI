CREATE TABLE [production].[products]
(
	[product_id]   [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_products PRIMARY KEY,
	[product_name] [varchar](255)      NOT NULL,
	[brand_id]     [int]               NOT NULL,
	[category_id]  [int]               NOT NULL,
	[model_year]   [smallint]          NOT NULL,
	[list_price]   [decimal](10, 2)    NOT NULL,
	[rowversion]   [timestamp]         NOT NULL
);
GO

ALTER TABLE [production].[products] ADD CONSTRAINT FK_products_brands FOREIGN KEY([brand_id]) REFERENCES [production].[brands] ([brand_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [production].[products] ADD CONSTRAINT FK_products_categories FOREIGN KEY([category_id]) REFERENCES [production].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO