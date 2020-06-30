CREATE PROCEDURE [dbo].[usp_PersonRelationsForPerson] (@UserId nvarchar(450), @PersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT PersonRelations.PersonRelationID
	, 'FromSelectedPerson' Direction
	, PersonRelations.ToPersonId RelationWithPersonID
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
	ON PersonRelations.FromPersonId = FromPersons.PersonID
JOIN Persons ToPersons
	ON PersonRelations.ToPersonId = ToPersons.PersonID
LEFT JOIN (SELECT PersonRelationTypeId, Name, FromIsAnXOfTo FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserRelationTypeLanguage
	ON PersonRelations.PersonRelationTypeId = PersonRelations.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, FromIsAnXOfTo FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.PersonRelationTypeId = PersonRelations.PersonRelationTypeId
JOIN Persons Creator
	ON Creator.UserId = PersonRelations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelations.ModifierID
WHERE PersonRelations.FromPersonId = @PersonID

UNION ALL

SELECT PersonRelations.PersonRelationID
	, 'FromSelectedPerson' Direction
	, PersonRelations.FromPersonId RelationWithPersonID
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
	ON PersonRelations.FromPersonId = FromPersons.PersonID
JOIN Persons ToPersons
	ON PersonRelations.ToPersonId = ToPersons.PersonID
LEFT JOIN (SELECT PersonRelationTypeId, Name, ToIsAnXOfFrom FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserRelationTypeLanguage
	ON PersonRelations.PersonRelationTypeId = PersonRelations.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name, ToIsAnXOfFrom FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.PersonRelationTypeId = PersonRelations.PersonRelationTypeId
JOIN Persons Creator
	ON Creator.UserId = PersonRelations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelations.ModifierID
WHERE PersonRelations.ToPersonId = @PersonID
