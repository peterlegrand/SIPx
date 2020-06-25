CREATE PROCEDURE [dbo].[usp_PageSectionLanguages] (@PageSectionID int) 
AS 
SELECT PageSections.PageSectionID 
	, PageSectionLanguages.PageSectionLanguageID
	, PageSectionLanguages.LanguageID
	, PageSectionLanguages.Name
	, PageSectionLanguages.Description
	, PageSectionLanguages.MenuName
	, PageSectionLanguages.MouseOver
	, PageSectionLanguages.TitleName
	, PageSectionLanguages.TitleDescription
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PageSectionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PageSectionLanguages.ModifiedDate
FROM PageSections
JOIN PageSectionLanguages
	ON PageSections.PageSectionID = PageSectionLanguages.PageSectionID
JOIN Persons Creator
	ON Creator.UserID = PageSectionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PageSectionLanguages.ModifierID
WHERE PageSections.PageSectionID = @PageSectionID

