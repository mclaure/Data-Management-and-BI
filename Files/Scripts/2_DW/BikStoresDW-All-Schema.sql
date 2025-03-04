USE [BikeStoresDW]
GO
/****** Object:  Schema [staging]    Script Date: 4/5/2023 10:43:09 PM ******/
CREATE SCHEMA [staging]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerSK] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NOT NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](25) NULL,
	[ZipCode] [varchar](5) NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[DayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[MonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[BrandName] [varchar](255) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
	[ModelYear] [smallint] NOT NULL,
	[ListPrice] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStaff]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStaff](
	[StaffSK] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Active] [tinyint] NOT NULL,
	[ManagerSK] [int] NULL,
 CONSTRAINT [PK_DimStaff] PRIMARY KEY CLUSTERED 
(
	[StaffSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreSK] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](5) NULL,
 CONSTRAINT [PK_DimStore] PRIMARY KEY CLUSTERED 
(
	[StoreSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactOrders]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOrders](
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
	[ShippedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageConfig]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageConfig](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL,
 CONSTRAINT [PK_PackageConfig] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[customer]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[customer](
	[CustomerSK] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NOT NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](25) NULL,
	[ZipCode] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[orders]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[orders](
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
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[product]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[product](
	[ProductSK] [int] NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[BrandName] [varchar](255) NULL,
	[CategoryName] [varchar](255) NULL,
	[ModelYear] [smallint] NULL,
	[ListPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[staff]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[staff](
	[StaffSK] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Active] [tinyint] NOT NULL,
	[ManagerID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [staging].[store]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[store](
	[StoreSK] [int] NOT NULL,
	[StoreName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Street] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](10) NULL,
	[ZipCode] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomer] FOREIGN KEY([CustomerSK])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimCustomer]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_OrderDate] FOREIGN KEY([OrderDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimDate_OrderDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_RequiredDate] FOREIGN KEY([RequiredDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimDate_RequiredDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimDate_ShippedDate] FOREIGN KEY([ShippedDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimDate_ShippedDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct] FOREIGN KEY([ProductSK])
REFERENCES [dbo].[DimProduct] ([ProductSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimProduct]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimStaff] FOREIGN KEY([StaffSK])
REFERENCES [dbo].[DimStaff] ([StaffSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimStaff]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_DimStore] FOREIGN KEY([StoreSK])
REFERENCES [dbo].[DimStore] ([StoreSK])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_DimStore]
GO
/****** Object:  StoredProcedure [dbo].[DW_MergeDimCustomer]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN

	UPDATE dc
	SET [FirstName] = sc.[FirstName]
	   ,[LastName]  = sc.[LastName]
	   ,[Phone]     = sc.[Phone]
	   ,[EMail]     = sc.[Email]
	   ,[Street]    = sc.[Street]
	   ,[City]      = sc.[City]
	   ,[State]     = sc.[State]
	   ,[ZipCode]   = sc.[ZipCode]
	FROM [dbo].[DimCustomer]        dc
	INNER JOIN [staging].[customer] sc ON (dc.[CustomerSK]=sc.[CustomerSK])
END
GO
/****** Object:  StoredProcedure [dbo].[DW_MergeDimProduct]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN

	UPDATE dc
	SET [ProductName]  = sc.[ProductName]
	   ,[BrandName]    = sc.[BrandName]
	   ,[CategoryName] = sc.[CategoryName]
	   ,[ModelYear]    = sc.[ModelYear]
	   ,[ListPrice]    = sc.[ListPrice]
	FROM [dbo].[DimProduct]         dc
	INNER JOIN [staging].[product] sc ON (dc.[ProductSK]=sc.[ProductSK])
END
GO
/****** Object:  StoredProcedure [dbo].[DW_MergeDimStaff]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DW_MergeDimStaff]
AS
BEGIN

	UPDATE ds
	SET [FirstName] = sc.[FirstName]
	   ,[LastName]  = sc.[LastName]
	   ,[EMail]     = sc.[Email]
	   ,[Phone]     = sc.[Phone]
	   ,[Active]    = sc.[Active]
	   ,[ManagerSk] = sc.[ManagerID]
	FROM [dbo].[DimStaff]           ds
	INNER JOIN [staging].[staff] sc ON (ds.[StaffSK] = sc.[StaffSK])
END
GO
/****** Object:  StoredProcedure [dbo].[DW_MergeDimStore]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DW_MergeDimStore]
AS
BEGIN

	UPDATE dc
	SET [StoreName] = sc.[StoreName]
	   ,[Phone]     = sc.[Phone]
	   ,[EMail]     = sc.[Email]
	   ,[Street]    = sc.[Street]
	   ,[City]      = sc.[City]
	   ,[State]     = sc.[State]
	   ,[ZipCode]   = sc.[ZipCode]
	FROM [dbo].[DimStore]        dc
	INNER JOIN [staging].[store] sc ON (dc.[StoreSK]=sc.[StoreSK])
END
GO
/****** Object:  StoredProcedure [dbo].[DW_MergeFactOrders]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[GetLastPackageRowVersion]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[GetLastPackageRowVersion]
  (
	@tableName VARCHAR(50)
  )
  AS
  BEGIN
	SELECT LastRowVersion
	FROM [dbo].[PackageConfig]
	WHERE TableName = @tableName;
  END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLastPackageRowVersion]    Script Date: 4/5/2023 10:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
  (
	@tableName VARCHAR(50)
	,@lastRowVersion BIGINT
  )
  AS
  BEGIN
	UPDATE [dbo].[PackageConfig]
	SET LastRowVersion = @lastRowVersion
	WHERE TableName = @tableName;
  END
GO
