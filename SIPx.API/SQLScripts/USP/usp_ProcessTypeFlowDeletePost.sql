CREATE PROCEDURE usp_ProcessTypeFlowDeletePost (@UserId nvarchar(450),  @ProcessTypeFlowId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeFlowId = @ProcessTypeFlowId
DELETE FROM ProcessTypeFlowConditions WHERE ProcessTypeFlowId = @ProcessTypeFlowId

DELETE FROM ProcessTypeFlowLanguages WHERE ProcessTypeFlowId = @ProcessTypeFlowId
DELETE FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId

COMMIT TRANSACTION
