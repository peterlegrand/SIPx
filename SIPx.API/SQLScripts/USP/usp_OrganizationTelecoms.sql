CREATE PROCEDURE [dbo].[usp_OrganizationTelecoms] (@UserID nvarchar(450), @OrganizationID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT OrganizationTelecoms.OrganizationTelecomID
	, ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) AddressTypeName
	, OrganizationTelecoms.TelecomValue
	, ISNULL(OrganizationTelecomPhones.AreaCode,'') AreaCode
	, ISNULL(OrganizationTelecomPhones.CountryCode,'') CountryCode
	, ISNULL(OrganizationTelecomPhones.ExtensionCode,'') ExtensionCode
	, ISNULL(OrganizationTelecomPhones.AskForName,'') AskForName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationTelecoms.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationTelecoms.ModifiedDate
FROM OrganizationTelecoms
JOIN TelecomTypes
	ON OrganizationTelecoms.TelecomTypeID = TelecomTypes.TelecomTypeID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermID = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermID = TelecomTypes.NameTermID
LEFT JOIN OrganizationTelecomPhones 
	ON OrganizationTelecomPhones.OrganizationTelecomID= OrganizationTelecoms.OrganizationTelecomID
JOIN Persons Creator
	ON Creator.UserID = OrganizationTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationTelecoms.ModifierID
WHERE UITelecomTypeName.LanguageID = @LanguageID
	AND OrganizationTelecoms.OrganizationID = @OrganizationID
ORDER BY ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) 