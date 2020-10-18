CREATE PROCEDURE usp_UserDeleteGetPerson (@UserId nvarchar(450),@SelectedPersonId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
 	, ISNULL(CustomGender.Customization,DefaultGender.Name) GenderName
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this Organization')) OrganizationName
	, persons.BirthDate
	, persons.CreatedDate
	, persons.ModifiedDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorId
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
FROM persons

LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationId = persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = persons.DefaultOrganizationID
JOIN Genders
	ON Genders.GenderID = persons.GenderID
JOIN UITermLanguages DefaultGender
	ON DefaultGender.UITermId = Genders.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomGender
	ON CustomGender.UITermId = Genders.NameTermID
JOIN Persons Creator
	ON Persons.CreatorID = Creator.UserID
JOIN Persons Modifier
	ON Persons.ModifierID= Modifier.UserID

WHERE @SelectedPersonId = Persons.PersonID
	AND DefaultGender.LanguageId = @LanguageID