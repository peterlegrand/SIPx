CREATE PROCEDURE [dbo].[usp_PageSectionLanguage] (@UserID nvarchar(450), @PageSectionLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON PageSections.PageSectionID = PageSectionLanguages.PageSectionID
JOIN Languages 
	ON Languages.LanguageID = PageSectionLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = PageSectionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PageSectionLanguages.ModifierID
WHERE PageSectionLanguages.PageSectionLanguageID = @PageSectionLanguageID
	AND UILanguageName.LanguageID = @LanguageID

