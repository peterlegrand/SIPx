CREATE PROCEDURE [dbo].[usp_MetaListProcessTemplateFlowConditionTypes]
AS
SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId, Name
FROM ProcessTemplateFlowConditionTypes 
JOIN UITermLanguages
	ON ProcessTemplateFlowConditionTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name