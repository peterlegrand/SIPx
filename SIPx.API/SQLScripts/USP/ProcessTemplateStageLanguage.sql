CREATE PROCEDURE [dbo].[ProcessTemplateStageLanguage] (@ProcessTemplateStageFlowLanguageID int) 
AS 
SELECT ProcessTemplateStageFlows.ProcessTemplateStageFlowID 
	, ProcessTemplateStageFlowLanguages.ProcessTemplateStageFlowLanguageID
	, ProcessTemplateStageFlowLanguages.LanguageID
	, ProcessTemplateStageFlowLanguages.Name
	, ProcessTemplateStageFlowLanguages.Description
	, ProcessTemplateStageFlowLanguages.MenuName
	, ProcessTemplateStageFlowLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStageFlowLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageFlowLanguages.ModifiedDate
FROM ProcessTemplateStageFlows
JOIN ProcessTemplateStageFlowLanguages
	ON ProcessTemplateStageFlows.ProcessTemplateStageFlowID = ProcessTemplateStageFlowLanguages.ProcessTemplateStageFlowID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStageFlowLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageFlowLanguages.ModifierID
WHERE ProcessTemplateStageFlowLanguages.ProcessTemplateStageFlowLanguageID = @ProcessTemplateStageFlowLanguageID
