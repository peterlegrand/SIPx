CREATE PROCEDURE [dbo].[usp_PageSectionDataTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionDataTypes.PageSectionDataTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM PageSectionDataTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PageSectionDataTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
