CREATE PROCEDURE [dbo].[usp_MetaListProcessTypeStageFieldStatuses]
AS
SELECT ProcessTypeStageFieldStatuses.ProcessTypeStageFieldStatusId, Name
FROM ProcessTypeStageFieldStatuses 
JOIN UITermLanguages
	ON ProcessTypeStageFieldStatuses.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name