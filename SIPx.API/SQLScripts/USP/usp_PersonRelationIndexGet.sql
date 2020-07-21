CREATE PROCEDURE [dbo].[usp_PersonRelationIndexGet] (@UserId nvarchar(450), @PersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonRelations.PersonRelationID
	, PersonRelations.FromPersonID
	, FromPersons.FirstName + ' ' + FromPersons.LastName FromPersonName
	, PersonRelations.ToPersonID
	, ToPersons.FirstName + ' ' + ToPersons.LastName ToPersonName
	, ValidFrom
	, ValidTill
	, PersonRelations.PersonRelationTypeID
	, ISNULL(UserRelationTypeLanguage.Name,ISNULL(DefaultRelationTypeLanguage.Name,'No name for this relation type')) PersonRelationTypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonRelations.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonRelations.ModifiedDate
FROM PersonRelations
JOIN Persons FromPersons
	ON PersonRelations.FromPersonId = FromPersons.PersonID
JOIN Persons ToPersons
	ON PersonRelations.ToPersonId = ToPersons.PersonID
LEFT JOIN (SELECT PersonRelationTypeId, Name FROM PersonRelationTypeLanguages WHERE LanguageId = @LanguageID) UserRelationTypeLanguage
	ON PersonRelations.PersonRelationTypeId = PersonRelations.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.PersonRelationTypeId = PersonRelations.PersonRelationTypeId
JOIN Persons Creator
	ON Creator.UserId = PersonRelations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelations.ModifierID
WHERE PersonRelations.FromPersonId = @PersonID
	OR PersonRelations.ToPersonId = @PersonID

