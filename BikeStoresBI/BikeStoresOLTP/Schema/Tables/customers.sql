CREATE TABLE [sales].[customers]
(
	[customer_id] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_customers PRIMARY KEY,
	[first_name]  [varchar](255)      NOT NULL,
	[last_name]   [varchar](255)      NOT NULL,
	[phone]       [varchar](25)       NULL,
	[email]       [varchar](255)      NOT NULL,
	[street]      [varchar](255)      NULL,
	[city]        [varchar](50)       NULL,
	[state]       [varchar](25)       NULL,
	[zip_code]    [varchar](5)        NULL,
	[rowversion]  [timestamp]         NOT NULL
);