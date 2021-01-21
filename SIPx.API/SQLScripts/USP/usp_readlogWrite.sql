CREATE PROCEDURE usp_readlogWrite (
	@ControllerName varchar(50)
	, @ActionName varchar(50)
	, @IsIntRecordId bit
	, @stringRecordId nvarchar(450)
	, @IntRecordId int
	, @UserId nvarchar(450))
AS
BEGIN

DECLARE @InsertStatement nvarchar(max);

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

	DECLARE @statement nvarchar(max);
	DECLARE @ParmDefinition nvarchar(500);
	DECLARE @MVCUISCreenId int; 
	DECLARE @LanguageRecordId int; 
	DECLARE @LanguageTableId int; 
	DECLARE @ReadLogTableName varchar(100);
	
	SELECT @ReadLogTableName = Tablename FROM DataDictionaryTables JOIN ScreenTables ON DataDictionaryTables.TableId = ScreenTables.TableID JOIN MVCUIScreens ON MVCUIScreens.MVCUIScreenID = ScreenTables.MVCUIScreenID
		WHERE DataDictionaryTables.IsReadLog = 1 AND ScreenTables.IsMainTable = 1
	SELECT @MVCUISCreenId = MVCUISCreenId FROM MVCUIScreens WHERE Controller = @ControllerName and [Action] = @ActionName;

	DECLARE Statement_cursor CURSOR  
    FOR SELECT 
	CASE WHEN IsLanguageTable = 1 AND @IsIntRecordId = 1 THEN 'SELECT @LanguageRecordIdOUT = ' + MainColumn.ColumnName +', @LanguageTableIdOUT = ' + CAST(MainTable.TableId AS VARCHAR(10)) + ' FROM ' + MainTable.TableName + ' WHERE ' + BaseTable.ColumnName + ' = ' + CAST(@IntRecordId AS VARCHAR(10)) + ' AND LanguageID = ' + CAST(@LanguageId AS VARCHAR(10)) 
	WHEN IsLanguageTable = 1 AND @IsIntRecordId = 0 THEN 'SELECT ' + MainColumn.ColumnName +' FROM ' + MainTable.TableName + ' WHERE ' + BaseTable.ColumnName + ' = ''' + @stringRecordId + ''' AND LanguageID = ' + CAST(@LanguageId AS VARCHAR(10)) 
	WHEN IsLanguageTable = 0 AND @IsIntRecordId = 1 THEN 'SELECT @LanguageRecordIdOUT = '''+ CAST(@IntRecordId as varchar(10)) + ''' ,@LanguageTableIdOUT =  ' + CAST(MainTable.TableId AS VARCHAR(10)) 
	ELSE 'SELECT @LanguageRecordIdOUT = '+ @stringRecordId +',@LanguageTableIdOUT =  ' + CAST(MainTable.TableId AS VARCHAR(10)) END AS ScriptForId 
FROM ScreenTables 
JOIN MVCUIScreens 
	ON ScreenTables.MVCUIScreenID = MVCUIScreens.MVCUIScreenID 
JOIN DataDictionaryTables MainTable
	ON MainTable.TableId = ScreenTables.TableID
JOIN DataDictionaryColumns MainColumn	
	ON MainColumn.TableId = MainTable.TableId
LEFT JOIN (SELECT DataDictionaryTables.TableId, DataDictionaryColumns.ColumnName FROM DataDictionaryTables 
		JOIN DataDictionaryColumns 
			ON DataDictionaryColumns.TableId = DataDictionaryTables.TableId
		WHERE DataDictionaryColumns.IsIdentity = 1) BaseTable
	ON MainTable.ParentTableId = BaseTable.TableID
WHERE Controller = @ControllerName 
	AND Action = @ActionName
	AND MainTable.IsChangeLog = 0
	AND MainTable.IsReadLog = 0
	AND MainColumn.IsIdentity = 1;
OPEN Statement_cursor 
FETCH NEXT FROM Statement_cursor INTO @statement;  

WHILE @@FETCH_STATUS = 0  
BEGIN 
	SET @ParmDefinition = N'@LanguageRecordIdOUT int OUTPUT, @LanguageTableIdOUT int OUTPUT';
	EXECUTE sp_executesql @statement, @ParmDefinition, @LanguageRecordIdOUT=@LanguageRecordId OUTPUT, @LanguageTableIdOUT=@LanguageTableId OUTPUT;	
SET @InsertStatement = 'INSERT INTO ' + TRIM(@ReadLogTableName) + ' (RecordId, UserId, ReadLogDate, MVCUIScreenID, TableId) VALUES (' + CAST(@LanguageRecordId as varchar(10)) + ' , '''+ @UserId + ''', ''' + TRIM(CONVERT(VARCHAR(30), getdate(), 21)) +''', ' + CAST(@MVCUISCreenId as varchar(10)) + ', ' + cast(@LanguageTableId as varchar(10))+ ');';
	EXECUTE(@InsertStatement)
FETCH NEXT FROM Statement_cursor INTO @statement;
END

CLOSE Statement_cursor  
DEALLOCATE Statement_cursor 
end