CREATE PROCEDURE [dbo].[usp_PersonRelationsForPerson] (@UserID nvarchar(450), @PersonID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT PersonRelations.PersonRelationID
	, 'FromSelectedPerson' Direction
	, PersonRelations.ToPersonID RelationWithPersonID
	, ToPersons.FirstName + ' ' + ToPersons.LastName RelationWithPersonName
	, ValidFrom
	, ValidTill
	, PersonRelations.PersonRelationTypeID
	, ISNULL(UserRelationTypeLanguage.Name,ISNULL(DefaultRelationTypeLanguage.Name,'No name for this relation type')) RelationTypeName
	, ISNULL(UserRelationTypeLanguage.FromIsAnXOfTo,ISNULL(DefaultRelationTypeLanguage.FromIsAnXOfTo,'No direction description for this relation type')) FromIsAnXOfTo
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonRelations.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonRelations.ModifiedDate
FROM PersonRelations
JOIN Persons FromPersons
	ON PersonRelations.FromPersonID = FromPersons.PersonID
JOIN Persons ToPersons
	ON PersonRelations.ToPersonID = ToPersons.PersonID
LEFT JOIN (SELECT PersonRelationTypeID, Name, FromIsAnXOfTo FROM PersonRelationTypeLanguages WHERE LanguageID = @LanguageID) UserRelationTypeLanguage
	ON PersonRelations.PersonRelationTypeID = PersonRelations.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, FromIsAnXOfTo FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.PersonRelationTypeId = PersonRelations.PersonRelationTypeId
JOIN Persons Creator
	ON Creator.UserID = PersonRelations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonRelations.ModifierID
WHERE PersonRelations.FromPersonID = @PersonID

UNION ALL

SELECT PersonRelations.PersonRelationID
	, 'FromSelectedPerson' Direction
	, PersonRelations.FromPersonID RelationWithPersonID
	, FromPersons.FirstName + ' ' + FromPersons.LastName RelationWithPersonName
	, ValidFrom
	, ValidTill
	, PersonRelations.PersonRelationTypeID
	, ISNULL(UserRelationTypeLanguage.Name,ISNULL(DefaultRelationTypeLanguage.Name,'No name for this relation type')) RelationTypeName
	, ISNULL(UserRelationTypeLanguage.ToIsAnXOfFrom,ISNULL(DefaultRelationTypeLanguage.ToIsAnXOfFrom,'No direction description for this relation type')) ToIsAnXOfFrom
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonRelations.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonRelations.ModifiedDate
FROM PersonRelations
JOIN Persons FromPersons
	ON PersonRelations.FromPersonID = FromPersons.PersonID
JOIN Persons ToPersons
	ON PersonRelations.ToPersonID = ToPersons.PersonID
LEFT JOIN (SELECT PersonRelationTypeID, Name, ToIsAnXOfFrom FROM PersonRelationTypeLanguages WHERE LanguageID = @LanguageID) UserRelationTypeLanguage
	ON PersonRelations.PersonRelationTypeID = PersonRelations.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, ToIsAnXOfFrom FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.PersonRelationTypeId = PersonRelations.PersonRelationTypeId
JOIN Persons Creator
	ON Creator.UserID = PersonRelations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonRelations.ModifierID
WHERE PersonRelations.ToPersonID = @PersonID
