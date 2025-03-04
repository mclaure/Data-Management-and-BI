CREATE TABLE [dbo].[PackageConfig]
(
	[PackageID] [int] IDENTITY(1,1) NOT NULL CONSTRAINT PK_PackageConfig PRIMARY KEY,
	[TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL
);
GO