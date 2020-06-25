CREATE PROCEDURE [dbo].[usp_ProcessTemplateLanguages] (@ProcessTemplateID int) 
AS 
SELECT ProcessTemplates.ProcessTemplateID 
	, ProcessTemplateLanguages.ProcessTemplateLanguageID
	, ProcessTemplateLanguages.LanguageID
	, ProcessTemplateLanguages.Name
	, ProcessTemplateLanguages.Description
	, ProcessTemplateLanguages.MenuName
	, ProcessTemplateLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateLanguages.ModifiedDate
FROM ProcessTemplates
JOIN ProcessTemplateLanguages
	ON ProcessTemplates.ProcessTemplateID = ProcessTemplateLanguages.ProcessTemplateID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateLanguages.ModifierID
WHERE ProcessTemplates.ProcessTemplateID = @ProcessTemplateID
