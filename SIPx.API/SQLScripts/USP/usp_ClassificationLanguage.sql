CREATE PROCEDURE [dbo].[usp_ClassificationLanguage] (@ClassificationLanguageID int) 
AS 
SELECT Classifications.ClassificationID 
	, ClassificationLanguages.ClassificationLanguageID
	, ClassificationLanguages.LanguageID
	, ClassificationLanguages.Name
	, ClassificationLanguages.Description
	, ClassificationLanguages.MenuName
	, ClassificationLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationLanguages.ModifiedDate
FROM Classifications
JOIN ClassificationLanguages
	ON Classifications.ClassificationID = ClassificationLanguages.ClassificationID
JOIN Persons Creator
	ON Creator.UserID = ClassificationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationLanguages.ModifierID
WHERE ClassificationLanguages.ClassificationLanguageID = @ClassificationLanguageID