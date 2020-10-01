CREATE PROCEDURE usp_ProcessUpdatePost (
	@UserId nvarchar(450)
	, @ProcessId int
	, @ProcessTemplateFlowId int
	, @ProcessFieldTable AS udt_ProcessFieldUpdate READONLY
)
AS 
DECLARE @ProcessTemplateStageID int;
SELECT @ProcessTemplateStageID = ProcessTemplateFlows.ProcessTemplateToStageID 
FROM ProcessTemplateFlows
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId

BEGIN TRANSACTION
UPDATE Processes 
SET ProcessTemplateStageID = @ProcessTemplateStageID
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