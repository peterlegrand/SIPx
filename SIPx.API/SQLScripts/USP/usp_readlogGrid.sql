alter PROCEDURE usp_readlogGrid (
	@ControllerName varchar(50)
	, @ActionName varchar(50)
	, @IsIntRecordId bit
	, @stringRecordId nvarchar(450)
	, @IntRecordId int)
AS
BEGIN
DECLARE @StatementFrom nvarchar(max);
DECLARE @StatementWhere nvarchar(max);
DECLARE @Statement nvarchar(max);
SET @Statement = 'select ReadLog'+
	trim(@ControllerName)+'CUD.ReadLogId, AspNetUsers.UserName, ReadLog'+
	TRIM(@ControllerName)+'CUD.ReadLogDate, Persons.PersonId FROM ReadLog'+TRIM(@ControllerName)+'CUD ' +
	'  ' +
	' JOIN MVCUIScreens ON ReadLog'+TRIM(@ControllerName)+
	'CUD.ScreenId = MVCUIScreens.MVCUIScreenID JOIN AspNetUsers ON AspNetUsers.Id = ReadLog'+
	TRIM(@ControllerName)+'CUD.UserId ' +
	' JOIN Persons ON Persons.UserId = AspNetUsers.Id ' +
' WHERE MVCUIScreens.Controller = '''+TRIM(@ControllerName)+''' AND MVCUIScreens.Action ='''+TRIM(@ControllerName)+''' ' 
IF @IsIntRecordId = 1
BEGIN
SET @Statement = @Statement + 'AND  ReadLog'+  trim(@ControllerName)+'CUD.RecordId = ' + CAST(@IntRecordId as varchar(10)) +' '
END
ELSE
BEGIN
SET @Statement = @Statement + 'AND  ReadLog'+  trim(@ControllerName)+'CUD.RecordId = ''' + @stringRecordId +''' '
END
SET @Statement = @Statement + ' ORDER BY ReadLog'+TRIM(@ControllerName)+'CUD.ReadLogDate '

select @statement
--EXECUTE sp_executesql @statement
end

