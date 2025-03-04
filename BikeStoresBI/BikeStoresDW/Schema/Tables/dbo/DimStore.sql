CREATE TABLE [dbo].[DimStore]
(
	[StoreSK] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimStore PRIMARY KEY,
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](5) NULL
);
GO
