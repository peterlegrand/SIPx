CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionLanguage] (@UserID nvarchar(450), @ClassificationPageSectionLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ClassificationPageSections.ClassificationPageSectionID 
	, ClassificationPageSectionLanguages.ClassificationPageSectionLanguageID
	, ClassificationPageSectionLanguages.LanguageID
	, ClassificationPageSectionLanguages.Name
	, ClassificationPageSectionLanguages.Description
	, ClassificationPageSectionLanguages.MenuName
	, ClassificationPageSectionLanguages.MouseOver
	, ClassificationPageSectionLanguages.TitleName
	, ClassificationPageSectionLanguages.TitleDescription
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationPageSectionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationPageSectionLanguages.ModifiedDate
FROM ClassificationPageSections
JOIN ClassificationPageSectionLanguages
	ON ClassificationPageSections.ClassificationPageSectionID = ClassificationPageSectionLanguages.ClassificationPageSectionID
JOIN Languages 
	ON Languages.LanguageID = ClassificationPageSectionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationPageSectionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationPageSectionLanguages.ModifierID
WHERE ClassificationPageSectionLanguages.ClassificationPageSectionLanguageID = @ClassificationPageSectionLanguageID
	AND UILanguageName.LanguageID = @LanguageID



