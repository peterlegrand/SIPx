CREATE PROCEDURE [dbo].[usp_TelecomTypes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT TelecomTypes.TelecomTypeID 
	, ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) TelecomTypeName
	, ISNULL(UITelecomTypeDescriptionCustom.Customization,UITelecomTypeDescription.Name) TelecomTypeDescription
	, ISNULL(UITelecomTypeMenuNameCustom.Customization,UITelecomTypeMenuName.Name) TelecomTypeMenuName
	, ISNULL(UITelecomTypeMouseOverCustom.Customization,UITelecomTypeMouseOver.Name) TelecomTypeMouseOver
	, PhoneProperties
	, Active
FROM TelecomTypes
JOIN UITermLanguages UITelecomTypeName
	ON UITelecomTypeName.UITermID = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeDescription
	ON UITelecomTypeDescription.UITermID = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeMenuName
	ON UITelecomTypeMEnuName.UITermID = TelecomTypes.NameTermID
JOIN UITermLanguages UITelecomTypeMouseOver
	ON UITelecomTypeMouseOver.UITermID = TelecomTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITelecomTypeNameCustom
	ON UITelecomTypeNameCustom.UITermID = TelecomTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITelecomTypeDescriptionCustom
	ON UITelecomTypeDescriptionCustom.UITermID = TelecomTypes.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITelecomTypeMenuNameCustom
	ON UITelecomTypeMenuNameCustom.UITermID = TelecomTypes.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITelecomTypeMouseOverCustom
	ON UITelecomTypeMouseOverCustom.UITermID = TelecomTypes.MouseOverTermID
WHERE UITelecomTypeName.LanguageID = @LanguageID
	AND UITelecomTypeDescription.LanguageID = @LanguageID
	AND UITelecomTypeMenuName.LanguageID = @LanguageID
	AND UITelecomTypeMouseOver.LanguageID = @LanguageID
ORDER BY 
ISNULL(UITelecomTypeNameCustom.Customization,UITelecomTypeName.Name) 