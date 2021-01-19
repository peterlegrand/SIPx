CREATE PROCEDURE [dbo].[usp_addresstypeUpdateGet] (@UserId nvarchar(450), @AddressTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
DECLARE @ScreenLanguageId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'AddressType' AND Action = 'Update';
SELECT @ScreenLanguageId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'AddressType' AND Action = 'LanguageUpdate';
DECLARE @RecordLanguageId int;
SELECT @RecordLanguageId = AddressTypeLanguageId FROM AddressTypeLanguages WHERE AddressTypeID = @AddressTypeId and LanguageID = @LanguageId
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogAddressTypeCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @AddressTypeId, @UserId, Getdate(), @ScreenId)
INSERT INTO ReadLogAddressTypeLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @RecordLanguageId, @UserId, Getdate(), @ScreenLanguageId)

SELECT AddressTypes.AddressTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, AddressTypes.ModifierID
	, AddressTypes.ModifiedDate
FROM AddressTypes 
JOIN UITermLanguages UIName
	ON UIName.UITermId = AddressTypes.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = AddressTypes.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = AddressTypes.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = AddressTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = AddressTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = AddressTypes.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = AddressTypes.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = AddressTypes.MouseOverTermID
JOIN Persons Modifier
	ON Modifier.UserId = AddressTypes.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
	AND AddressTypes.AddressTypeId = @AddressTypeID

COMMIT TRANSACTION
