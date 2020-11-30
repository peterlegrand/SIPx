CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTemplateFieldTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateFieldTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateFieldTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
