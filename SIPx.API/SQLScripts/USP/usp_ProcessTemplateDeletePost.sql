CREATE PROCEDURE usp_ProcessTemplateDeletePost ( @ProcessTemplateId int)
AS
BEGIN TRANSACTION

DELETE FROM ProcessTemplateStageFields WHERE ProcessTemplateID = @ProcessTemplateId

DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateFlows WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplateStages WHERE ProcessTemplateID = @ProcessTemplateId

DELETE FROM ProcessTemplateLanguages WHERE ProcessTemplateID = @ProcessTemplateId
DELETE FROM ProcessTemplates WHERE ProcessTemplateID = @ProcessTemplateId

COMMIT TRANSACTION
