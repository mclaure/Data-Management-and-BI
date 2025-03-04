CREATE TABLE [dbo].[DimProduct]
(
	[ProductSK] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimProduct PRIMARY KEY,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[BrandName] [varchar](255) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
	[ModelYear] [smallint] NOT NULL,
	[ListPrice] [decimal](10, 2) NOT NULL
);
GO