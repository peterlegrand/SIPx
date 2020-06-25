CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldLanguage] (@ProcessTemplateFieldLanguageID int) 
AS 
SELECT ProcessTemplateFields.ProcessTemplateFieldID 
	, ProcessTemplateFieldLanguages.ProcessTemplateFieldLanguageID
	, ProcessTemplateFieldLanguages.LanguageID
	, ProcessTemplateFieldLanguages.Name
	, ProcessTemplateFieldLanguages.Description
	, ProcessTemplateFieldLanguages.MenuName
	, ProcessTemplateFieldLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFieldLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFieldLanguages.ModifiedDate
FROM ProcessTemplateFields
JOIN ProcessTemplateFieldLanguages
	ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessTemplateFieldLanguages.ProcessTemplateFieldID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFieldLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFieldLanguages.ModifierID
WHERE ProcessTemplateFieldLanguages.ProcessTemplateFieldLanguageID = @ProcessTemplateFieldLanguageID
