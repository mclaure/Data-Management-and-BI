CREATE TABLE [sales].[staffs]
(
	[staff_id]   [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_staffs PRIMARY KEY,
	[first_name] [varchar](50)       NOT NULL,
	[last_name]  [varchar](50)       NOT NULL,
	[email]      [varchar](255)      NOT NULL,
	[phone]      [varchar](25)       NULL,
	[active]     [tinyint]           NOT NULL,
	[store_id]   [int]               NOT NULL,
	[manager_id] [int]               NULL,
	[rowversion] [timestamp]         NOT NULL
);
GO

ALTER TABLE [sales].[staffs] ADD CONSTRAINT FK_staffs_staffs FOREIGN KEY([manager_id]) REFERENCES [sales].[staffs] ([staff_id])
GO

ALTER TABLE [sales].[staffs] ADD CONSTRAINT FK_staffs_stores FOREIGN KEY([store_id]) REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO