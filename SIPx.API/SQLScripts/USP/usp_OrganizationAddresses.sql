CREATE PROCEDURE [dbo].[usp_OrganizationAddresses] (@UserID nvarchar(450), @OrganizationID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT OrganizationAddresses.OrganizationAddressID 
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
	ON OrganizationAddresses.AddressTypeID = AddressTypes.AddressTypeID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIAddressTypeNameCustom
	ON UIAddressTypeNameCustom.UITermID = AddressTypes.NameTermID
JOIN UITermLanguages UIAddressTypeName
	ON UIAddressTypeName.UITermID = AddressTypes.NameTermID
JOIN Countries	
	ON OrganizationAddresses.CountryID = Countries.CountryID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UICountryCustom
	ON UICountryCustom.UITermID = Countries.NameTermID
JOIN UITermLanguages UICountryName
	ON UICountryName.UITermID = Countries.NameTermID
WHERE UICountryName.LanguageID = @LanguageID
	AND UIAddressTypeName.LanguageID = @LanguageID
		AND OrganizationAddresses.OrganizationID = @OrganizationID
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 