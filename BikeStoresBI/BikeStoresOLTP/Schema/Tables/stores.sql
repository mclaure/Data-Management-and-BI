CREATE TABLE [sales].[stores]
(
	[store_id]   [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_stores PRIMARY KEY,
	[store_name] [varchar](255)      NOT NULL,
	[phone]      [varchar](25)       NULL,
	[email]      [varchar](255)      NULL,
	[street]     [varchar](255)      NULL,
	[city]       [varchar](255)      NULL,
	[state]      [varchar](10)       NULL,
	[zip_code]   [varchar](5)        NULL,
	[rowversion] [timestamp]         NOT NULL
);