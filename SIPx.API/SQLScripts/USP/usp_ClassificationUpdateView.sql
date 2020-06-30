CREATE PROCEDURE usp_ClassificationUpdateView (@ClassificationId int, @LanguageId int)
AS
SELECT Classifications.ClassificationID
	, Classifications.StatusId 
	, Classifications.DefaultPageID
	, Classifications.HasDropDown
	, Classifications.DropDownSequence
	, ClassificationLanguages.ClassificationLanguageID
	, ClassificationLanguages.Name
	, ClassificationLanguages.Description
	, ClassificationLanguages.MenuName
	, ClassificationLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Classifications.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Classifications.ModifiedDate
FROM Classifications 
JOIN ClassificationLanguages 
	ON Classifications.ClassificationId = ClassificationLanguages.ClassificationID
JOIN Persons Creator
	ON Creator.UserId = Classifications.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Classifications.ModifierID
WHERE ClassificationLanguages.LanguageId = @LanguageID
	AND Classifications.ClassificationId = @ClassificationID
