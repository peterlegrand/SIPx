CREATE PROCEDURE usp_ProcessTemplateFlowPassTypeList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowPassTypes.ProcessTemplateFlowPassTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTemplateFlowPassTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateFlowPassTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateFlowPassTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
