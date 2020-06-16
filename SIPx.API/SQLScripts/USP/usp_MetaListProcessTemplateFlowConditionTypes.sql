CREATE PROCEDURE [dbo].[usp_MetaListProcessTemplateFlowConditionTypes]
AS
SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID, Name
FROM ProcessTemplateFlowConditionTypes 
JOIN UITermLanguages
	ON ProcessTemplateFlowConditionTypes.NameTermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY Name