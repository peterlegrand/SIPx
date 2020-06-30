CREATE PROCEDURE [dbo].[usp_MetaListProcessTemplateStageFieldStatuses]
AS
SELECT ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusId, Name
FROM ProcessTemplateStageFieldStatuses 
JOIN UITermLanguages
	ON ProcessTemplateStageFieldStatuses.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name