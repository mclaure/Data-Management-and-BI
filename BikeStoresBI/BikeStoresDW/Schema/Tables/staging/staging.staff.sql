CREATE TABLE [staging].[staff]
(
	[StaffSK] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Active] [tinyint] NOT NULL,
	[ManagerID] [int] NULL
);