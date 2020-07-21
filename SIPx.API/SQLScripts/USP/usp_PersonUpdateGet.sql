CREATE PROCEDURE [dbo].[usp_PersonUpdateGet] (@UserId nvarchar(450), @PersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Persons.PersonID
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
	, Persons.UserID
	, Persons.GenderID
	, Persons.DefaultOrganizationID
	, ISNULL(UIGenderNameCustom.Customization,UIGenderName.Name) GenderName
	, ISNULL(AspNetUsers.UserName, 'Not a user') UserName	
	, ISNULL(UserOrganizationLanguages.Name,ISNULL(DefaultOrganizationLanguages.Name,'No name for default organization')) OrganizationName
	, Persons.BirthDate
	, Persons.DeceasedDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Persons.CreatorID
	, Persons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Persons.ModifierID
	, Persons.ModifiedDate
FROM Persons 
LEFT JOIN AspNetUsers ON Persons.UserId = AspNetUsers.ID
JOIN Genders 
	ON Genders.GenderId = Persons.GenderID
JOIN UITermLanguages UIGenderName
	ON UIGenderName.UITermId = Genders.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGenderNameCustom
	ON UIGenderNameCustom.UITermId = Genders.NameTermID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguages
	ON UserOrganizationLanguages.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguages
	ON DefaultOrganizationLanguages.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = Persons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Persons.ModifierID
	AND UIGenderName.LanguageId = @LanguageID
WHERE Persons.PersonId = @PersonID
