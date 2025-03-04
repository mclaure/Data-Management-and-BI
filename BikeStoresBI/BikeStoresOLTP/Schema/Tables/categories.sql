CREATE TABLE [production].[categories]
(
	[category_id]   [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_categories PRIMARY KEY,
	[category_name] [varchar](255)      NOT NULL,
	[rowversion]    [timestamp]         NOT NULL
);