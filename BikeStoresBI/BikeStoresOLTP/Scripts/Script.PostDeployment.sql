/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

:r .\clean.data.sql
:r .\brands.data.sql
:r .\categories.data.sql
:r .\products.data.sql
:r .\customers.data.sql
:r .\stores.data.sql
:r .\stocks.data.sql
:r .\staffs.data.sql
:r .\orders.data.sql
:r .\order_items.data.sql