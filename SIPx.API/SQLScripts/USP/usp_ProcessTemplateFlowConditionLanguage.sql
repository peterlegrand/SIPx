CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguage] (@ProcessTemplateFlowConditionLanguageID int) 
AS 
SELECT ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID 
	, ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionLanguageID
	, ProcessTemplateFlowConditionLanguages.LanguageID
	, ProcessTemplateFlowConditionLanguages.Name
	, ProcessTemplateFlowConditionLanguages.Description
	, ProcessTemplateFlowConditionLanguages.MenuName
	, ProcessTemplateFlowConditionLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFlowConditionLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFlowConditionLanguages.ModifiedDate
FROM ProcessTemplateFlowConditions
JOIN ProcessTemplateFlowConditionLanguages
	ON ProcessTemplateFlowConditions.ProcessTemplateFlowConditionID = ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFlowConditionLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFlowConditionLanguages.ModifierID
WHERE ProcessTemplateFlowConditionLanguages.ProcessTemplateFlowConditionLanguageID = @ProcessTemplateFlowConditionLanguageID
