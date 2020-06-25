CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguage] (@UserID nvarchar(450), @ClassificationLevelLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON ClassificationLevels.ClassificationLevelID = ClassificationLevelLanguages.ClassificationLevelID
JOIN Languages 
	ON Languages.LanguageID = ClassificationLevelLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationLevelLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationLevelLanguages.ModifierID
WHERE ClassificationLevelLanguages.ClassificationLevelLanguageID = @ClassificationLevelLanguageID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)




