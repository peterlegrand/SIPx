CREATE PROCEDURE usp_ProcessTypeDeletePost ( @UserId nvarchar(450), @ProcessTypeId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @Sequence int;
SELECT @Sequence = Sequence FROM ProcessTypes where ProcessTypeID = @ProcessTypeId


DELETE FROM ProcessTypeStageFields WHERE ProcessTypeID = @ProcessTypeId

DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeFlowConditions WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeFlowLanguages WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeFlows WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeFieldLanguages WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeFields WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeStageLanguages WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypeStages WHERE ProcessTypeID = @ProcessTypeId

DELETE FROM ProcessTypeLanguages WHERE ProcessTypeID = @ProcessTypeId
DELETE FROM ProcessTypes WHERE ProcessTypeID = @ProcessTypeId
UPDATE ProcessTypes SET Sequence = Sequence - 1 WHERE Sequence > @Sequence
COMMIT TRANSACTION
