CREATE PROCEDURE [dbo].[usp_OrganizationAddressDeleteGet] (@UserId nvarchar(450), @OrganizationAddressId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationAddresses.OrganizationAddressId 
	, OrganizationAddresses.OrganizationID
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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationAddresses.ModifiedDate
	, OrganizationTypes.Internal InternalOrganizationNormalUserCannotDelete
FROM OrganizationAddresses
JOIN Organizations
	ON OrganizationAddresses.OrganizationId = Organizations.OrganizationID
JOIN OrganizationTypes 
	ON Organizations.OrganizationTypeID = OrganizationTypes.OrganizationTypeID
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
		AND OrganizationAddresses.OrganizationAddressId = @OrganizationAddressID
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 
