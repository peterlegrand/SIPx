CREATE PROCEDURE usp_ProcessTemplateFlowConditionDeletePost (@UserId nvarchar(450), @ProcessTemplateFlowConditionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionId
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionId

COMMIT TRANSACTION
