CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguage] (@UserId nvarchar(450), @ClassificationLevelLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationLevelLanguages.ClassificationLevelLanguageID
	, ClassificationLevelLanguages.LanguageID
	, ClassificationLevelLanguages.Name
	, ClassificationLevelLanguages.Description
	, ClassificationLevelLanguages.MenuName
	, ClassificationLevelLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationLevelLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationLevelLanguages.ModifiedDate
FROM ClassificationLevels
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
WHERE ClassificationLevelLanguages.ClassificationLevelLanguageId = @ClassificationLevelLanguageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)




