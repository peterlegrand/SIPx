CREATE PROCEDURE [dbo].[usp_ProcessTypeStageFieldUpdate] (
	@ProcessTypeStageFieldId int
	, @ProcessTypeStageFieldStatusId int
	, @ValueUpdateTypeId int
	, @Sequence int
	, @StringValue nvarchar(max)
	, @IntValue int
	, @LocationValue geography
	, @DateTimeValue DateTime
	, @UserId nvarchar(450)) 
AS 
DECLARE @StageId int;
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence , @StageId = ProcessTypeStageId FROM ProcessTypeStageFields WHERE ProcessTypeStageFieldId = @ProcessTypeStageFieldID

BEGIN TRANSACTION

IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypeStageFields SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND @StageId = ProcessTypeStageID
END
ELSE
BEGIN
UPDATE ProcessTypeStageFields SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND @StageId = ProcessTypeStageID
END

UPDATE  ProcessTypeStageFields SET 
	ProcessTypeStageFieldStatusId = @ProcessTypeStageFieldStatusID
	, ValueUpdateTypeId = @ValueUpdateTypeID
	, Sequence = @Sequence
	, StringValue = @StringValue
	, IntValue = @IntValue
	, LocationValue = @LocationValue
	, DateTimeValue = @DateTimeValue
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeStageFieldID= @ProcessTypeStageFieldID


