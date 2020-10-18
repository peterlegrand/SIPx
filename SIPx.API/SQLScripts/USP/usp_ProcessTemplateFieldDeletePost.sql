CREATE PROCEDURE usp_ProcessTemplateFieldDeletePost ( @ProcessTemplateFieldId int)
AS
BEGIN TRANSACTION

DELETE FROM ProcessTemplateStageFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId

DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId

DECLARE @ProcessTemplateStageID int, @Sequence int
DECLARE DeleteStageField CURSOR
FOR SELECT ProcessTemplateStageID, Sequence FROM ProcessTemplateStageFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldId

OPEN DeleteStageField

FETCH NEXT FROM DeleteStageField INTO @ProcessTemplateStageID, @Sequence

WHILE @@FETCH_STATUS = 0
    BEGIN
	UPDATE ProcessTemplateStageFields SET Sequence = Sequence - 1 WHERE ProcessTemplateStageId = @ProcessTemplateStageID AND Sequence > @Sequence
    END;

CLOSE DeleteStageField;
DEALLOCATE DeleteStageField;

COMMIT TRANSACTION

SELECT * FROM ProcessTemplateStageFields
