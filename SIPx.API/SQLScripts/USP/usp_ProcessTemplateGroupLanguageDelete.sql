CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupLanguageDelete] (@ProcessTemplateGroupLanguageID int) 
AS 
DELETE FROM ProcessTemplateGroupLanguages WHERE ProcessTemplateGroupLanguageID= @ProcessTemplateGroupLanguageID


