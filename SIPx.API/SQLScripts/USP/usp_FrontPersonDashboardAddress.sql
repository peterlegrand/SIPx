CREATE PROCEDURE usp_FrontPersonDashboardAddress (@CurrentUserId nvarchar(450), @SelectedPersonId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT PersonAddressID
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
	, PersonAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonAddresses.ModifiedDate
FROM PersonAddresses
JOIN AddressTypes
	ON PersonAddresses.AddressTypeID = AddressTypes.AddressTypeId
JOIN UITermLanguages AddressTypeName
	ON AddressTypes.NameTermId = AddressTypeName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserAddressTypeName
	ON AddressTypes.NameTermId = UserAddressTypeName.UITermId  
JOIN Countries
	ON PersonAddresses.CountryID = Countries.CountryId
JOIN UITermLanguages CountryName
	ON Countries.NameTermId = CountryName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserCountryName
	ON Countries.NameTermId = UserCountryName.UITermId  
JOIN Persons
	ON Persons.PersonID = PersonAddresses.PersonID
JOIN Persons Creator
	ON Creator.UserId = PersonAddresses.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonAddresses.ModifierID
WHERE Persons.PersonID = @SelectedPersonId
	AND AddressTypeName.LanguageId = @LanguageID
	AND CountryName.LanguageId = @LanguageID
