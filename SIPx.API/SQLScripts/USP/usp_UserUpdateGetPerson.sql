CREATE PROCEDURE usp_UserUpdateGetPerson (@SelectedPersonId int)
AS
SELECT PersonId 
	, Salutation
	, FirstName
	, MiddleName
	, LastName
	, PersonalTitle
	, Suffix
	, NickName
	, FirstNameLocal
	, MiddleNameLocal
	, LastNameLocal
	, GenderID
	, BirthDate
	, DefaultOrganizationID
FROM persons
WHERE @SelectedPersonId = PersonID