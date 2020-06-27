CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionUpdate] (
	@ProcessTemplateFlowConditionLanguageID int
	, @ProcessTemplateFlowConditionID int
	, @Sequence int
	, @ProcessTemplateFlowConditionTypeID int
	, @ProcessTemplateFieldID int
	, @ProcessTemplateFieldIDRole int
	, @ComparisonOperatorID int
	, @ProcessTemplateFlowConditionString nvarchar(max)
	, @ProcessTemplateFlowConditionInt int
	, @ProcessTemplateFlowConditionDate DateTime
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
BEGIN TRANSACTION
DECLARE @OldSequence int;
DECLARE @ProcessTemplateFlowID int;
SELECT @OldSequence = Sequence, @ProcessTemplateFlowID = ProcessTemplateFlowID FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowConditionID = @ProcessTemplateFlowConditionID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateFlowConditions SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND ProcessTemplateFlowID = @ProcessTemplateFlowID
END
ELSE
BEGIN
UPDATE ProcessTemplateFlowConditions SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END



UPDATE ProcessTemplateFlowConditions SET 
	Sequence =@Sequence 
	, ProcessTemplateFlowConditionTypeID = @ProcessTemplateFlowConditionTypeID 
	, ProcessTemplateFieldID = @ProcessTemplateFieldID 
	, ProcessTemplateFieldIDRole = @ProcessTemplateFieldIDRole 
	, ComparisonOperatorID = @ComparisonOperatorID 
	, ProcessTemplateFlowConditionString = @ProcessTemplateFlowConditionString 
	, ProcessTemplateFlowConditionInt = @ProcessTemplateFlowConditionInt 
	, ProcessTemplateFlowConditionDate = @ProcessTemplateFlowConditionDate 
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFlowConditionID = @ProcessTemplateFlowConditionID

UPDATE  ProcessTemplateFlowConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowConditionLanguageID= @ProcessTemplateFlowConditionLanguageID

COMMIT TRANSACTION


