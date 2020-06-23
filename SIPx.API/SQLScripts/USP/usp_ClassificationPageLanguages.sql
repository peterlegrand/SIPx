CREATE PROCEDURE [dbo].[usp_ClassificationPageLanguages] (@ClassificationPageID int) 
AS 
SELECT ClassificationPages.ClassificationPageID 
	, ClassificationPageLanguages.ClassificationPageLanguageID
	, ClassificationPageLanguages.LanguageID
	, ClassificationPageLanguages.Name
	, ClassificationPageLanguages.Description
	, ClassificationPageLanguages.MenuName
	, ClassificationPageLanguages.MouseOver
	, ClassificationPageLanguages.TitleName
	, ClassificationPageLanguages.TitleDescription
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationPageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationPageLanguages.ModifiedDate
FROM ClassificationPages
JOIN ClassificationPageLanguages
	ON ClassificationPages.ClassificationPageID = ClassificationPageLanguages.ClassificationPageID
JOIN Persons Creator
	ON Creator.UserID = ClassificationPageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationPageLanguages.ModifierID
WHERE ClassificationPages.ClassificationPageID = @ClassificationPageID



