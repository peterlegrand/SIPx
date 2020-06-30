CREATE PROCEDURE [dbo].[usp_PersonAddres] (@UserId nvarchar(450), @PersonAddressId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonAddresses.PersonAddressId 
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
	ON PersonAddresses.AddressTypeId = AddressTypes.AddressTypeID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIAddressTypeNameCustom
	ON UIAddressTypeNameCustom.UITermId = AddressTypes.NameTermID
JOIN UITermLanguages UIAddressTypeName
	ON UIAddressTypeName.UITermId = AddressTypes.NameTermID
JOIN Countries	
	ON PersonAddresses.CountryId = Countries.CountryID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UICountryCustom
	ON UICountryCustom.UITermId = Countries.NameTermID
JOIN UITermLanguages UICountryName
	ON UICountryName.UITermId = Countries.NameTermID
WHERE UICountryName.LanguageId = @LanguageID
	AND UIAddressTypeName.LanguageId = @LanguageID
		AND PersonAddresses.PersonAddressID= @PersonAddressID
