CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionUpdatePost] (
	 @ProcessTemplateFlowConditionId int
	, @Sequence int
	, @ProcessTemplateFlowConditionTypeId int
	, @ProcessTemplateFieldId int
	, @ProcessTemplateFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTemplateFlowConditionString nvarchar(max)
	, @ProcessTemplateFlowConditionInt int
	, @ProcessTemplateFlowConditionDate DateTime
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
DECLARE @ProcessTemplateFlowId int;
SELECT @OldSequence = Sequence, @ProcessTemplateFlowId = ProcessTemplateFlowId FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateFlowConditions SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND ProcessTemplateFlowId = @ProcessTemplateFlowID
END
ELSE
BEGIN
UPDATE ProcessTemplateFlowConditions SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END



UPDATE ProcessTemplateFlowConditions SET 
	Sequence =@Sequence 
	, ProcessTemplateFlowConditionTypeId = @ProcessTemplateFlowConditionTypeId 
	, ProcessTemplateFieldId = @ProcessTemplateFieldId 
	, ProcessTemplateFieldIDRole = @ProcessTemplateFieldIDRole 
	, ComparisonOperatorId = @ComparisonOperatorId 
	, ProcessTemplateFlowConditionString = @ProcessTemplateFlowConditionString 
	, ProcessTemplateFlowConditionInt = @ProcessTemplateFlowConditionInt 
	, ProcessTemplateFlowConditionDate = @ProcessTemplateFlowConditionDate 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionID

UPDATE  ProcessTemplateFlowConditionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowConditionID= @ProcessTemplateFlowConditionID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION


