CREATE PROCEDURE usp_ChangeLogGrid (
	@ControllerName varchar(50)
	, @ActionName varchar(50)
	, @IsIntRecordId bit
	, @stringRecordId nvarchar(450)
	, @IntRecordId int
	, @UserId nvarchar(450))
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @Statement nvarchar(max);
IF (@IsIntRecordId = 1 AND @IntRecordId <> 0) OR (@IsIntRecordId = 0)
BEGIN
SET @Statement = 'SELECT ' + 
	'  ChangeLogClassifications.ChangeLogId ' +
	'  , ChangeLogClassifications.ColumnId ' +
	'  , ISNULL(ColumnLanguageCustom.Customization,ColumnLanguage.Name) ColumnName ' +
	'  , ChangeLogClassifications.ChangeTypeId ' +
	'  , ISNULL(ChangeTypeLanguageCustom.Customization,ChangeTypeLanguage.Name) ChangeTypeName ' +
	'  , ChangeLogClassifications.OldValue ' +
	'  , ChangeLogClassifications.NewValue ' +
	'  , ChangeLogClassifications.UserId ' +
	'  , AspNetUsers.UserName ' +
	'  , Persons.PersonID ' +
	'  , ChangeLogClassifications.ChangeLogDate ' +
' FROM ChangeLogClassifications ' +
' JOIN DataDictionaryColumns  ' +
	' ON ChangeLogClassifications.ColumnId = DataDictionaryColumns.ColumnId ' +
' JOIN DataDictionaryTables ' +
'     ON DataDictionaryTables.TableId = DataDictionaryColumns.TableID ' + 
' JOIN ChangeTypes ' +
	' ON ChangeTypes.ChangeTypeID= ChangeLogClassifications.ChangeTypeId ' +
' JOIN AspNetUsers ' +
	' ON AspNetUsers.Id = ChangeLogClassifications.UserId ' +
' JOIN Persons ' +
	' ON ChangeLogClassifications.UserId = Persons.UserID ' +
' JOIN UITermLanguages ColumnLanguage ' +
	' ON ColumnLanguage.UITermID = DataDictionaryColumns.NameTermID ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) ColumnLanguageCustom ' +
	' ON ColumnLanguageCustom.UITermId = DataDictionaryColumns.NameTermID ' +
' JOIN UITermLanguages ChangeTypeLanguage ' +
	' ON ChangeTypeLanguage.UITermID = ChangeTypes.NameTermID ' +
' LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) ChangeTypeLanguageCustom ' +
	' ON ChangeTypeLanguageCustom.UITermId = ChangeTypes.NameTermID ' +
' WHERE ChangeTypeLanguage.LanguageId = @LanguageID ' +
	' AND ChangeLogClassifications.RecordId =@IntRecordId ' +
' ORDER BY ChangeLogClassifications.ChangeLogDate	'
END
--select @statement
EXECUTE sp_executesql @statement
end



