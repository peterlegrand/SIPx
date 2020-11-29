CREATE PROCEDURE usp_ProcessTemplateFlowPassUpdatePost (
	 @ProcessTemplateFlowPassId int
	, @Sequence int
	, @ProcessTemplateFlowPassTypeId int
	, @ProcessTemplateFieldId int
	, @ProcessTemplateFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTemplateFlowPassString nvarchar(max)
	, @ProcessTemplateFlowPassInt int
	, @ProcessTemplateFlowPassDate DateTime
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
SELECT @OldSequence = Sequence, @ProcessTemplateFlowId = ProcessTemplateFlowId FROM ProcessTemplateFlowPasses WHERE ProcessTemplateFlowPassId = @ProcessTemplateFlowPassID;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ProcessTemplateFlowPasses SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND ProcessTemplateFlowId = @ProcessTemplateFlowID
END
ELSE
BEGIN
UPDATE ProcessTemplateFlowPasses SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END



UPDATE ProcessTemplateFlowPasses SET 
	Sequence =@Sequence 
	, ProcessTemplateFlowPassTypeId = @ProcessTemplateFlowPassTypeId 
	, ProcessTemplateFieldId = @ProcessTemplateFieldId 
	, ProcessTemplateFieldIDRole = @ProcessTemplateFieldIDRole 
	, ComparisonOperatorId = @ComparisonOperatorId 
	, ProcessTemplateFlowPassString = @ProcessTemplateFlowPassString 
	, ProcessTemplateFlowPassInt = @ProcessTemplateFlowPassInt 
	, ProcessTemplateFlowPassDate = @ProcessTemplateFlowPassDate 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFlowPassId = @ProcessTemplateFlowPassID

UPDATE  ProcessTemplateFlowPassLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowPassID= @ProcessTemplateFlowPassID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION


