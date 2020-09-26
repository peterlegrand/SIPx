CREATE PROCEDURE usp_ProcessCreatePost (
	@UserId nvarchar(450)
	, @ProcessTemplateId int
	, @ProcessTemplateFlowId int
	, @ProcessFieldValueTable AS udt_ProcessFieldsNew READONLY)
AS 
DECLARE @ProcessTemplateStageID int;
SELECT @ProcessTemplateStageID = ProcessTemplateFlows.ProcessTemplateToStageID 
FROM ProcessTemplateFlows
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId

BEGIN TRANSACTION

INSERT INTO Processes (
	ProcessTemplateID
	, ProcessTemplateStageID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate
) 
VALUES (	
	@ProcessTemplateId
	, @ProcessTemplateStageID
	, @UserId
	, getdate()
	, @UserId
	, getdate()
	)

DECLARE @NewProcessId int	= scope_identity();

INSERT INTO ProcessFields(ProcessTemplateID, ProcessID, ProcessTemplateFieldID, StringValue, IntValue, DateTimeValue, CreatorID, CreatedDate, ModifierID, ModifiedDate)
SELECT @ProcessTemplateId, @NewProcessId,ProcessTemplateFieldID, StringValue, IntValue, DateTimeValue, @UserId, getdate(),@UserId, getdate() FROM @ProcessFieldValueTable
COMMIT TRANSACTION