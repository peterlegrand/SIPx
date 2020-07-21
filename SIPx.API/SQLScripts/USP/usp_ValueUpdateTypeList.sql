CREATE PROCEDURE [dbo].[usp_ValueUpdateTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ValueUpdateTypes.ValueUpdateTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ValueUpdateTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ValueUpdateTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ValueUpdateTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
