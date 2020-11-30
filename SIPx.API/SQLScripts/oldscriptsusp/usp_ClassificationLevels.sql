CREATE PROCEDURE [dbo].[usp_ClassificationLevels] (@UserId nvarchar(450), @ClassificationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevels.ClassificationLevelID
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationLevelLanguage.Description,ISNULL(DefaultClassificationLevelLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName,ISNULL(DefaultClassificationLevelLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver,ISNULL(DefaultClassificationLevelLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UIDateLevelNameCustom.Customization,UIDateLevelName.Name) DateLevelName
	, ClassificationLevels.Sequence
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationLevels.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationLevels.ModifiedDate
FROM ClassificationLevels 
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
JOIN DateLevels 
	ON DateLevels.DateLevelId = ClassificationLevels.DateLevelID
JOIN UITermLanguages UIDateLevelName
	ON UIDateLevelName.UITermId = DateLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDateLevelNameCustom
	ON UIDateLevelNameCustom.UITermId = DateLevels.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLevels.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLevels.ModifierID
WHERE ClassificationLevels.ClassificationId = @ClassificationID
	AND UIDateLevelName.LanguageId = @LanguageID
ORDER BY ClassificationLevels.Sequence
