CREATE PROCEDURE [dbo].[usp_ProcessTemplateLanguageDelete] (@ProcessTemplateLanguageID int) 
AS 
DELETE FROM ProcessTemplateLanguages WHERE ProcessTemplateLanguageID= @ProcessTemplateLanguageID


