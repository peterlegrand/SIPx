CREATE PROCEDURE usp_UserUpdateGetPerson (@SelectedPersonId int)
AS
SELECT persons.PersonId 
	, persons.Salutation
	, persons.FirstName
	, persons.MiddleName
	, persons.LastName
	, persons.PersonalTitle
	, persons.Suffix
	, persons.NickName
	, persons.FirstNameLocal
	, persons.MiddleNameLocal
	, persons.LastNameLocal
	, persons.GenderID
	, persons.BirthDate
	, persons.DefaultOrganizationID
	, persons.CreatedDate
	, persons.ModifiedDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorId
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
FROM persons
JOIN Persons Creator
	ON Persons.CreatorID = Creator.UserID
JOIN Persons Modifier
	ON Persons.ModifierID= Modifier.UserID
WHERE @SelectedPersonId = Persons.PersonID