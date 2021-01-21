CREATE PROCEDURE [dbo].[usp_readlogGrid] (
	@ControllerName varchar(100)
	, @ActionName varchar(100)
	, @IsIntRecordId bit
	, @stringRecordId nvarchar(450)
	, @IntRecordId  int
	, @UserId nvarchar(450))
	
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

--SELECT ReadLogID, ColumnId, UserId, UserName, PersonId, ReadLogDate, ScreenName, TableName, ISNULL(CustomDateLevel.Customization,DefaultDateLevel.Name) DateLevelName

--FROM 

DECLARE @IsLogRecordGrid  bit;
SELECT @IsLogRecordGrid = IsLogRecordGrid FROM MVCUIScreens WHERE Controller = @ControllerName AND Action = @ActionName

DECLARE ReadLogTable_Cursor CURSOR FOR 
select DataDictionaryTables.TableName from MVCUIScreens 
JOIN ScreenTables 
	ON ScreenTables.MVCUIScreenID = MVCUIScreens.MVCUIScreenID
JOIN DataDictionaryTables
	ON DataDictionaryTables.TableId = ScreenTables.TableID

WHERE Controller = @ControllerName 
	AND Action = @ActionName
	AND DataDictionaryTables.IsReadLog = 1
DECLARE @Statement nvarchar(max);
SET @Statement =''
DECLARE @ReadLogTableName varchar(100);
OPEN ReadLogTable_Cursor
FETCH NEXT FROM ReadLogTable_Cursor INTO @ReadLogTableName

WHILE @@FETCH_STATUS = 0  
--BEGIN FETCH
BEGIN  

IF @IsLogRecordGrid = 1
--BEGIN RecordGrid
BEGIN

IF @Statement =''
--BEGIN FIRST STATEMENT
BEGIN
SET @Statement ='SELECT '+TRIM(@ReadLogTableName)+'.ReadLogID, '+TRIM(@ReadLogTableName)+'.UserId, AspNetUsers.UserName, Persons.PersonId, '+TRIM(@ReadLogTableName)+'.ReadLogDate, '+
'ISNULL(CustomScreen.Customization,DefaultScreen.Name) ScreenName,ISNULL(CustomTable.Customization,DefaultTable.Name) TableName '+
' FROM ' +
	@ReadLogTableName + 
	' JOIN AspNetUsers '+
		' ON '+TRIM(@ReadLogTableName)+'.UserId = AspNetUsers.Id '+
	'JOIN Persons '+
		' ON Persons.UserId = AspNetUsers.ID '+
	' JOIN datadictionarytables '+
	' ON '+TRIM(@ReadLogTableName)+'.TableId = datadictionarytables.TableId ' +

' JOIN UITermLanguages DefaultTable ' +
	' ON DefaultTable.UITermId = datadictionarytables.NameTermID ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = '+ CAST(@LanguageID as varchar(10)) +') CustomTable ' +
	' ON CustomTable.UITermId = datadictionarytables.NameTermID ' +

' JOIN MVCUIScreens ' +
' ON MVCUIScreens.MVCUIScreenID = '+TRIM(@ReadLogTableName)+'.MVCUIScreenID ' +
' JOIN UITermLanguages DefaultScreen ' +
' ON DefaultScreen.UITermId = MVCUIScreens.NameTermID ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = '+ CAST(@LanguageID as varchar(10)) +') CustomScreen ' +
'ON CustomScreen.UITermId = MVCUIScreens.NameTermID ' +
' WHERE DefaultScreen.LanguageId = '  + CAST(@LanguageID as varchar(10)) +
	' AND DefaultTable.LanguageId = '  + CAST(@LanguageID as varchar(10)) +
	' AND '+TRIM(@ReadLogTableName)+'.RecordId = '  + CAST(@IntRecordId as varchar(10))  

--END FIRST STATEMENT
END
ELSE
--BEGIN NEXT STATEMENT
BEGIN
--PETER TODO Now the record is filtered on the same record id. This should be on parent record id and languageid as it is the language table
SET @Statement =@Statement + ' UNION ALL; SELECT '+TRIM(@ReadLogTableName)+'.ReadLogID, '+TRIM(@ReadLogTableName)+'.UserId, AspNetUsers.UserName, Persons.PersonId, '+TRIM(@ReadLogTableName)+'.ReadLogDate, '+
'ISNULL(CustomScreen.Customization,DefaultScreen.Name) ScreenName,ISNULL(CustomTable.Customization,DefaultTable.Name) TableName '+
' FROM ' +
	@ReadLogTableName + 
	' JOIN AspNetUsers '+
		' ON '+TRIM(@ReadLogTableName)+'.UserId = AspNetUsers.Id '+
	'JOIN Persons '+
		' ON Persons.UserId = AspNetUsers.ID '+
	' JOIN datadictionarytables '+
	' ON '+TRIM(@ReadLogTableName)+'.TableId = datadictionarytables.TableId ' +

