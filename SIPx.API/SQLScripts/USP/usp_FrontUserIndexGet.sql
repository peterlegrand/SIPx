CREATE PROCEDURE [dbo].[usp_FrontUserIndexGet] (@CurrentUserId nvarchar(450), @SelectedPersonId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;



SELECT
	AspNetUsers.SecurityLevelID
	, Persons.PersonId
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
	, Persons.FirstName
	, ISNULL( UserGenderName.Customization, GenderName.Name) GenderName
	, Persons.BirthDate
	, ISNULL( UserSecurityLevelName.Customization, SecurityLevelName.Name) SecurityLevelName
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this organization')) OrganizationName
	, AspNetUsers.SecurityLevelID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Persons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Persons.ModifiedDate
FROM   AspNetUsers
JOIN Persons
	ON AspNetUsers.Id = Persons.UserID
JOIN Genders
	ON Persons.GenderID = Genders.GenderId
JOIN UITermLanguages GenderName
	ON Genders.NameTermId = GenderName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserGenderName
	ON Genders.NameTermId = UserGenderName.UITermId  
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelId = AspNetUsers.SecurityLevelID
JOIN UITermLanguages SecurityLevelName
	ON SecurityLevels.NameTermId = SecurityLevelName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserSecurityLevelName
	ON SecurityLevels.NameTermId = UserSecurityLevelName.UITermId  
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = Persons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Persons.ModifierID
WHERE  Persons.PersonId = @SelectedPersonId
	AND GenderName.LanguageId = @LanguageID
	AND SecurityLevelName.LanguageId = @LanguageID
END;
