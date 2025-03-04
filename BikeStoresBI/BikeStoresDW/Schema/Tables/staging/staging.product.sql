CREATE TABLE [staging].[product]
(
	[ProductSK]    [int]            NOT NULL,
	[ProductName]  [varchar](255)   NOT NULL,
	[BrandName]    [varchar](255)   NULL,
	[CategoryName] [varchar](255)   NULL,
	[ModelYear]    [smallint]       NULL,
	[ListPrice]    [decimal](10, 2) NULL
);
GO