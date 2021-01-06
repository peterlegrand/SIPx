CREATE PROCEDURE [dbo].[usp_PersonAddressDeleteGet] (@UserId nvarchar(450), @PersonAddressId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


DECLARE @IsUser bit;
DECLARE @SelectedUserId nvarchar(450);
SELECT @SelectedUserId = UserId FROM Persons WHERE PersonId IN (Select PersonID FROM PersonAddresses WHERE PersonAddressID = @PersonAddressId);
IF @SelectedUserId IS NULL
BEGIN
SET @IsUser = 0
END
ELSE
BEGIN
SET @IsUser = 1
END


SELECT PersonAddresses.PersonAddressId 
	, PersonAddresses.PersonID
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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonAddresses.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonAddresses.ModifiedDate
	, @IsUser IsUserNormalUserCannotDelete
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
		AND PersonAddresses.PersonAddressID = @PersonAddressId
ORDER BY ISNULL(UIAddressTypeNameCustom.Customization,UIAddressTypeName.Name) 
