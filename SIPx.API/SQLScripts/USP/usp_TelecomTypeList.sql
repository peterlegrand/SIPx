CREATE PROCEDURE [dbo].[usp_TelecomTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT TelecomTypes.TelecomTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM TelecomTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = TelecomTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = TelecomTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
