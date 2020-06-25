CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguage] (@PersonRelationTypeLanguageID int) 
AS 
SELECT PersonRelationTypes.PersonRelationTypeID 
	, PersonRelationTypeLanguages.PersonRelationTypeLanguageID
	, PersonRelationTypeLanguages.LanguageID
	, PersonRelationTypeLanguages.Name
	, PersonRelationTypeLanguages.Description
	, PersonRelationTypeLanguages.MenuName
	, PersonRelationTypeLanguages.MouseOver
	, PersonRelationTypeLanguages.FromIsAnXOfTo
	, PersonRelationTypeLanguages.ToIsAnXOfFrom
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonRelationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonRelationTypeLanguages.ModifiedDate
FROM PersonRelationTypes
JOIN PersonRelationTypeLanguages
	ON PersonRelationTypes.PersonRelationTypeID = PersonRelationTypeLanguages.PersonRelationTypeID
JOIN Persons Creator
	ON Creator.UserID = PersonRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonRelationTypeLanguages.ModifierID
WHERE PersonRelationTypeLanguages.PersonRelationTypeLanguageID = @PersonRelationTypeLanguageID
GO


