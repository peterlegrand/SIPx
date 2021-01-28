CREATE PROCEDURE [dbo].[usp_ProjectTypeUpdateGet] (@UserId nvarchar(450), @ProjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectTypes.ProjectTypeID
	, ProjectTypes.CodePrefix
	, ProjectTypes.CodeSuffix
	, ProjectTypes.CodeTypeId
	, ISNULL(UserProjectTypeLanguage.Name,ISNULL(DefaultProjectTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProjectTypeLanguage.Description,ISNULL(DefaultProjectTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProjectTypeLanguage.MenuName,ISNULL(DefaultProjectTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProjectTypeLanguage.MouseOver,ISNULL(DefaultProjectTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, IconID
	, Color
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectTypes.ModifiedDate
FROM ProjectTypes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserProjectTypeLanguage
	ON UserProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectTypeLanguage
	ON DefaultProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
JOIN Persons Creator
	ON Creator.UserId = ProjectTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectTypes.ModifierID
WHERE ProjectTypes.ProjectTypeId = @ProjectTypeID
