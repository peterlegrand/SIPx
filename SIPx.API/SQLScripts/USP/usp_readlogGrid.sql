CREATE PROCEDURE usp_readlogGrid (
	@ControllerName varchar(50)
	, @ActionName varchar(50)
	, @IsIntRecordId bit
	, @stringRecordId nvarchar(450)
	, @IntRecordId int)
AS
BEGIN
DECLARE @Statement nvarchar(max);
IF (@IsIntRecordId = 1 AND @IntRecordId <> 0) OR (@IsIntRecordId = 0)
BEGIN
SET @Statement = 'select ReadLog'+
	trim(@ControllerName)+'CUD.ReadLogId, AspNetUsers.UserName, ReadLog'+
	TRIM(@ControllerName)+'CUD.ReadLogDate FROM ReadLog'+TRIM(@ControllerName)+'CUD ' +
	' JOIN MVCUIScreens ON ReadLog'+TRIM(@ControllerName)+
	'CUD.MVCUIScreenID = MVCUIScreens.MVCUIScreenID JOIN AspNetUsers ON AspNetUsers.Id = ReadLog'+
	TRIM(@ControllerName)+'CUD.UserId ' +
' WHERE MVCUIScreens.Controller = '''+TRIM(@ControllerName)+''' AND MVCUIScreens.Action = '''+TRIM(@ActionName)+ ''' ' 
IF @IsIntRecordId = 1
BEGIN
SET @Statement = @Statement + 'AND  ReadLog'+  trim(@ControllerName)+'CUD.RecordId = ' + CAST(@IntRecordId as varchar(10)) +' '
END
ELSE
BEGIN
SET @Statement = @Statement + 'AND  ReadLog'+  trim(@ControllerName)+'CUD.RecordId = ''' + @stringRecordId +''' '
END
SET @Statement = @Statement + ' ORDER BY ReadLog'+TRIM(@ControllerName)+'CUD.ReadLogDate '
END
--Index views etc. No id
ELSE
BEGIN
SET @Statement = 'select ReadLog'+
	trim(@ControllerName)+'List.ReadLogId, AspNetUsers.UserName, ReadLog'+
	TRIM(@ControllerName)+'List.ReadLogDate FROM ReadLog'+TRIM(@ControllerName)+'List ' +
	' JOIN MVCUIScreens ON ReadLog'+TRIM(@ControllerName)+
	'List.MVCUIScreenID = MVCUIScreens.MVCUIScreenID JOIN AspNetUsers ON AspNetUsers.Id = ReadLog'+
	TRIM(@ControllerName)+'List.UserId ' +
' WHERE MVCUIScreens.Controller = '''+TRIM(@ControllerName)+''' AND MVCUIScreens.Action = '''+TRIM(@ActionName)+ ''' ' 
END
select @statement
--EXECUTE sp_executesql @statement
end

