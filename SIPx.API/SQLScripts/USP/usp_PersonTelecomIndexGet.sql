CREATE PROCEDURE [dbo].[usp_PersonTelecomIndexGet] (@UserId nvarchar(450), @PersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
	ON PersonTelecoms.TelecomTypeId = TelecomTypes.TelecomTypeID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermId = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermId = TelecomTypes.NameTermID
LEFT JOIN PersonTelecomPhones 
	ON PersonTelecomPhones.PersonTelecomID= PersonTelecoms.PersonTelecomID
JOIN Persons Creator
	ON Creator.UserId = PersonTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTelecoms.ModifierID
WHERE UITelecomTypeName.LanguageId = @LanguageID
	AND PersonTelecoms.PersonId = @PersonID
ORDER BY ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) 