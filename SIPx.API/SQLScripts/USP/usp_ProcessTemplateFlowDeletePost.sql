CREATE PROCEDURE usp_ProcessTemplateFlowDeletePost ( @ProcessTemplateFlowId int)
AS
BEGIN TRANSACTION

DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId

DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId
DELETE FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId

COMMIT TRANSACTION
