CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguages] (@ProcessTemplateStageID int) 
AS 
SELECT ProcessTemplateStages.ProcessTemplateStageID 
	, ProcessTemplateStageLanguages.ProcessTemplateStageLanguageID
	, ProcessTemplateStageLanguages.LanguageID
	, ProcessTemplateStageLanguages.Name
	, ProcessTemplateStageLanguages.Description
	, ProcessTemplateStageLanguages.MenuName
	, ProcessTemplateStageLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageLanguages.ModifiedDate
FROM ProcessTemplateStages
JOIN ProcessTemplateStageLanguages
	ON ProcessTemplateStages.ProcessTemplateStageID = ProcessTemplateStageLanguages.ProcessTemplateStageID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageLanguages.ModifierID
WHERE ProcessTemplateStages.ProcessTemplateStageID = @ProcessTemplateStageID
