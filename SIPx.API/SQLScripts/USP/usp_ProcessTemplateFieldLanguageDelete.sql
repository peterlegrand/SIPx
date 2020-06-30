CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldLanguageDelete] (@ProcessTemplateFieldLanguageId int) 
AS 
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateFieldLanguageID= @ProcessTemplateFieldLanguageID


