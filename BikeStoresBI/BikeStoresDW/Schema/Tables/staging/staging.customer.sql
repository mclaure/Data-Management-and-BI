﻿CREATE TABLE [staging].[customer]
(
	[CustomerSK] [int]          NOT NULL,
	[FirstName]  [varchar](255) NOT NULL,
	[LastName]   [varchar](255) NOT NULL,
	[Phone]      [varchar](25)  NULL,
	[Email]      [varchar](255) NOT NULL,
	[Street]     [varchar](255) NULL,
	[City]       [varchar](50)  NULL,
	[State]      [varchar](25)  NULL,
	[ZipCode]    [varchar](5)   NULL
);
GO