CREATE PROCEDURE [dbo].[usp_PersonAddresses] (@UserID nvarchar(450), @PersonID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT PersonAddresses.PersonAddressID 
	, ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) AddressTypeName
	, PersonAddresses.AttnName
	, PersonAddresses.Address1
	, PersonAddresses.Address2
	, PersonAddresses.HouseNumber
	, PersonAddresses.HouseNumberExt
	, PersonAddresses.Location
	, PersonAddresses.City
	, PersonAddresses.PostalCode
	, PersonAddresses.PostalCodeExt
	, ISNULL(UICountryCustom.Customization,UICountryName.Name) CountryName
	, PersonAddresses.ProvinceState
	, PersonAddresses.County

FROM PersonAddresses
JOIN AddressTypes
	ON PersonAddresses.AddressTypeID = AddressTypes.AddressTypeID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIAddressTypeNameCustom
	ON UIAddressTypeNameCustom.UITermID = AddressTypes.NameTermID
JOIN UITermLanguages UIAddressTypeName
	ON UIAddressTypeName.UITermID = AddressTypes.NameTermID
JOIN Countries	
	ON PersonAddresses.CountryID = Countries.CountryID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UICountryCustom
	ON UICountryCustom.UITermID = Countries.NameTermID
JOIN UITermLanguages UICountryName
	ON UICountryName.UITermID = Countries.NameTermID
WHERE UICountryName.LanguageID = @LanguageID
	AND UIAddressTypeName.LanguageID = @LanguageID
		AND PersonAddresses.PersonID = @PersonID
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 