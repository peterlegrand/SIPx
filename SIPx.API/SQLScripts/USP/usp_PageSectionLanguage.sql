CREATE PROCEDURE [dbo].[usp_PageSectionLanguage] (@UserId nvarchar(450), @PageSectionLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT PageSectionLanguages.PageSectionLanguageID
	, PageSectionLanguages.LanguageID
	, PageSectionLanguages.Name
	, PageSectionLanguages.Description
	, PageSectionLanguages.MenuName
	, PageSectionLanguages.MouseOver
	, PageSectionLanguages.TitleName
	, PageSectionLanguages.TitleDescription
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PageSectionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PageSectionLanguages.ModifiedDate
FROM PageSections
JOIN PageSectionLanguages
	ON PageSections.PageSectionId = PageSectionLanguages.PageSectionID
JOIN Languages 
	ON Languages.LanguageId = PageSectionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = PageSectionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionLanguages.ModifierID
WHERE PageSectionLanguages.PageSectionLanguageId = @PageSectionLanguageID
	AND UILanguageName.LanguageId = @LanguageID

