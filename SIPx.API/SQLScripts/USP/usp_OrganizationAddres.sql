CREATE PROCEDURE [dbo].[usp_OrganizationAddres] (@UserId nvarchar(450), @OrganizationAddressId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationAddresses.OrganizationAddressId 
	, ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) AddressTypeName
	, OrganizationAddresses.AttnName
	, OrganizationAddresses.Address1
	, OrganizationAddresses.Address2
	, OrganizationAddresses.HouseNumber
	, OrganizationAddresses.HouseNumberExt
	, OrganizationAddresses.Location
	, OrganizationAddresses.City
	, OrganizationAddresses.PostalCode
	, OrganizationAddresses.PostalCodeExt
	, ISNULL(UICountryCustom.Customization,UICountryName.Name) CountryName
	, OrganizationAddresses.ProvinceState
	, OrganizationAddresses.County

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
WHERE UICountryName.LanguageId = @LanguageID
	AND UIAddressTypeName.LanguageId = @LanguageID
		AND OrganizationAddresses.OrganizationAddressID= @OrganizationAddressID
