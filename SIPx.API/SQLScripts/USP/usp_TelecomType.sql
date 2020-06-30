CREATE PROCEDURE [dbo].[usp_TelecomType] (@UserId nvarchar(450), @TelecomTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT TelecomTypes.TelecomTypeId 
	, ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) TelecomTypeName
	, ISNULL(UITelecomTypeDescriptionCustom.Customization,UITelecomTypeDescription.Name) TelecomTypeDescription
	, ISNULL(UITelecomTypeMenuNameCustom.Customization,UITelecomTypeMenuName.Name) TelecomTypeMenuName
	, ISNULL(UITelecomTypeMouseOverCustom.Customization,UITelecomTypeMouseOver.Name) TelecomTypeMouseOver
	, PhoneProperties
	, Active
FROM TelecomTypes
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermId = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeDescription
	ON UITelecomTypeDescription.UITermId = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeMenuName
	ON UITelecomTypeMEnuName.UITermId = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeMouseOver
	ON UITelecomTypeMouseOver.UITermId = TelecomTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermId = TelecomTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeDescriptionCustom
	ON UITelecomTypeDescriptionCustom.UITermId = TelecomTypes.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeMenuNameCustom
	ON UITelecomTypeMenuNameCustom.UITermId = TelecomTypes.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITelecomTypeMouseOverCustom
	ON UITelecomTypeMouseOverCustom.UITermId = TelecomTypes.MouseOverTermID
WHERE UITelecomTypeName.LanguageId = @LanguageID
	AND UITelecomTypeDescription.LanguageId = @LanguageID
	AND UITelecomTypeMenuName.LanguageId = @LanguageID
	AND UITelecomTypeMouseOver.LanguageId = @LanguageID
	AND TelecomTypeId = @TelecomTypeID
