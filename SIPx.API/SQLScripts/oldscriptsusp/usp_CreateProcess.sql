CREATE PROCEDURE usp_CreateProcess (@UserId nvarchar(450), @ProcessTemplateId int, @ProcessTemplateStageId int, @FieldsTable AS udt_ProcessFieldsNew READONLY)
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO processes (ProcessTemplateId, ProcessTemplateStageId, CreatorId, ModifierId, CreatedDate, ModifiedDate) 
VALUES (@ProcessTemplateId, @ProcessTemplateStageId, @UserId, @UserId, getdate(), getdate())

DECLARE @NewPRocessId int	= scope_identity();

INSERT INTO ProcessFields (ProcessId, ProcessTemplateId, ProcessTemplateFieldId, StringValue, IntValue, DateTimeValue, CreatorId, ModifierId, CreatedDate, ModifiedDate)
SELECT @NewPRocessId, ProcessTemplateId, ProcessTemplateFieldId, StringValue, IntValue, DateTimeValue, @UserId,@UserId, getdate(), getdate() FROM @FieldsTable
COMMIT TRANSACTION