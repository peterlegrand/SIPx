CREATE PROCEDURE usp_ClassificationValueForPanel (
	@UserId nvarchar(450)
	, @ClassificationValueConditionSQLFrom nvarchar(max)
	, @ClassificationValueConditionSQLWhere nvarchar(max)
	, @ClassificationValueConditionSQLContains nvarchar(max)) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @statement NVARCHAR(MAX);

SET @statement =       ' DECLARE @LanguageId int; ' +
            ' SELECT @LanguageId = IntPreference ' +
            ' FROM UserPreferences ' +
            ' WHERE USerId = '' + CurrentUser.Id + '' ' +
            '  AND UserPreferences.PreferenceTypeId = 1; ' +
            ' SELECT ClassificationValues.ClassificationValueID ' +
            '  , ClassificationValues.ClassificationID ' +
            '  , ISNULL(UserClassificationValueLanguage.Name, ISNULL(DefaultClassificationValueLanguage.Name, ''No name for this value'')) Name ' +
            '  , ISNULL(UserClassificationValueLanguage.Description, ISNULL(DefaultClassificationValueLanguage.Description, ''No description for this value'')) Description ' +
            '  , ISNULL(UserClassificationValueLanguage.MenuName, ISNULL(DefaultClassificationValueLanguage.MenuName, ''No menu name for this value'')) MenuName ' +
            '  , ISNULL(UserClassificationValueLanguage.MouseOver, ISNULL(DefaultClassificationValueLanguage.MouseOver, ''No drop Mouse over for this value'')) MouseOver ' +
            '  , ISNULL(UserClassificationValueLanguage.DropDownName, ISNULL(DefaultClassificationValueLanguage.DropDownName, ''No drop down name for this value'')) DropDownName ' +
            '  , ClassificationValues.ParentValueID ' +
            '  , ISNULL(UserParentLanguage.Name, ISNULL(DefaultParentLanguage.Name, ''No parent name for this value'')) ParentName ' +
            '  , ClassificationValues.DateFrom ' +
            '  , ClassificationValues.DateTo ' +
            '  , Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
            '  , Creator.PersonID CreatorID ' +
            '  , ClassificationValues.CreatedDate ' +
            '  , Modifier.FirstName + '' '' + Modifier.LastName ModifierName ' +
            '  , Modifier.PersonID ModifierID ' +
            '  , ClassificationValues.ModifiedDate ' +
            '  , CONCAT(''controlID'', Projects.ProjectId) ControlId ' +
            ' FROM ClassificationValues ' +
            ' LEFT JOIN(SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage ' +
            '  ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID ' +
            ' LEFT JOIN(SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage ' +
            '  ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID ' +
            ' LEFT JOIN(SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserParentLanguage ' +
            ' ON UserParentLanguage.ClassificationValueId = ClassificationValues.ParentValueID ' +
            ' LEFT JOIN(SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentLanguage ' +
            ' ON DefaultParentLanguage.ClassificationValueId = ClassificationValues.ParentValueID ' +
            ' LEFT JOIN(SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage ' +
            ' ON UserClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID ' +
            ' LEFT JOIN(SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage ' +
            ' ON DefaultClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID ' +
            ' JOIN Persons Creator ' +
            ' ON Creator.UserId = ClassificationValues.CreatorID ' +
            ' JOIN Persons Modifier ' +
            ' ON Modifier.UserId = ClassificationValues.ModifierID '+
--' JOIN ClassificationValueTemplateLanguages ON ClassificationValueTemplates.ClassificationValueTemplateID = ClassificationValueTemplateLanguages.ClassificationValueTemplateID ' +
TRIM(@ClassificationValueConditionSQLFrom) +
TRIM(@ClassificationValueConditionSQLWhere) --+
--' AND ClassificationValueTemplateLanguages.LanguageId = ' + cast (@LanguageId as varchar(2))

EXECUTE sp_executesql @statement

