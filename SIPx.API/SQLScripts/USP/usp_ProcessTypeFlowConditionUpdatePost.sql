CREATE PROCEDURE usp_ProcessTypeFlowConditionUpdatePost (
	 @ProcessTypeFlowConditionId int
	, @Sequence int
	, @ProcessTypeFlowConditionTypeId int
	, @ProcessTypeFieldId int
	, @ProcessTypeFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTypeFlowConditionString nvarchar(max)
	, @ProcessTypeFlowConditionInt int
	, @ProcessTypeFlowConditionDate DateTime
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
SELECT @OldSequence = Sequence, @ProcessTypeFlowId = ProcessTypeFlowId FROM ProcessTypeFlowConditions WHERE ProcessTypeFlowConditionId = @ProcessTypeFlowConditionID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTypeFlowConditions SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND ProcessTypeFlowId = @ProcessTypeFlowID
END
ELSE
BEGIN
UPDATE ProcessTypeFlowConditions SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END



UPDATE ProcessTypeFlowConditions SET 
	Sequence =@Sequence 
	, ProcessTypeFlowConditionTypeId = @ProcessTypeFlowConditionTypeId 
	, ProcessTypeFieldId = @ProcessTypeFieldId 
	, ProcessTypeFieldIDRole = @ProcessTypeFieldIDRole 
	, ComparisonOperatorId = @ComparisonOperatorId 
	, ProcessTypeFlowConditionString = @ProcessTypeFlowConditionString 
	, ProcessTypeFlowConditionInt = @ProcessTypeFlowConditionInt 
	, ProcessTypeFlowConditionDate = @ProcessTypeFlowConditionDate 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTypeFlowConditionId = @ProcessTypeFlowConditionID

UPDATE  ProcessTypeFlowConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeFlowConditionID= @ProcessTypeFlowConditionID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION


