CREATE PROCEDURE usp_ProcessTypeFlowPassDeletePost (@UserId nvarchar(450), @ProcessTypeFlowPassId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTypeFlowPassLanguages WHERE ProcessTypeFlowPassId = @ProcessTypeFlowPassId
DELETE FROM ProcessTypeFlowPasses WHERE ProcessTypeFlowPassId = @ProcessTypeFlowPassId

COMMIT TRANSACTION
