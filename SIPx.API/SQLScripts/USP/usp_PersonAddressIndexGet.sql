CREATE PROCEDURE [dbo].[usp_PersonAddressIndexGet] (@UserId nvarchar(450), @PersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PersonAddresses.PersonAddressId 
	, PersonAddresses.PersonID
	, ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) AddressTypeName
	, ISNULL(PersonAddresses.AttnName,'') AttnName
	, ISNULL(PersonAddresses.Address1 ,'') Address1
	, ISNULL(PersonAddresses.Address2 ,'') Address2
	, ISNULL(PersonAddresses.HouseNumber ,'') HouseNumber
	, ISNULL(PersonAddresses.HouseNumberExt ,'') HouseNumberExt
	, ISNULL(PersonAddresses.City ,'') City
	, ISNULL(PersonAddresses.PostalCode,'')  PostalCode
	, ISNULL(PersonAddresses.PostalCodeExt ,'') PostalCodeExt
	, ISNULL(UICountryCustom.Customization,UICountryName.Name) CountryName
	, ISNULL(PersonAddresses.ProvinceState ,'') ProvinceState
	, ISNULL(PersonAddresses.County ,'') County
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, PersonAddresses.ModifiedDate
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
JOIN Persons Creator
	ON Creator.UserId = PersonAddresses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonAddresses.ModifierID
WHERE UICountryName.LanguageId = @LanguageID
	AND UIAddressTypeName.LanguageId = @LanguageID
		AND PersonAddresses.PersonId = @PersonID
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 
