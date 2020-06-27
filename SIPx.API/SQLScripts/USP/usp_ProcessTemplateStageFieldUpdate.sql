CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageFieldUpdate] (
	@ProcessTemplateStageFieldID int
	, @ProcessTemplateStageFieldStatusID int
	, @ValueUpdateTypeID int
	, @Sequence int
	, @StringValue nvarchar(max)
	, @IntValue int
	, @LocationValue geography
	, @DateTimeValue DateTime
	, @UserID nvarchar(450)) 
AS 
DECLARE @StageID int;
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence , @StageID = ProcessTemplateStageID FROM ProcessTemplateStageFields WHERE ProcessTemplateStageFieldID = @ProcessTemplateStageFieldID

BEGIN TRANSACTION

IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateStageFields SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @StageID = ProcessTemplateStageID
END
ELSE
BEGIN
UPDATE ProcessTemplateStageFields SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @StageID = ProcessTemplateStageID
END

UPDATE  ProcessTemplateStageFields SET 
	ProcessTemplateStageFieldStatusID = @ProcessTemplateStageFieldStatusID
	, ValueUpdateTypeID = @ValueUpdateTypeID
	, Sequence = @Sequence
	, StringValue = @StringValue
	, IntValue = @IntValue
	, LocationValue = @LocationValue
	, DateTimeValue = @DateTimeValue
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageFieldID= @ProcessTemplateStageFieldID


