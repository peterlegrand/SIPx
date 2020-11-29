CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageDelete] (
	@ProcessTemplateStageId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateStageId = @ProcessTemplateStageID
DELETE FROM ProcessTemplateStages WHERE ProcessTemplateStageId = @ProcessTemplateStageID
COMMIT TRANSACTION
