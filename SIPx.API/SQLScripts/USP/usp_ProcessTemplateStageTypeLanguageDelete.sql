CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeLanguageDelete] (@ProcessTemplateStageTypeLanguageId int) 
AS 
DELETE FROM ProcessTemplateStageTypeLanguages WHERE ProcessTemplateStageTypeLanguageID= @ProcessTemplateStageTypeLanguageID


