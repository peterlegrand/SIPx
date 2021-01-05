CREATE PROCEDURE usp_FrontPersonDashboardTelecom (@CurrentUserId nvarchar(450), @SelectedPersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT PersonTelecoms.PersonTelecomID
	, TelecomValue
	, ISNULL( UserTelecomTypeName.Customization, TelecomTypeName.Name) TelecomTypeName
	, ISNULL(PersonTelecomPhones.CountryCode,'') CountryCode
	, ISNULL(PersonTelecomPhones.AreaCode,'') AreaCode
	, ISNULL(PersonTelecomPhones.ExtensionCode,'') ExtensionCode
	, ISNULL(PersonTelecomPhones.AskForName,'') AskForName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTelecoms.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTelecoms.ModifiedDate
FROM PersonTelecoms
JOIN PersonTelecomPhones
	ON PersonTelecoms.PersonTelecomID = PersonTelecomPhones.PersonTelecomID
JOIN TelecomTypes
	ON PersonTelecoms.TelecomTypeID = TelecomTypes.TelecomTypeId
JOIN UITermLanguages TelecomTypeName
	ON TelecomTypes.NameTermId = TelecomTypeName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserTelecomTypeName
	ON TelecomTypes.NameTermId = UserTelecomTypeName.UITermId  
JOIN Persons
	ON Persons.PersonID = PersonTelecoms.PersonID
JOIN Persons Creator
	ON Creator.UserId = PersonTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTelecoms.ModifierID
WHERE Persons.PersonID= @SelectedPersonId
	AND TelecomTypeName.LanguageId = @LanguageID
