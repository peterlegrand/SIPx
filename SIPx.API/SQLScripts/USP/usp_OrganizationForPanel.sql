CREATE PROCEDURE usp_OrganizationForPanel (
	@UserId nvarchar(450)
	, @OrganizationConditionSQLFrom nvarchar(max)
	, @OrganizationConditionSQLWhere nvarchar(max)
	, @OrganizationConditionSQLContains nvarchar(max)) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @statement NVARCHAR(MAX);

SET @statement = ' DECLARE @LanguageId int; ' +
                ' SELECT @LanguageId = IntPreference ' +
                ' FROM UserPreferences ' +
                ' WHERE USerId = ''' + TRIM(@UserId) + '''' +
                ' AND UserPreferences.PreferenceTypeId = 1; ' + 
                 ' SELECT '  +
                '  Organizations.OrganizationID ' +
                '  , Organizations.OrganizationTypeID ' +
                '  , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, ''No name for this organization'')) Name ' +
                '  , ISNULL(UserLanguage.Description, ISNULL(DefaultLanguage.Description, ''No description for this organization'')) Description ' +
                '  , ISNULL(UserLanguage.MenuName, ISNULL(DefaultLanguage.MenuName, ''No menu name for this organization'')) MenuName ' +
                '  , ISNULL(UserLanguage.MouseOver, ISNULL(DefaultLanguage.MouseOver, ''No mouse over for this organization'')) MouseOver ' +
                '  , ISNULL(UserTypeLanguage.Name, ISNULL(DefaultTypeLanguage.Name, ''No name for this organization type'')) OrganizationTypeName ' +
                '  , ISNULL(UserStatusName.Customization, StatusName.Name) StatusName ' +
                '  , OrganizationTypes.Internal ' +
                '  , OrganizationTypes.LegalEntity ' +
                '  , Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
                '  , Creator.PersonID CreatorID ' +
                '  , Organizations.CreatedDate ' +
                '  , Modifier.FirstName + '' '' + Modifier.LastName ModifierName ' +
                '  , Modifier.PersonId ModifierID ' +
                '  , Organizations.ModifiedDate ' +
                '  , CONCAT(''CcontrolID'', Organizations.OrganizationId) ControlId ' +
                ' FROM Organizations JOIN Statuses ' +
                '  ON Statuses.StatusId = Organizations.StatusID ' +
                ' JOIN OrganizationTypes ' +
                '  ON Organizations.OrganizationTypeId = OrganizationTypes.OrganizationTypeID ' +
                ' LEFT JOIN(SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage ' +
                '  ON UserLanguage.OrganizationID = Organizations.OrganizationID ' +
                ' LEFT JOIN(SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage ' +
                '  ON DefaultLanguage.OrganizationId = Organizations.OrganizationID ' +
                ' LEFT JOIN(SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage ' +
                '  ON UserTypeLanguage.OrganizationTypeID = Organizations.OrganizationTypeID ' +
                'LEFT JOIN(SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage ' +
                ' ON DefaultTypeLanguage.OrganizationTypeID = Organizations.OrganizationTypeID ' +
                ' JOIN UITermLanguages StatusName ' +
                ' ON Statuses.NameTermId = StatusName.UITermId ' +
                ' LEFT JOIN(SELECT* FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName ' +
                '  ON Statuses.NameTermId = UserStatusName.UITermId' +
                ' JOIN Persons Creator ' +
                '  ON Creator.UserId = Organizations.CreatorID ' +
                ' JOIN Persons Modifier ' +
                '  ON Modifier.UserId = Organizations.ModifierID ' +
--' JOIN OrganizationTemplateLanguages ON OrganizationTemplates.OrganizationTemplateID = OrganizationTemplateLanguages.OrganizationTemplateID ' +
TRIM(@OrganizationConditionSQLFrom) +
TRIM(@OrganizationConditionSQLWhere) --+
--' AND OrganizationTemplateLanguages.LanguageId = ' + cast (@LanguageId as varchar(2))

EXECUTE sp_executesql @statement

