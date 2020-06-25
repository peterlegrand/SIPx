CREATE PROCEDURE [dbo].[usp_Person] (@UserID nvarchar(450), @PersonID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
	, ISNULL(UIGenderNameCustom.Customization,UIGenderName.Name) GenderName
	, ISNULL(AspNetUsers.UserName, 'Not a user') UserName	
	, ISNULL(UserOrganizationLanguages.Name,ISNULL(DefaultOrganizationLanguages.Name,'No name for default organization')) OrganizationName
	, Persons.BirthDate
	, Persons.DeceasedDate
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Persons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Persons.ModifiedDate
FROM Persons 
LEFT JOIN AspNetUsers ON Persons.UserID = AspNetUsers.ID
JOIN Genders 
	ON Genders.GenderID = Persons.GenderID
JOIN UITermLanguages UIGenderName
	ON UIGenderName.UITermID = Genders.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGenderNameCustom
	ON UIGenderNameCustom.UITermID = Genders.NameTermID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) UserOrganizationLanguages
	ON UserOrganizationLanguages.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultOrganizationLanguages
	ON DefaultOrganizationLanguages.OrganizationID = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserID = Persons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Persons.ModifierID
	AND UIGenderName.LanguageID = @LanguageID
WHERE Persons.PersonID = @PersonID
