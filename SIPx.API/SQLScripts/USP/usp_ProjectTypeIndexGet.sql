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
	, ObjectTypeStatusId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectType')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this ProjectType')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this ProjectType')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this ProjectType')) MouseOver
	, Color
	, ISNULL(UINameCustom.Customization,UIName.Name) IconName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
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
JOIN Icons
	ON Icons.IconId = ProjectTypes.IconID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Icons.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Icons.NameTermID
WHERE UIName.LanguageId = @LanguageID 
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectType')) 