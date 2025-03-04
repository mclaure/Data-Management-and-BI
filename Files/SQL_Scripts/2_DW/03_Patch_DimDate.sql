USE [BikeStoresDW]
GO

INSERT INTO [dbo].[DimDate]
           ([DateKey]
           ,[FullDate]
           ,[DayNumberOfWeek]
           ,[DayNameOfWeek]
           ,[DayNumberOfMonth]
           ,[DayNumberOfYear]
           ,[WeekNumberOfYear]
           ,[MonthName]
           ,[MonthNumberOfYear]
           ,[CalendarQuarter]
           ,[CalendarYear]
           ,[CalendarSemester])
     VALUES
           (0
           ,GETDATE()
           ,0
           ,''
           ,0
           ,0
           ,1
           ,''
           ,0
           ,0
           ,0
           ,0);
GO


