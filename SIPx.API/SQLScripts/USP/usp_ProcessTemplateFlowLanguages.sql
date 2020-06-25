CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguages] (@ProcessTemplateFlowID int) 
AS 
SELECT ProcessTemplateFlows.ProcessTemplateFlowID 
	, ProcessTemplateFlowLanguages.ProcessTemplateFlowLanguageID
	, ProcessTemplateFlowLanguages.LanguageID
	, ProcessTemplateFlowLanguages.Name
	, ProcessTemplateFlowLanguages.Description
	, ProcessTemplateFlowLanguages.MenuName
	, ProcessTemplateFlowLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFlowLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFlowLanguages.ModifiedDate
FROM ProcessTemplateFlows
JOIN ProcessTemplateFlowLanguages
	ON ProcessTemplateFlows.ProcessTemplateFlowID = ProcessTemplateFlowLanguages.ProcessTemplateFlowID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFlowLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFlowLanguages.ModifierID
WHERE ProcessTemplateFlows.ProcessTemplateFlowID = @ProcessTemplateFlowID
