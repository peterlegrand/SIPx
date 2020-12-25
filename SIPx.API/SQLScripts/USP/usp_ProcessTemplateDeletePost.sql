CREATE PROCEDURE usp_ProcessTemplateDeletePost ( @UserId nvarchar(450), @ProcessTemplateId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @Sequence int;
SELECT @Sequence = Sequence FROM ProcessTemplates where ProcessTemplateID = @ProcessTemplateId


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
UPDATE ProcessTemplates SET Sequence = Sequence - 1 WHERE Sequence > @Sequence
COMMIT TRANSACTION
