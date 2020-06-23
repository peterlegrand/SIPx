CREATE PROCEDURE [dbo].[usp_PageLanguage] (@PageLanguageID int) 
AS 
SELECT PageLanguages.PageLanguageID
	, PageLanguages.LanguageID
	, PageLanguages.Name
	, PageLanguages.Description
	, PageLanguages.MenuName
	, PageLanguages.MouseOver
	, PageLanguages.TitleName
	, PageLanguages.TitleDescription
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PageLanguages.ModifiedDate
FROM Pages
JOIN PageLanguages
	ON Pages.PageID = PageLanguages.PageID
JOIN Persons Creator
	ON Creator.UserID = PageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PageLanguages.ModifierID
WHERE PageLanguages.PageLanguageID = @PageLanguageID

