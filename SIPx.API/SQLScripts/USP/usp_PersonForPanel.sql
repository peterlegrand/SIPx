CREATE PROCEDURE usp_PersonForPanel (
	@UserId nvarchar(450)
	, @PersonConditionSQLFrom nvarchar(max)
	, @PersonConditionSQLWhere nvarchar(max)
	, @PersonConditionSQLContains nvarchar(max)) 
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
                ' WHERE USerId = '' + CurrentUser.Id + '' ' +
                ' AND UserPreferences.PreferenceTypeId = 1; ' +
                ' SELECT ISNULL(Salutation, '') Salutation ' +
                '  , ISNULL(FirstName, '')FirstName ' +
                '  , ISNULL(MiddleName, '') MiddleName ' +
                '  , ISNULL(LastName, '') LastName ' +
                '  , ISNULL(NickName, '') NickName ' +
                '  , ISNULL(FirstNameLocal, '') FirstNameLocal ' +
                '  , ISNULL(MiddleNameLocal, '') MiddleNameLocal ' +
                '  , ISNULL(LastNameLocal, '') LastNameLocal ' +
                '  , CASE WHEN UserID IS NULL THEN 1 ELSE 0 END AS IsUser ' +
                '  , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, ''No name for the organization'')) DefaultOrganizationName ' +
                '  , Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
                '  , Creator.PersonID CreatorID ' +
                '  , Persons.CreatedDate ' +
                '  , Modifier.FirstName + '' '' + Modifier.LastName ModifierName ' +
                '  , Modifier.PersonId ModifierID ' +
                '  , Persons.ModifiedDate ' +
                '  , CONCAT(''controlID'', Persons.PersonId) ControlId ' +
                ' FROM  Persons ' +
                ' LEFT JOIN(SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage ' +
                '  ON UserLanguage.OrganizationID = Persons.DefaultOrganizationID ' +
                ' LEFT JOIN(SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage ' +
                '  ON DefaultLanguage.OrganizationId = Persons.DefaultOrganizationID ' +
                ' JOIN Persons Creator ' +
                '  ON Creator.UserId = Persons.CreatorID ' +
                ' JOIN Persons Modifier ' +
                '  ON Modifier.UserId = Persons.ModifierID '
 +
--' JOIN PersonTemplateLanguages ON PersonTemplates.PersonTemplateID = PersonTemplateLanguages.PersonTemplateID ' +
TRIM(@PersonConditionSQLFrom) +
TRIM(@PersonConditionSQLWhere) --+
--' AND PersonTemplateLanguages.LanguageId = ' + cast (@LanguageId as varchar(2))

EXECUTE sp_executesql @statement

