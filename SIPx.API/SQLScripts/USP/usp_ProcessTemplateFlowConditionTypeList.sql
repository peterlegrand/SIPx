CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTemplateFlowConditionTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateFlowConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateFlowConditionTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID and active = 1
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
