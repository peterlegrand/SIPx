CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageDelete] (
	@ProcessTemplateStageID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateStageID = @ProcessTemplateStageID
DELETE FROM ProcessTemplateStages WHERE ProcessTemplateStageID = @ProcessTemplateStageID
COMMIT TRANSACTION
