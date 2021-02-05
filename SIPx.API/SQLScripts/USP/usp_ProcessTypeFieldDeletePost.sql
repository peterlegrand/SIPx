CREATE PROCEDURE usp_ProcessTypeFieldDeletePost ( @UserId nvarchar(450), @ProcessTypeFieldId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTypeStageFields WHERE ProcessTypeFieldId = @ProcessTypeFieldId

DELETE FROM ProcessTypeFieldLanguages WHERE ProcessTypeFieldId = @ProcessTypeFieldId
DELETE FROM ProcessTypeFields WHERE ProcessTypeFieldId = @ProcessTypeFieldId

DECLARE @ProcessTypeStageID int, @Sequence int
DECLARE DeleteStageField CURSOR
FOR SELECT ProcessTypeStageID, Sequence FROM ProcessTypeStageFields WHERE ProcessTypeFieldId = @ProcessTypeFieldId

OPEN DeleteStageField

FETCH NEXT FROM DeleteStageField INTO @ProcessTypeStageID, @Sequence

WHILE @@FETCH_STATUS = 0
    BEGIN
	UPDATE ProcessTypeStageFields SET Sequence = Sequence - 1 WHERE ProcessTypeStageId = @ProcessTypeStageID AND Sequence > @Sequence
    END;

CLOSE DeleteStageField;
DEALLOCATE DeleteStageField;

COMMIT TRANSACTION

SELECT * FROM ProcessTypeStageFields
