CREATE PROCEDURE usp_UserDeleteGetPerson (@UserId nvarchar(450),@SelectedPersonId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
 	, ISNULL(CustomGender.Customization,DefaultGender.Name) GenderName
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this Organization')) OrganizationName
	, BirthDate
FROM persons
Organizations
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationId = Organizations.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.DefaultOrganizationID
JOIN Genders
	ON Genders.GenderID = Organizations.GenderID
JOIN UITermLanguages DefaultGender
	ON DefaultGender.UITermId = Genders.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomGender
	ON CustomGender.UITermId = Genders.NameTermID

WHERE @SelectedPersonId = PersonID
	AND DefaultGender.LanguageId = @LanguageID