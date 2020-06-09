CREATE PROCEDURE [dbo].[usp_addresstypeNotInPersonAddress] (@UserID nvarchar(450), @PersonAddressID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT AddressTypes.AddressTypeID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM AddressTypes 
JOIN UITermLanguages UIName
	ON UIName.UITermID = AddressTypes.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = AddressTypes.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = AddressTypes.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = AddressTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = AddressTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = AddressTypes.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = AddressTypes.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = AddressTypes.MouseOverTermID
WHERE AddressTypes.AddressTypeID NOT IN (SELECT PersonAddresses.AddressTypeID FROM PersonAddresses WHERE PersonAddressID = @PersonAddressID) 


