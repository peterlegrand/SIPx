CREATE PROCEDURE usp_ProcessUpdatePost (
	@UserId nvarchar(450)
	, @ProcessId int
	, @ProcessTypeFlowId int
	, @ProcessFieldTable AS udt_ProcessFieldUpdate READONLY
)
AS 
DECLARE @ProcessTypeStageID int;
SELECT @ProcessTypeStageID = ProcessTypeFlows.ProcessTypeToStageID 
FROM ProcessTypeFlows
WHERE ProcessTypeFlowId = @ProcessTypeFlowId

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE Processes 
SET ProcessTypeStageID = @ProcessTypeStageID
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessId = @ProcessId

UPDATE ProcessFields
SET 
ProcessFields.StringValue = NewData.StringValue
, ProcessFields.IntValue= NewData.IntValue
, ProcessFields.DateTimeValue= NewData.DateTimeValue
, ProcessFields.ModifierID = @UserId
, ProcessFields.ModifiedDate = getdate()
FROM ProcessFields 
INNER JOIN
@ProcessFieldTable NewData
ON NewData.ProcessFieldId = ProcessFields.ProcessFieldId

COMMIT TRANSACTION