CREATE PROCEDURE [dbo].[usp_ProjectTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectTypes.ProjectTypeID
	, ISNULL(UserLanguage.ProjectTypeLanguageID,ISNULL(DefaultLanguage.ProjectTypeLanguageID,0)) ProjectTypeLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectType')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this ProjectType')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this ProjectType')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this ProjectType')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ProjectTypes.CreatorID
	, ProjectTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ProjectTypes.ModifierID
	, ProjectTypes.ModifiedDate
FROM ProjectTypes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver, ProjectTypeLanguageID FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectTypeID= ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver, ProjectTypeLanguageID FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
JOIN Persons Creator
	ON Creator.UserId = ProjectTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectTypes.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectType')) 


