CREATE PROCEDURE [dbo].[usp_ProcessTemplateLanguageDelete] (@ProcessTemplateLanguageId int) 
AS 
DELETE FROM ProcessTemplateLanguages WHERE ProcessTemplateLanguageID= @ProcessTemplateLanguageID


