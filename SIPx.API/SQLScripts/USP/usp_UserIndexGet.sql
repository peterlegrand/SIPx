CREATE PROCEDURE [dbo].[usp_UserIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, persons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, persons.ModifiedDate
FROM AspNetUsers 
JOIN persons
	ON AspNetUsers.Id = Persons.UserID
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelId = AspNetUsers.SecurityLevelID
JOIN UITermLanguages SecurityLevelLanguages
	ON SecurityLevelLanguages.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations WHERE LanguageId = @LanguageID) SecutiryLevelNameCustom
	ON SecutiryLevelNameCustom.UITermId = SecurityLevels.NameTermID
JOIN Genders
	ON Genders.GenderId = Persons.GenderID
JOIN UITermLanguages GenderLanguages
	ON GenderLanguages.UITermId = Genders.NameTermID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationId = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = persons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = persons.ModifierID
WHERE SecurityLevelLanguages.LanguageId = @LanguageID
	AND GenderLanguages.LanguageId = @LanguageID
