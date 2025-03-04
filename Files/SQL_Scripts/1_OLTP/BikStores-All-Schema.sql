USE [BikeStores]
GO
/****** Object:  Schema [production]    Script Date: 4/5/2023 10:42:01 PM ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 4/5/2023 10:42:01 PM ******/
CREATE SCHEMA [sales]
GO
/****** Object:  Table [production].[brands]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[categories]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[products]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[stocks]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[customers]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[order_items]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[orders]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[staffs]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [tinyint] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[stores]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
	[rowversion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sales].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [sales].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [sales].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerChangesByRowVersion]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [customer_id]
		  ,[first_name]
		  ,[last_name]
		  ,[phone]
		  ,[email]
		  ,[street]
		  ,[city]
		  ,[state]
		  ,[zip_code]
	  FROM [sales].[customers]
	  WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
/****** Object:  StoredProcedure [dbo].[GetDatabaseRowVersion]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDatabaseRowVersion]
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET NOCOUNT ON

	SELECT DBTS = (CONVERT(BIGINT,MIN_ACTIVE_ROWVERSION())-1);
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersChangesByRowVersion]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrdersChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT ord.[order_id]
		  ,ori.item_id
		  ,OrderDateKey = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.[order_date]))
						  + CASE 
								WHEN DATEPART(MONTH,ord.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[order_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[order_date]))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.[order_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[order_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[order_date]))
							END))
		  ,RequiredDateKey = CONVERT(INT,
							(CONVERT(CHAR(4),DATEPART(YEAR,ord.[required_date]))
						  + CASE 
								WHEN DATEPART(MONTH,ord.[required_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[required_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[required_date]))
							END
						  + CASE 
								WHEN DATEPART(DAY,ord.[required_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[required_date]))
								ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[required_date]))
							END))
		  ,ShippedDateKey = CASE
							WHEN ord.[shipped_date] IS NULL THEN 0
							ELSE (CONVERT(INT,
										(CONVERT(CHAR(4),DATEPART(YEAR,ord.[shipped_date]))
										+ CASE 
											WHEN DATEPART(MONTH,ord.[shipped_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(MONTH,ord.[shipped_date]))
											ELSE + CONVERT(CHAR(2),DATEPART(MONTH,ord.[shipped_date]))
										END
										+ CASE 
											WHEN DATEPART(DAY,ord.[shipped_date]) < 10 THEN '0' + CONVERT(CHAR(1),DATEPART(DAY,ord.[shipped_date]))
											ELSE + CONVERT(CHAR(2),DATEPART(DAY,ord.[shipped_date]))
										END)))
							END
		  ,ord.[customer_id]
		  ,ord.[staff_id]
		  ,ord.[store_id]
		  ,ori.product_id
		  ,ori.quantity
		  ,ori.list_price
		  ,ori.discount
		  ,ord.[order_status]
		  ,ord.[order_date]
		  ,ord.[required_date]
		  ,ord.[shipped_date]
	FROM [sales].[orders]            ord
	INNER JOIN [sales].[order_items] ori ON (ord.order_id = ori.order_id)
	WHERE (ord.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND ord.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (ori.[rowversion] > CONVERT(ROWVERSION,@startRow) 
			AND ori.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductChangesByRowVersion]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN

	SELECT prd.[product_id]
		  ,prd.[product_name]
		  ,brd.[brand_name]
		  ,cat.category_name
		  ,prd.[model_year]
		  ,prd.[list_price]
	FROM [production].[products]         prd
	INNER JOIN [production].[brands]     brd ON (brd.[brand_id] = prd.[brand_id]) 
	INNER JOIN [production].[categories] cat ON (prd.category_id = cat.category_id)
	WHERE (prd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND prd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (brd.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND brd.[rowversion] <= CONVERT(ROWVERSION,@endRow))
	OR (cat.[rowversion] > CONVERT(ROWVERSION,@startRow) 
		   AND cat.[rowversion] <= CONVERT(ROWVERSION,@endRow))
END
GO
/****** Object:  StoredProcedure [dbo].[GetStaffChangesByRowVersion]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStaffChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [staff_id]
		,[first_name]
		,[last_name]
		,[email]
		,[phone]
		,[active]
		,[manager_id]
	FROM [sales].[staffs]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow);
END
GO
/****** Object:  StoredProcedure [dbo].[GetStoreChangesByRowVersion]    Script Date: 4/5/2023 10:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStoreChangesByRowVersion]
(
   @startRow BIGINT 
   ,@endRow  BIGINT 
)
AS
BEGIN
	SELECT [store_id]
		,[store_name]
		,[phone]
		,[email]
		,[street]
		,[city]
		,[state]
		,[zip_code]
	FROM [sales].[stores]
	WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO
