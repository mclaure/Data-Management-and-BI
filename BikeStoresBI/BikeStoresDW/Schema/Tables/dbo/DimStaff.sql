CREATE TABLE [dbo].[DimStaff]
(
	[StaffSK] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_DimStaff PRIMARY KEY,
	[StaffID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Active] [tinyint] NOT NULL,
	[ManagerSK] [int] NULL
);
GO