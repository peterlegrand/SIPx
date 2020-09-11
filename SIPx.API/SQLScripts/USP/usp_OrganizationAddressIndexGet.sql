CREATE PROCEDURE [dbo].[usp_OrganizationAddressIndexGet] (@UserId nvarchar(450), @OrganizationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationAddresses.OrganizationAddressId 
	, OrganizationAddresses.OrganizationID
	, ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) AddressTypeName
	, ISNULL(OrganizationAddresses.AttnName,'') AttnName
	, ISNULL(OrganizationAddresses.Address1,'') Address1
	, ISNULL(OrganizationAddresses.Address2,'') Address2
	, ISNULL(OrganizationAddresses.HouseNumber,'') HouseNumber
	, ISNULL(OrganizationAddresses.HouseNumberExt,'') HouseNumberExt
	, ISNULL(OrganizationAddresses.City,'') City
	, ISNULL(OrganizationAddresses.PostalCode,'') PostalCode
	, ISNULL(OrganizationAddresses.PostalCodeExt,'') PostalCodeExt
	, ISNULL(UICountryCustom.Customization,UICountryName.Name) CountryName
	, ISNULL(OrganizationAddresses.ProvinceState,'') ProvinceState
	, ISNULL(OrganizationAddresses.County,'') County
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, OrganizationAddresses.ModifiedDate
FROM OrganizationAddresses
JOIN AddressTypes
	ON OrganizationAddresses.AddressTypeId = AddressTypes.AddressTypeID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIAddressTypeNameCustom
	ON UIAddressTypeNameCustom.UITermId = AddressTypes.NameTermID
JOIN UITermLanguages UIAddressTypeName
	ON UIAddressTypeName.UITermId = AddressTypes.NameTermID
JOIN Countries	
	ON OrganizationAddresses.CountryId = Countries.CountryID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UICountryCustom
	ON UICountryCustom.UITermId = Countries.NameTermID
JOIN UITermLanguages UICountryName
	ON UICountryName.UITermId = Countries.NameTermID
JOIN Persons Creator
	ON Creator.UserId = OrganizationAddresses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationAddresses.ModifierID
WHERE UICountryName.LanguageId = @LanguageID
	AND UIAddressTypeName.LanguageId = @LanguageID
		AND OrganizationAddresses.OrganizationId = @OrganizationID
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 
