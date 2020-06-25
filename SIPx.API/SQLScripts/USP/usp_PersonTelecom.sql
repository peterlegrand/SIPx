CREATE PROCEDURE [dbo].[usp_PersonTelecom] (@UserID nvarchar(450), @PersonTelecomID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT PersonTelecoms.PersonTelecomID
	, ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) AddressTypeName
	, PersonTelecoms.TelecomValue
	, ISNULL(PersonTelecomPhones.AreaCode,'') AreaCode
	, ISNULL(PersonTelecomPhones.CountryCode,'') CountryCode
	, ISNULL(PersonTelecomPhones.ExtensionCode,'') ExtensionCode
	, ISNULL(PersonTelecomPhones.AskForName,'') AskForName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonTelecoms.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonTelecoms.ModifiedDate
FROM PersonTelecoms
JOIN TelecomTypes
	ON PersonTelecoms.TelecomTypeID = TelecomTypes.TelecomTypeID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermID = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermID = TelecomTypes.NameTermID
LEFT JOIN PersonTelecomPhones 
	ON PersonTelecomPhones.PersonTelecomID= PersonTelecoms.PersonTelecomID
JOIN Persons Creator
	ON Creator.UserID = PersonTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonTelecoms.ModifierID
WHERE UITelecomTypeName.LanguageID = @LanguageID
	AND PersonTelecoms.PersonTelecomID = @PersonTelecomID