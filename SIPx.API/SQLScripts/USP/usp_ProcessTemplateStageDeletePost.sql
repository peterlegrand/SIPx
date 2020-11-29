CREATE PROCEDURE usp_ProcessTemplateStageDeletePost ( @ProcessTemplateStageId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTemplateStageFields WHERE ProcessTemplateStageId = @ProcessTemplateStageId

DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateStageId = @ProcessTemplateStageId
DELETE FROM ProcessTemplateStages WHERE ProcessTemplateStageId = @ProcessTemplateStageId

COMMIT TRANSACTION
