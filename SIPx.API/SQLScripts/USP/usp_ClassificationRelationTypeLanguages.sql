CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguages] (@ClassificationRelationTypeID int) 
AS 
SELECT ClassificationRelationTypes.ClassificationRelationTypeID 
	, ClassificationRelationTypeLanguages.ClassificationRelationTypeLanguageID
	, ClassificationRelationTypeLanguages.LanguageID
	, ClassificationRelationTypeLanguages.Name
	, ClassificationRelationTypeLanguages.Description
	, ClassificationRelationTypeLanguages.MenuName
	, ClassificationRelationTypeLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationRelationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationRelationTypeLanguages.ModifiedDate
FROM ClassificationRelationTypes
JOIN ClassificationRelationTypeLanguages
	ON ClassificationRelationTypes.ClassificationRelationTypeID = ClassificationRelationTypeLanguages.ClassificationRelationTypeID
JOIN Persons Creator
	ON Creator.UserID = ClassificationRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationRelationTypeLanguages.ModifierID
WHERE ClassificationRelationTypes.ClassificationRelationTypeID = @ClassificationRelationTypeID



