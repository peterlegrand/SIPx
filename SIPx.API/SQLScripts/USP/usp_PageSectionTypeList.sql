CREATE PROCEDURE [dbo].[usp_PageSectionTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionTypes.PageSectionTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM PageSectionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PageSectionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PageSectionTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
