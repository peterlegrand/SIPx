CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionLanguages] (@ClassificationPageSectionID int) 
AS 
SELECT ClassificationPageSections.ClassificationPageSectionID 
	, ClassificationPageSectionLanguages.ClassificationPageSectionLanguageID
	, ClassificationPageSectionLanguages.LanguageID
	, ClassificationPageSectionLanguages.Name
	, ClassificationPageSectionLanguages.Description
	, ClassificationPageSectionLanguages.MenuName
	, ClassificationPageSectionLanguages.MouseOver
	, ClassificationPageSectionLanguages.TitleName
	, ClassificationPageSectionLanguages.TitleDescription
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationPageSectionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationPageSectionLanguages.ModifiedDate
FROM ClassificationPageSections
JOIN ClassificationPageSectionLanguages
	ON ClassificationPageSections.ClassificationPageSectionID = ClassificationPageSectionLanguages.ClassificationPageSectionID
JOIN Persons Creator
	ON Creator.UserID = ClassificationPageSectionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationPageSectionLanguages.ModifierID
WHERE ClassificationPageSections.ClassificationPageSectionID = @ClassificationPageSectionID



