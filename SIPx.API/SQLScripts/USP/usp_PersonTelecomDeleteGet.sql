CREATE PROCEDURE [dbo].[usp_PersonTelecomDeleteGet] (@UserId nvarchar(450), @PersonTelecomId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @IsUser bit;
DECLARE @SelectedUserId nvarchar(450);
SELECT @SelectedUserId = UserId FROM Persons WHERE PersonId IN (Select PersonID FROM PersonTelecoms WHERE PersonTelecomID = @PersonTelecomId);
IF @SelectedUserId IS NULL
BEGIN
SET @IsUser = 0
END
ELSE
BEGIN
SET @IsUser = 1
END

SELECT PersonTelecoms.PersonTelecomID
	, PersonTelecoms.PersonID
	, ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) AddressTypeName
	, PersonTelecoms.TelecomValue
	, ISNULL(PersonTelecomPhones.AreaCode,'') AreaCode
	, ISNULL(PersonTelecomPhones.CountryCode,'') CountryCode
	, ISNULL(PersonTelecomPhones.ExtensionCode,'') ExtensionCode
	, ISNULL(PersonTelecomPhones.AskForName,'') AskForName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTelecoms.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTelecoms.ModifiedDate
	, @IsUser IsUserNormalUserCannotDelete
FROM PersonTelecoms
JOIN TelecomTypes
	ON PersonTelecoms.TelecomTypeId = TelecomTypes.TelecomTypeID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermId = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermId = TelecomTypes.NameTermID
LEFT JOIN PersonTelecomPhones 
	ON PersonTelecomPhones.PersonTelecomID= PersonTelecoms.PersonTelecomID
JOIN Persons Creator
	ON Creator.UserId = PersonTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTelecoms.ModifierID
WHERE UITelecomTypeName.LanguageId = @LanguageID
	AND PersonTelecoms.PersonTelecomId = @PersonTelecomId
