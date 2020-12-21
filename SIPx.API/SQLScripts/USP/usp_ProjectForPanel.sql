CREATE PROCEDURE usp_ProjectForPanel (
	@UserId nvarchar(450)
	, @ProjectConditionSQLFrom nvarchar(max)
	, @ProjectConditionSQLWhere nvarchar(max)
	, @ProjectConditionSQLContains nvarchar(max)) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @statement NVARCHAR(MAX);

SET @statement =              ' DECLARE @LanguageId int; ' +
                ' SELECT @LanguageId = IntPreference ' +
                ' FROM UserPreferences ' +
                ' WHERE USerId = '' + CurrentUser.Id + '' ' +
                ' AND UserPreferences.PreferenceTypeId = 1; ' +
                ' SELECT ' +
                '  Projects.ProjectID ' +
                '  , Projects.ProjectTypeID ' +
                '  , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, ''No name for this Project'')) Name ' +
                '  , ISNULL(UserLanguage.Description, ISNULL(DefaultLanguage.Description, ''No description for this Project'')) Description ' +
                '  , ISNULL(UserLanguage.MenuName, ISNULL(DefaultLanguage.MenuName, ''No menu name for this Project'')) MenuName ' +
                '  , ISNULL(UserLanguage.MouseOver, ISNULL(DefaultLanguage.MouseOver, ''No mouse over for this Project'')) MouseOver ' +
                '  , ISNULL(UserTypeLanguage.Name, ISNULL(DefaultTypeLanguage.Name, ''No name for this Project type'')) ProjectTypeName ' +
                '  , ISNULL(UserStatusName.Customization, StatusName.Name) StatusName ' +
                '  , Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
                '  , Creator.PersonID CreatorID ' +
                '  , Projects.CreatedDate ' +
                '  , Modifier.FirstName + '' '' + Modifier.LastName ModifierName ' +
                '  , Modifier.PersonId ModifierID ' +
                '  , Projects.ModifiedDate ' +
                '  , CONCAT(''controlID'', Projects.ProjectId) ControlId ' +
                ' FROM Projects JOIN Statuses ' +
                '  ON Statuses.StatusId = Projects.StatusID ' +
                ' JOIN ProjectTypes ' +
                '  ON Projects.ProjectTypeId = ProjectTypes.ProjectTypeID ' +
                ' LEFT JOIN(SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserLanguage ' +
                '  ON UserLanguage.ProjectID = Projects.ProjectID ' +
                ' LEFT JOIN(SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage ' +
                '  ON DefaultLanguage.ProjectId = Projects.ProjectID ' +
                ' LEFT JOIN(SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage ' +
                '  ON UserTypeLanguage.ProjectTypeID = Projects.ProjectTypeID ' +
                'LEFT JOIN(SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage ' +
                ' ON DefaultTypeLanguage.ProjectTypeID = Projects.ProjectTypeID ' +
                ' JOIN UITermLanguages StatusName ' +
                ' ON Statuses.NameTermId = StatusName.UITermId ' +
                ' LEFT JOIN(SELECT* FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName ' +
                '  ON Statuses.NameTermId = UserStatusName.UITermId' +
                ' JOIN Persons Creator ' +
                '  ON Creator.UserId = Projects.CreatorID ' +
                ' JOIN Persons Modifier ' +
                '  ON Modifier.UserId = Projects.ModifierID '+
--' JOIN ProjectTemplateLanguages ON ProjectTemplates.ProjectTemplateID = ProjectTemplateLanguages.ProjectTemplateID ' +
TRIM(@ProjectConditionSQLFrom) +
TRIM(@ProjectConditionSQLWhere) --+
--' AND ProjectTemplateLanguages.LanguageId = ' + cast (@LanguageId as varchar(2))

EXECUTE sp_executesql @statement

