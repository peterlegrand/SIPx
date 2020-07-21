CREATE PROCEDURE [dbo].[usp_PageLanguageUpdateGet] (@UserId nvarchar(450), @PageLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT PageLanguages.PageLanguageID
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
	ON Pages.PageId = PageLanguages.PageID
JOIN Languages 
	ON Languages.LanguageId = PageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = PageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageLanguages.ModifierID
WHERE PageLanguages.PageLanguageId = @PageLanguageID
	AND UILanguageName.LanguageId = @LanguageID

