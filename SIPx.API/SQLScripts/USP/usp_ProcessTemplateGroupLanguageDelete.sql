CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupLanguageDelete] (@ProcessTemplateGroupLanguageId int) 
AS 
DELETE FROM ProcessTemplateGroupLanguages WHERE ProcessTemplateGroupLanguageID= @ProcessTemplateGroupLanguageID


