CREATE PROCEDURE [dbo].[usp_PageLanguages] (@UserID nvarchar(450), @PageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Pages.PageID 
	, PageLanguages.PageLanguageID
	, PageLanguages.LanguageID
	, PageLanguages.Name
	, PageLanguages.Description
	, PageLanguages.MenuName
	, PageLanguages.MouseOver
	, PageLanguages.TitleName
	, PageLanguages.TitleDescription
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PageLanguages.ModifiedDate
FROM Pages
JOIN PageLanguages
	ON Pages.PageID = PageLanguages.PageID
JOIN Languages 
	ON Languages.LanguageID = PageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = PageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PageLanguages.ModifierID
WHERE Pages.PageID = @PageID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)

