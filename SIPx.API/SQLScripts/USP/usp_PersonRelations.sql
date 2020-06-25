CREATE PROCEDURE [dbo].[usp_PersonRelations] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
	ON PersonRelations.FromPersonID = FromPersons.PersonID
JOIN Persons ToPersons
	ON PersonRelations.ToPersonID = ToPersons.PersonID
LEFT JOIN (SELECT PersonRelationTypeID, Name FROM PersonRelationTypeLanguages WHERE LanguageID = @LanguageID) UserRelationTypeLanguage
	ON PersonRelations.PersonRelationTypeID = PersonRelations.PersonRelationTypeID
LEFT JOIN (SELECT PersonRelationTypeId, Name FROM PersonRelationTypeLanguages JOIN Settings ON PersonRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.PersonRelationTypeId = PersonRelations.PersonRelationTypeId
JOIN Persons Creator
	ON Creator.UserID = PersonRelations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonRelations.ModifierID
