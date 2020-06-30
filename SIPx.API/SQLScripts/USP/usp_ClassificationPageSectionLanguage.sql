CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionLanguage] (@UserId nvarchar(450), @ClassificationPageSectionLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationPageSections.ClassificationPageSectionId 
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
	ON ClassificationPageSections.ClassificationPageSectionId = ClassificationPageSectionLanguages.ClassificationPageSectionID
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
WHERE ClassificationPageSectionLanguages.ClassificationPageSectionLanguageId = @ClassificationPageSectionLanguageID
	AND UILanguageName.LanguageId = @LanguageID



