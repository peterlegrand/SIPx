CREATE PROCEDURE usp_ProcessTypeFlowConditionDeletePost (@UserId nvarchar(450), @ProcessTypeFlowConditionId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeFlowConditionId = @ProcessTypeFlowConditionId
DELETE FROM ProcessTypeFlowConditions WHERE ProcessTypeFlowConditionId = @ProcessTypeFlowConditionId

COMMIT TRANSACTION
