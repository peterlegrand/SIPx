CREATE PROCEDURE usp_ProcessCreatePost (
	@UserId nvarchar(450)
	, @ProcessTypeId int
	, @ProcessTypeFlowId int
	, @ProcessFieldValueTable AS udt_ProcessFieldsNew READONLY)
AS 
DECLARE @ProcessTypeStageID int;
SELECT @ProcessTypeStageID = ProcessTypeFlows.ProcessTypeToStageID 
FROM ProcessTypeFlows
WHERE ProcessTypeFlowId = @ProcessTypeFlowId

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO Processes (
	ProcessTypeID
	, ProcessTypeStageID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate
) 
VALUES (	
	@ProcessTypeId
	, @ProcessTypeStageID
	, @UserId
	, getdate()
	, @UserId
	, getdate()
	)

DECLARE @NewProcessId int	= scope_identity();

INSERT INTO ProcessFields(ProcessTypeID, ProcessID, ProcessTypeFieldID, StringValue, IntValue, DateTimeValue, CreatorID, CreatedDate, ModifierID, ModifiedDate)
SELECT @ProcessTypeId, @NewProcessId,ProcessTypeFieldID, StringValue, IntValue, DateTimeValue, @UserId, getdate(),@UserId, getdate() FROM @ProcessFieldValueTable
COMMIT TRANSACTION