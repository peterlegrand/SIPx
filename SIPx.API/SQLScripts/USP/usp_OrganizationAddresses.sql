CREATE PROCEDURE [dbo].[usp_OrganizationAddress] (@UserID nvarchar(450), @OrganizationAddressID int) 
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
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationAddresses.ModifiedDate
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
JOIN Persons Creator
	ON Creator.UserID = OrganizationAddresses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationAddresses.ModifierID
WHERE UICountryName.LanguageID = @LanguageID
	AND UIAddressTypeName.LanguageID = @LanguageID
		AND OrganizationAddresses.OrganizationAddressID = @OrganizationAddressID
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 