' JOIN UITermLanguages DefaultTable ' +
	' ON DefaultTable.UITermId = datadictionarytables.NameTermID ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = '+ CAST(@LanguageID as varchar(10)) +') CustomTable ' +
	' ON CustomTable.UITermId = datadictionarytables.NameTermID ' +

' JOIN MVCUIScreens ' +
' ON MVCUIScreens.MVCUIScreenID = '+TRIM(@ReadLogTableName)+'.MVCUIScreenID ' +
' JOIN UITermLanguages DefaultScreen ' +
' ON DefaultScreen.UITermId = MVCUIScreens.NameTermID ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = '+ CAST(@LanguageID as varchar(10)) +') CustomScreen ' +
'ON CustomScreen.UITermId = MVCUIScreens.NameTermID ' +
' WHERE DefaultScreen.LanguageId = '  + CAST(@LanguageID as varchar(10)) +
	' AND DefaultTable.LanguageId = '  + CAST(@LanguageID as varchar(10)) +
	' AND '+TRIM(@ReadLogTableName)+'.RecordId = '  + CAST(@IntRecordId as varchar(10))  
--END NEXT STATEMENT
END
--END RecordGrid
END
ELSE
--BEGIN NORecordGrid
BEGIN
IF @Statement =''
--BEGIN FIRST STATEMENT
BEGIN
SET @Statement =
' SELECT ' +
	' '+TRIM(@ReadLogTableName)+'.ReadLogID ' +
	' , '+TRIM(@ReadLogTableName)+'.UserId ' +
	' , AspNetUsers.UserName ' +
	' , Persons.PersonId ' +
	' , '+TRIM(@ReadLogTableName)+'.ReadLogDate ' +
	' , ISNULL(CustomScreen.Customization,DefaultScreen.Name) ScreenName,''No table'' TableName   ' +
' FROM '+TRIM(@ReadLogTableName)+'  ' +
' JOIN AspNetUsers   ' +
	' ON '+TRIM(@ReadLogTableName)+'.UserId = AspNetUsers.Id  ' +
' JOIN Persons   ' +
	' ON Persons.UserId = AspNetUsers.ID   ' +
' JOIN MVCUIScreens   ' +
	' ON MVCUIScreens.MVCUIScreenID = '+TRIM(@ReadLogTableName)+'.MVCUIScreenID   ' +
' JOIN UITermLanguages DefaultScreen   ' +
	' ON DefaultScreen.UITermId = MVCUIScreens.NameTermID   ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = 41) CustomScreen  ' +
	' ON CustomScreen.UITermId = MVCUIScreens.NameTermID   ' +
' WHERE DefaultScreen.LanguageId = 41  ' 

END
ELSE
BEGIN
SET @Statement =
' UNION ALL; SELECT ' +
	' '+TRIM(@ReadLogTableName)+'.ReadLogID ' +
	' , '+TRIM(@ReadLogTableName)+'.UserId ' +
	' , AspNetUsers.UserName ' +
	' , Persons.PersonId ' +
	' , '+TRIM(@ReadLogTableName)+'.ReadLogDate ' +
	' , ISNULL(CustomScreen.Customization,DefaultScreen.Name) ScreenName,''No table'' TableName   ' +
' FROM '+TRIM(@ReadLogTableName)+'  ' +
' JOIN AspNetUsers   ' +
	' ON '+TRIM(@ReadLogTableName)+'.UserId = AspNetUsers.Id  ' +
' JOIN Persons   ' +
	' ON Persons.UserId = AspNetUsers.ID   ' +
' JOIN MVCUIScreens   ' +
	' ON MVCUIScreens.MVCUIScreenID = '+TRIM(@ReadLogTableName)+'.MVCUIScreenID   ' +
' JOIN UITermLanguages DefaultScreen   ' +
	' ON DefaultScreen.UITermId = MVCUIScreens.NameTermID   ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = 41) CustomScreen  ' +
	' ON CustomScreen.UITermId = MVCUIScreens.NameTermID   ' +
' WHERE DefaultScreen.LanguageId = 41  ' 

END
END
FETCH NEXT FROM ReadLogTable_Cursor INTO @ReadLogTableName
END 

CLOSE ReadLogTable_Cursor
DEALLOCATE ReadLogTable_Cursor

--SELECT @Statement
EXECUTE sp_executesql @statement
