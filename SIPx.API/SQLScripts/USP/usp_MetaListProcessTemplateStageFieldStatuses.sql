CREATE PROCEDURE [dbo].[usp_MetaListProcessTemplateStageFieldStatuses]
AS
SELECT ProcessTemplateStageFieldStatuses.ProcessTemplateStageFieldStatusID, Name
FROM ProcessTemplateStageFieldStatuses 
JOIN UITermLanguages
	ON ProcessTemplateStageFieldStatuses.NameTermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY Name