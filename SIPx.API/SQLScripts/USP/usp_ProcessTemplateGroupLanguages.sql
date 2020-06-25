CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupLanguages] (@ProcessTemplateGroupID int) 
AS 
SELECT ProcessTemplateGroups.ProcessTemplateGroupID 
	, ProcessTemplateGroupLanguages.ProcessTemplateGroupLanguageID
	, ProcessTemplateGroupLanguages.LanguageID
	, ProcessTemplateGroupLanguages.Name
	, ProcessTemplateGroupLanguages.Description
	, ProcessTemplateGroupLanguages.MenuName
	, ProcessTemplateGroupLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateGroupLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateGroupLanguages.ModifiedDate
FROM ProcessTemplateGroups
JOIN ProcessTemplateGroupLanguages
	ON ProcessTemplateGroups.ProcessTemplateGroupID = ProcessTemplateGroupLanguages.ProcessTemplateGroupID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateGroupLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateGroupLanguages.ModifierID
WHERE ProcessTemplateGroups.ProcessTemplateGroupID = @ProcessTemplateGroupID
