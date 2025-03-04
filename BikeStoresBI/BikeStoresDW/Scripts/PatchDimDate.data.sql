IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[DimDate]
			  WHERE [DateKey] = 0)
BEGIN

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
END
GO