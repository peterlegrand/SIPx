CREATE PROCEDURE [dbo].[usp_MetaListProcessTypeFlowConditionTypes]
AS
SELECT ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId, Name
FROM ProcessTypeFlowConditionTypes 
JOIN UITermLanguages
	ON ProcessTypeFlowConditionTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name