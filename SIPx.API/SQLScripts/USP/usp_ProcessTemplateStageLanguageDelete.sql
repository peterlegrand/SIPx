CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageLanguageDelete] (@ProcessTemplateStageLanguageId int) 
AS 
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateStageLanguageID= @ProcessTemplateStageLanguageID


