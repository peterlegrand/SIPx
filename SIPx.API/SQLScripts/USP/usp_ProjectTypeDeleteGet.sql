CREATE PROCEDURE [dbo].[usp_ProjectTypeDeleteGet] (@UserId nvarchar(450), @ProjectTypeID int) 
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
	, ISNULL(UserLanguage.ProjectTypeLanguageID,ISNULL(DefaultLanguage.ProjectTypeLanguageID,0)) ProjectTypeLanguageID
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectType')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this ProjectType')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this ProjectType')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this ProjectType')) MouseOver
	, ISNULL(CustomObjectTypeStatus.Customization,DefaultObjectTypeStatus.Name) ObjectTypeStatusName
	, Color
	, ISNULL(UINameCustom.Customization,UIName.Name) IconName
	, HasAnyChildProject
	, HasAnyMatrixProject
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectTypes.ModifiedDate
FROM ProjectTypes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver, ProjectTypeLanguageID FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectTypeID= ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver, ProjectTypeLanguageID FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
JOIN ObjectTypeStatuses
	ON ObjectTypeStatuses.ObjectTypeStatusID = ProjectTypes.ObjectTypeStatusID
JOIN UITermLanguages DefaultObjectTypeStatus
	ON DefaultObjectTypeStatus.UITermId = ObjectTypeStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomObjectTypeStatus
	ON CustomObjectTypeStatus.UITermId = ObjectTypeStatuses.NameTermID
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
	AND ProjectTypes.ProjectTypeID = @ProjectTypeID
	AND DefaultObjectTypeStatus.LanguageId = @LanguageID


