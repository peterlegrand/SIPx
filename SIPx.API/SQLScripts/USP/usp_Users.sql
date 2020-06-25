CREATE PROCEDURE [dbo].[usp_Users] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT 
	aspnetUsers.Id UserID
	,aspnetUsers.UserName
	, aspnetUsers.Email
	, aspnetUsers.PhoneNumber UserPhoneNumber
	, aspnetUsers.PhoneNumberConfirmed
	, aspnetUsers.TwoFactorEnabled
	, aspnetUsers.LockoutEnd
	, aspnetUsers.LockoutEnabled
	, aspnetUsers.AccessFailedCount
	, ISNULL(SecutiryLevelNameCustom.Customization, SecurityLevelLanguages.Name) SecurityLevelName
	, Persons.PersonID
	, Persons.Salutation
	, Persons.FirstName
	, Persons.MiddleName
	, Persons.LastName
	, Persons.PersonalTitle
	, Persons.Suffix
	, Persons.NickName
	, Persons.FirstNameLocal
	, Persons.MiddleNameLocal
	, Persons.LastNameLocal
	, GenderLanguages.Name GenderName
	, Persons.BirthDate
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
FROM AspNetUsers 
JOIN persons
	ON AspNetUsers.Id = Persons.UserID
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelID = AspNetUsers.SecurityLevelID
JOIN UITermLanguages SecurityLevelLanguages
	ON SecurityLevelLanguages.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE LanguageID = @LanguageID) SecutiryLevelNameCustom
	ON SecutiryLevelNameCustom.UITermID = SecurityLevels.NameTermID
JOIN Genders
	ON Genders.GenderID = Persons.GenderID
JOIN UITermLanguages GenderLanguages
	ON GenderLanguages.UITermID = Genders.NameTermID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationID = Persons.DefaultOrganizationID
WHERE SecurityLevelLanguages.LanguageID = @LanguageID
	AND GenderLanguages.LanguageID = @LanguageID