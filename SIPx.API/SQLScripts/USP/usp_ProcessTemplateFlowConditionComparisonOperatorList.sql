CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionComparisonOperatorList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM ProcessTemplateFlowConditionComparisonOperators
JOIN UITermLanguages UIName
	ON UIName.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ProcessTemplateFlowConditionComparisonOperators.NameTermID
WHERE UIName.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 
