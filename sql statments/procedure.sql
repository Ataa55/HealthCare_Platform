
CREATE PROCEDURE [dbo].[D_Time_Populate] @NextDays Int = 0
AS
Begin
	DECLARE @DateDifference	INT;
	DECLARE @Counter	INT;
	DECLARE @Day		VARCHAR(10);
	DECLARE @Month		VARCHAR(10);
	DECLARE @Quarter	VARCHAR(10);
	DECLARE @Year		INT;
	DECLARE @Date_SK	INT;
	DECLARE @CDate		DateTime;
	DECLARE @CompanyStartDate Date;
	
	If @NextDays < 1
	Begin
		SET @NextDays = 0;
	End
	SET @CDate = DATEADD(DAY, @NextDays, GetDate());
	SET @CompanyStartDate = '2005-04-12';	-- Change this date as per your requirement.
	Set @DateDifference = DATEDIFF(Day, @CompanyStartDate, @CDate);
	Set @Counter = 0;
	
	Truncate Table D_Time;
	
	Insert Into D_Time (Date_SK, Day, Month, Quarter, Year, CDate)
	Values (19000101, 1, 'Jan 1900', 'Q1 1900', 1900, '1900-01-01 00:00:00.000');
	
	While @Counter <= @DateDifference
	Begin
		SET @CDate = DATEADD(Day, @Counter, '2005-04-12');
		SET @Year = DATEPART("YYYY", @CDate);
		SET @Quarter = 'Q'+Cast(DATEPART("QQ", @CDate) As VARCHAR)+' '+CAST(@Year AS VARCHAR);
		SET @Month = LEFT(DATENAME("MM", @CDate), 3)+' '+CAST(@Year AS VARCHAR);
		SET @Day = CAST(DATEPART("DD", @CDate) AS VARCHAR)+' '+LEFT(DATENAME("MM", @CDate), 3);
		SET @Date_SK = CONVERT(VARCHAR(8), @CDate, 112);
		
		Insert Into D_Time (Date_SK, Day, Month, Quarter, Year, CDate)
		Values (@Date_SK, @Day, @Month, @Quarter, @Year, @CDate);

		Set @Counter = @Counter + 1;
	End
End
