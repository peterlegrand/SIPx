CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguageIndex] (@UserId nvarchar(450), @ClassificationLevelId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationLevelLanguages.ClassificationLevelLanguageID
	, ClassificationLevelLanguages.ClassificationLevelID
	, ClassificationLevelLanguages.ClassificationID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ClassificationLevelLanguages.LanguageID
	, ClassificationLevelLanguages.Name
	, ClassificationLevelLanguages.Description
	, ClassificationLevelLanguages.MenuName
	, ClassificationLevelLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationLevelLanguages.CreatedDate
	, ClassificationLevelLanguages.CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationLevelLanguages.ModifiedDate
	, ClassificationLevelLanguages.ModifierID
FROM ClassificationLevels
JOIN Classifications
	ON ClassificationLevels.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN ClassificationLevelLanguages
	ON ClassificationLevels.ClassificationLevelId = ClassificationLevelLanguages.ClassificationLevelID
JOIN Languages 
	ON Languages.LanguageId = ClassificationLevelLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLevelLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLevelLanguages.ModifierID
WHERE ClassificationLevels.ClassificationLevelId = @ClassificationLevelID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)


