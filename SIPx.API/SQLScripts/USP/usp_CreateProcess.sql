CREATE PROCEDURE usp_CreateProcess (@UserID nvarchar(450), @ProcessTemplateID int, @ProcessTemplateStageID int, @FieldsTable AS udt_ProcessFieldsNew READONLY)
AS 
BEGIN TRANSACTION
INSERT INTO processes (ProcessTemplateID, ProcessTemplateStageID, CreatorID, ModifierID, CreatedDate, ModifiedDate) 
VALUES (@ProcessTemplateID, @ProcessTemplateStageID, @UserID, @UserID, getdate(), getdate())

DECLARE @NewPRocessID int	= scope_identity();

INSERT INTO ProcessFields (ProcessID, ProcessTemplateID, ProcessTemplateFieldID, StringValue, IntValue, DateTimeValue, CreatorID, ModifierID, CreatedDate, ModifiedDate)
SELECT @NewPRocessID, ProcessTemplateID, ProcessTemplateFieldID, StringValue, IntValue, DateTimeValue, @UserID,@UserID, getdate(), getdate() FROM @FieldsTable
COMMIT TRANSACTION