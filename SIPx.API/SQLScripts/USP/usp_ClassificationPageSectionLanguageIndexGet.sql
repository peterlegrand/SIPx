CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionLanguageIndexGet] (@UserId nvarchar(450), @ClassificationPageSectionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationPageSectionLanguages.ClassificationPageSectionLanguageID
	, ClassificationPageSectionLanguages.ClassificationPageSectionID
	, ClassificationPages.ClassificationID
	, ClassificationPages.ClassificationPageID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this classification page')) ClassificationPageName
	, ClassificationPageSectionLanguages.LanguageID
	, ClassificationPageSectionLanguages.Name
	, ClassificationPageSectionLanguages.Description
	, ClassificationPageSectionLanguages.MenuName
	, ClassificationPageSectionLanguages.MouseOver
	, ClassificationPageSectionLanguages.TitleName
	, ClassificationPageSectionLanguages.TitleDescription
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationPageSectionLanguages.CreatedDate
	, ClassificationPageSectionLanguages.CreatorId
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationPageSectionLanguages.ModifierId
	, ClassificationPageSectionLanguages.ModifiedDate
FROM ClassificationPageSections
JOIN ClassificationPageSectionLanguages
	ON ClassificationPageSections.ClassificationPageSectionId = ClassificationPageSectionLanguages.ClassificationPageSectionID
JOIN ClassificationPages
	ON ClassificationPages.ClassificationPageID = ClassificationPageSections.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageId, Name FROM ClassificationPageLanguages WHERE LanguageId = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageId, Name FROM ClassificationPageLanguages JOIN Settings ON ClassificationPageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageId = ClassificationPages.ClassificationPageID
JOIN Classifications
	ON ClassificationPageSections.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN Languages 
	ON Languages.LanguageId = ClassificationPageSectionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationPageSectionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationPageSectionLanguages.ModifierID
WHERE ClassificationPageSections.ClassificationPageSectionId = @ClassificationPageSectionID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)


