CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeLanguageDelete] (@ProcessTemplateStageTypeLanguageID int) 
AS 
DELETE FROM ProcessTemplateStageTypeLanguages WHERE ProcessTemplateStageTypeLanguageID= @ProcessTemplateStageTypeLanguageID


