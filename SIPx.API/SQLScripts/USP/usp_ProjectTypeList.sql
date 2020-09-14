CREATE PROCEDURE [dbo].[usp_ProjectTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectTypes.ProjectTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Project type')) Name
FROM ProjectTypes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectTypeID= ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Project type')) 
