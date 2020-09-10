CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageFieldUpdatePost] (
	@ProcessTemplateStageFieldId int
	, @ProcessTemplateStageFieldStatusId int
	, @ValueUpdateTypeId int
	, @Sequence int
	, @StringValue nvarchar(max)
	, @IntValue int
	, @DateTimeValue DateTime
	, @UserId nvarchar(450)) 
AS 
DECLARE @StageId int;
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence , @StageId = ProcessTemplateStageId FROM ProcessTemplateStageFields WHERE ProcessTemplateStageFieldId = @ProcessTemplateStageFieldID

BEGIN TRANSACTION

IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateStageFields SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @StageId = ProcessTemplateStageID
END
ELSE
BEGIN
UPDATE ProcessTemplateStageFields SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @StageId = ProcessTemplateStageID
END

UPDATE  ProcessTemplateStageFields SET 
	ProcessTemplateStageFieldStatusId = @ProcessTemplateStageFieldStatusID
	, ValueUpdateTypeId = @ValueUpdateTypeID
	, Sequence = @Sequence
	, StringValue = @StringValue
	, IntValue = @IntValue
	, DateTimeValue = @DateTimeValue
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageFieldID= @ProcessTemplateStageFieldID


commit transaction