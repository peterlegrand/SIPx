CREATE PROCEDURE [dbo].[usp_ClassificationLevelIndex] (@UserId nvarchar(450), @ClassificationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevels.ClassificationLevelID
	, ISNULL(UserClassificationLevelLanguage.ClassificationLevelLanguageID,ISNULL(DefaultClassificationLevelLanguage.ClassificationLevelLanguageID,0)) ClassificationLevelLanguageID
	, ClassificationLevels.ClassificationID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this classification level')) Name
	, ISNULL(UserClassificationLevelLanguage.Description,ISNULL(DefaultClassificationLevelLanguage.Description,'No description for this classification level')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName,ISNULL(DefaultClassificationLevelLanguage.MenuName,'No menu name for this classification level')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver,ISNULL(DefaultClassificationLevelLanguage.MouseOver,'No mouse over for this classification level')) MouseOver
	, ISNULL(UIDateLevelNameCustom.Customization,UIDateLevelName.Name) DateLevelName
	, ClassificationLevels.Sequence
	, @LanguageId LanguageId
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ClassificationLevels.DateLevelID
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationLevels.CreatorID
	, ClassificationLevels.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationLevels.ModifierID
	, ClassificationLevels.ModifiedDate
FROM ClassificationLevels 
JOIN Classifications
	ON ClassificationLevels.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver, ClassificationLevelLanguageID FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver, ClassificationLevelLanguageID FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
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
	JOIN Languages 
	ON Languages.LanguageId = @LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
WHERE ClassificationLevels.ClassificationId = @ClassificationID
	AND UIDateLevelName.LanguageId = @LanguageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ClassificationLevels.Sequence
