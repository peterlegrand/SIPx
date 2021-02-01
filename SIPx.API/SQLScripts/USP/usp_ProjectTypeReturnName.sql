CREATE PROCEDURE usp_ProjectTypeReturnName (@UserId nvarchar(450), @ProjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT  ISNULL(UserProjectTypeLanguage.Name,ISNULL(DefaultProjectTypeLanguage.Name,'No name for this role')) Name
FROM ProjectTypes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserProjectTypeLanguage
	ON UserProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectTypeLanguage
	ON DefaultProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
WHERE ProjectTypes.ProjectTypeId = @ProjectTypeID
