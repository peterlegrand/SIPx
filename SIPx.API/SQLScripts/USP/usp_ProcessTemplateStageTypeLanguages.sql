CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeLanguages] (@ProcessTemplateStageTypeID int) 
AS 
SELECT ProcessTemplateStageTypes.ProcessTemplateStageTypeID 
	, ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeLanguageID
	, ProcessTemplateStageTypeLanguages.LanguageID
	, ProcessTemplateStageTypeLanguages.Name
	, ProcessTemplateStageTypeLanguages.Description
	, ProcessTemplateStageTypeLanguages.MenuName
	, ProcessTemplateStageTypeLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateStageTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateStageTypeLanguages.ModifiedDate
FROM ProcessTemplateStageTypes
JOIN ProcessTemplateStageTypeLanguages
	ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = ProcessTemplateStageTypeLanguages.ProcessTemplateStageTypeID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateStageTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateStageTypeLanguages.ModifierID
WHERE ProcessTemplateStageTypes.ProcessTemplateStageTypeID = @ProcessTemplateStageTypeID
