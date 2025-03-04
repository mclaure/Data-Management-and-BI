IF NOT EXISTS(SELECT TOP(1) 1
              FROM [dbo].[DimDate])
 BEGIN
	BEGIN TRAN 
		DECLARE @startdate DATE = '2016-01-01',
				@enddate   DATE = '2019-01-01';
		DECLARE @datelist TABLE(FullDate DATE);

	IF @startdate IS NULL
		BEGIN
			SELECT TOP 1 
				   @startdate = FullDate
			FROM dbo.DimDate 
			ORDER By DateKey ASC;
		END

	WHILE (@startdate <= @enddate)
	BEGIN 
		INSERT INTO @datelist(FullDate)
		SELECT @startdate

		SET @startdate = DATEADD(dd,1,@startdate);
	END

	 INSERT INTO dbo.DimDate(DateKey
							,FullDate 
							,DayNumberOfWeek 
							,DayNameOfWeek 
							,DayNumberOfMonth 
							,DayNumberOfYear 
							,WeekNumberOfYear 
							,[MonthName] 
							,MonthNumberOfYear 
							,CalendarQuarter 
							,CalendarYear 
							,CalendarSemester)

	SELECT DateKey           = CONVERT(INT,CONVERT(VARCHAR,dl.FullDate,112))
		  ,FullDate          = dl.FullDate
		  ,DayNumberOfWeek   = DATEPART(dw,dl.FullDate)
		  ,DayNameOfWeek     = DATENAME(WEEKDAY,dl.FullDate) 
		  ,DayNumberOfMonth  = DATEPART(d,dl.FullDate)
		  ,DayNumberOfYear   = DATEPART(dy,dl.FullDate)
		  ,WeekNumberOfYear  = DATEPART(wk, dl.FUllDate)
		  ,[MonthName]       = DATENAME(MONTH,dl.FullDate) 
		  ,MonthNumberOfYear = MONTH(dl.FullDate)
		  ,CalendarQuarter   = DATEPART(qq, dl.FullDate)
		  ,CalendarYear      = YEAR(dl.FullDate)
		  ,CalendarSemester  = CASE DATEPART(qq, dl.FullDate)
										WHEN 1 THEN 1
										WHEN 2 THEN 1
										WHEN 3 THEN 2
										WHEN 4 THEN 2
								  END
		FROM @datelist              dl 
		LEFT OUTER JOIN dbo.DimDate dd ON (dl.FullDate = dd.FullDate)
		WHERE dd.FullDate IS NULL;
	COMMIT TRAN
END
GO