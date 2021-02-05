CREATE PROCEDURE usp_ProcessTypeFlowPassUpdatePost (
	 @ProcessTypeFlowPassId int
	, @Sequence int
	, @ProcessTypeFlowPassTypeId int
	, @ProcessTypeFieldId int
	, @ProcessTypeFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTypeFlowPassString nvarchar(max)
	, @ProcessTypeFlowPassInt int
	, @ProcessTypeFlowPassDate DateTime
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @OldSequence int;
DECLARE @ProcessTypeFlowId int;
SELECT @OldSequence = Sequence, @ProcessTypeFlowId = ProcessTypeFlowId FROM ProcessTypeFlowPasses WHERE ProcessTypeFlowPassId = @ProcessTypeFlowPassID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypeFlowPasses SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND ProcessTypeFlowId = @ProcessTypeFlowID
END
ELSE
BEGIN
UPDATE ProcessTypeFlowPasses SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END



UPDATE ProcessTypeFlowPasses SET 
	Sequence =@Sequence 
	, ProcessTypeFlowPassTypeId = @ProcessTypeFlowPassTypeId 
	, ProcessTypeFieldId = @ProcessTypeFieldId 
	, ProcessTypeFieldIDRole = @ProcessTypeFieldIDRole 
	, ComparisonOperatorId = @ComparisonOperatorId 
	, ProcessTypeFlowPassString = @ProcessTypeFlowPassString 
	, ProcessTypeFlowPassInt = @ProcessTypeFlowPassInt 
	, ProcessTypeFlowPassDate = @ProcessTypeFlowPassDate 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTypeFlowPassId = @ProcessTypeFlowPassID

UPDATE  ProcessTypeFlowPassLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeFlowPassID= @ProcessTypeFlowPassID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION


