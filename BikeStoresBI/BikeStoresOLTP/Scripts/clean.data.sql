DELETE FROM production.stocks;
GO
DELETE FROM sales.order_items;
GO
DELETE FROM sales.orders;
GO
DBCC CHECKIDENT ('sales.orders', RESEED);
GO
DELETE FROM sales.customers;
GO
DBCC CHECKIDENT ('sales.customers', RESEED);
GO
DELETE FROM sales.staffs;
GO
DBCC CHECKIDENT ('sales.staffs', RESEED);
GO
DELETE FROM sales.stores;
DBCC CHECKIDENT ('sales.stores', RESEED);
GO
DELETE FROM production.stocks;
GO
DELETE FROM production.brands;
GO
DBCC CHECKIDENT ('production.brands', RESEED);
GO
DELETE FROM production.categories;
GO
DBCC CHECKIDENT ('production.categories', RESEED);
GO
DELETE FROM production.products;
GO
DBCC CHECKIDENT ('production.products', RESEED);
GO