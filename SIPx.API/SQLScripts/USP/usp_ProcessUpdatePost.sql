CREATE PROCEDURE usp_ProcessUpdatePost (
	@UserId nvarchar(450)
	, @ProcessId int
	, @ProcessFieldTable AS udt_ProcessFieldUpdate READONLY
)
AS 
BEGIN TRANSACTION
UPDATE Processes 
SET ModifierId = @UserID
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