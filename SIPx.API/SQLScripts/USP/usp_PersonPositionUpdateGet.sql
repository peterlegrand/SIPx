CREATE PROCEDURE usp_PersonPositionUpdateGet (@UserId nvarchar(450), @OrganizationPersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationPersons.OrganizationPersonId 
	, OrganizationPersons.OrganizationID
	, OrganizationPersons.PersonId
	, OrganizationPersons.PositionID 
	, Persons.FirstName
	, Persons.LastName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationPersons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationPersons.ModifiedDate
FROM OrganizationPersons
JOIN Persons 
	ON Persons.PersonID = OrganizationPersons.PersonId
JOIN Persons Creator
	ON Creator.UserId = OrganizationPersons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationPersons.ModifierID
WHERE OrganizationPersons.OrganizationPersonId = @OrganizationPersonId
