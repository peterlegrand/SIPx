CREATE PROCEDURE usp_CreateProcess (@User nvarchar(450), @ProcessTemplateID int, @ProcessTemplateStageID int, @FieldsTable AS udt_ProcessFieldsNew READONLY)
AS 
BEGIN TRANSACTION
INSERT INTO processes (ProcessTemplateID, ProcessTemplateStageID, CreatorID, ModifierID, CreatedDate, ModifiedDate) 
VALUES (@ProcessTemplateID, @ProcessTemplateStageID, @User, @User, getdate(), getdate())

DECLARE @NewPRocessID int	= scope_identity();

INSERT INTO ProcessFields (ProcessID, ProcessTemplateID, ProcessTemplateFieldID, StringValue, IntValue, DateTimeValue, CreatorID, ModifierID, CreatedDate, ModifiedDate)
SELECT @NewPRocessID, ProcessTemplateID, ProcessTemplateFieldID, StringValue, IntValue, DateTimeValue, @User,@User, getdate(), getdate() FROM @FieldsTable
COMMIT TRANSACTION