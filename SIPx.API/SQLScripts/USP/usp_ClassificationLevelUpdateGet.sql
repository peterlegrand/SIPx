CREATE PROCEDURE [dbo].[usp_ClassificationLevelUpdateGet] (@UserId nvarchar(450), @ClassificationLevelId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevels.ClassificationLevelID
	, ClassificationLevels.ClassificationID
	, ISNULL(UserClassificationLevelLanguage.ClassificationLevelLanguageId,ISNULL(DefaultClassificationLevelLanguage.ClassificationLevelLanguageId,0)) ClassificationLevelLanguageId
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationLevelLanguage.Description,ISNULL(DefaultClassificationLevelLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName,ISNULL(DefaultClassificationLevelLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver,ISNULL(DefaultClassificationLevelLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ClassificationLevels.DateLevelID
	, ClassificationLevels.Sequence
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, ClassificationLevels.CanLink
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationLevels.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationLevels.ModifiedDate
	, Modifier.PersonID ModifierID
FROM ClassificationLevels 
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver, ClassificationLevelLanguageId FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver, ClassificationLevelLanguageId FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLevels.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLevels.ModifierID
WHERE ClassificationLevels.ClassificationLevelId = @ClassificationLevelID
	
ORDER BY ClassificationLevels.Sequence
