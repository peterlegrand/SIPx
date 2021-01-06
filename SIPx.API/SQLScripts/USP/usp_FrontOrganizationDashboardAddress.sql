CREATE PROCEDURE usp_FrontOrganizationDashboardAddress (@CurrentUserId nvarchar(450), @SelectedOrganizationId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT OrganizationAddressID
	, ISNULL( UserAddressTypeName.Customization, AddressTypeName.Name) AddressTypeName
	, ISNULL( UserCountryName.Customization, CountryName.Name) CountryName
	, ISNULL( AttnName,'') AttnName
	, ISNULL( Address1,'') Address1
	, ISNULL( Address2,'') Address2
	, ISNULL( HouseNumber,'') HouseNumber
	, ISNULL( HouseNumberExt,'') HouseNumberExt
	, ISNULL( City,'') City
	, ISNULL( PostalCode,'') PostalCode
	, ISNULL( PostalCodeExt,'') PostalCodeExt
	, ISNULL( ProvinceState,'') ProvinceState
	, ISNULL( County,'') County
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationAddresses.ModifiedDate
FROM OrganizationAddresses
JOIN AddressTypes
	ON OrganizationAddresses.AddressTypeID = AddressTypes.AddressTypeId
JOIN UITermLanguages AddressTypeName
	ON AddressTypes.NameTermId = AddressTypeName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserAddressTypeName
	ON AddressTypes.NameTermId = UserAddressTypeName.UITermId  
JOIN Countries
	ON OrganizationAddresses.CountryID = Countries.CountryId
JOIN UITermLanguages CountryName
	ON Countries.NameTermId = CountryName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserCountryName
	ON Countries.NameTermId = UserCountryName.UITermId  
JOIN Organizations
	ON Organizations.OrganizationID = OrganizationAddresses.OrganizationID
JOIN Persons Creator
	ON Creator.UserId = OrganizationAddresses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationAddresses.ModifierID
WHERE Organizations.OrganizationID = @SelectedOrganizationId
	AND AddressTypeName.LanguageId = @LanguageID
	AND CountryName.LanguageId = @LanguageID
