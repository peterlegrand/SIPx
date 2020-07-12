CREATE PROCEDURE [dbo].[usp_ClassificationPageLanguageIndexGet] (@UserId nvarchar(450), @ClassificationPageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationPageLanguages.ClassificationPageLanguageID
	, ClassificationPageLanguages.ClassificationID
	, ClassificationPageLanguages.ClassificationPageID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ClassificationPageLanguages.LanguageID
	, ClassificationPageLanguages.Name
	, ClassificationPageLanguages.Description
	, ClassificationPageLanguages.MenuName
	, ClassificationPageLanguages.MouseOver
	, ClassificationPageLanguages.TitleName
	, ClassificationPageLanguages.TitleDescription
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationPageLanguages.CreatorID
	, ClassificationPageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationPageLanguages.ModifierID
	, ClassificationPageLanguages.ModifiedDate
FROM ClassificationPages
JOIN ClassificationPageLanguages
	ON ClassificationPages.ClassificationPageId = ClassificationPageLanguages.ClassificationPageID
JOIN Classifications
	ON ClassificationPages.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN Languages 
	ON Languages.LanguageId = ClassificationPageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationPageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationPageLanguages.ModifierID
WHERE ClassificationPages.ClassificationPageId = @ClassificationPageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)



