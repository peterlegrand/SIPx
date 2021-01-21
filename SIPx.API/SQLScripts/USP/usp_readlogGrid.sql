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
BEGIN  
IF @Statement =''
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

END
ELSE
BEGIN
SET @Statement =@Statement + ' UNION ALL SELECT '+TRIM(@ReadLogTableName)+'.ReadLogID, '+TRIM(@ReadLogTableName)+'.UserId, AspNetUsers.UserName, Persons.PersonId, '+TRIM(@ReadLogTableName)+'.ReadLogDate, '+
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

END

FETCH NEXT FROM ReadLogTable_Cursor INTO @ReadLogTableName
END 

CLOSE ReadLogTable_Cursor
DEALLOCATE ReadLogTable_Cursor

--SELECT @Statement
EXECUTE sp_executesql @statement



--	JOIN UITermLanguages DefaultTableName
--	ON DefaultTableName.UITermId = DataDictionaryTables.NameTermID
--LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomTableName
--	ON CustomTableName.UITermId = DataDictionaryTables.NameTermID

	--AND DefaultTableName.LanguageId = @LanguageID
