CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguageDelete] (@ProcessTemplateStageLanguageID int) 
AS 
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateStageLanguageID= @ProcessTemplateStageLanguageID


