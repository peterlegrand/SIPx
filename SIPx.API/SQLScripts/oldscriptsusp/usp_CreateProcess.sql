CREATE PROCEDURE usp_CreateProcess (@UserId nvarchar(450), @ProcessTypeId int, @ProcessTypeStageId int, @FieldsTable AS udt_ProcessFieldsNew READONLY)
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO processes (ProcessTypeId, ProcessTypeStageId, CreatorId, ModifierId, CreatedDate, ModifiedDate) 
VALUES (@ProcessTypeId, @ProcessTypeStageId, @UserId, @UserId, getdate(), getdate())

DECLARE @NewPRocessId int	= scope_identity();

INSERT INTO ProcessFields (ProcessId, ProcessTypeId, ProcessTypeFieldId, StringValue, IntValue, DateTimeValue, CreatorId, ModifierId, CreatedDate, ModifiedDate)
SELECT @NewPRocessId, ProcessTypeId, ProcessTypeFieldId, StringValue, IntValue, DateTimeValue, @UserId,@UserId, getdate(), getdate() FROM @FieldsTable
COMMIT TRANSACTION