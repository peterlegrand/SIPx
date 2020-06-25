CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldLanguageDelete] (@ProcessTemplateFieldLanguageID int) 
AS 
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateFieldLanguageID= @ProcessTemplateFieldLanguageID


