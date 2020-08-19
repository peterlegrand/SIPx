CREATE PROCEDURE usp_ProcessTemplateFieldDeletePost ( @ProcessTemplateFieldId int)
AS
BEGIN TRANSACTION

DELETE FROM ProcessTemplateStageFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId

DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId

COMMIT TRANSACTION
