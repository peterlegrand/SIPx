CREATE PROCEDURE [dbo].[usp_AddressTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AddressTypes.AddressTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM AddressTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = AddressTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = AddressTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
