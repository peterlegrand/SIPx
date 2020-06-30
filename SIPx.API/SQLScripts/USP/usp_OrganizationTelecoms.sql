CREATE PROCEDURE [dbo].[usp_OrganizationTelecoms] (@UserId nvarchar(450), @OrganizationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
	ON OrganizationTelecoms.TelecomTypeId = TelecomTypes.TelecomTypeID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermId = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermId = TelecomTypes.NameTermID
LEFT JOIN OrganizationTelecomPhones 
	ON OrganizationTelecomPhones.OrganizationTelecomID= OrganizationTelecoms.OrganizationTelecomID
JOIN Persons Creator
	ON Creator.UserId = OrganizationTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTelecoms.ModifierID
WHERE UITelecomTypeName.LanguageId = @LanguageID
	AND OrganizationTelecoms.OrganizationId = @OrganizationID
ORDER BY ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) 