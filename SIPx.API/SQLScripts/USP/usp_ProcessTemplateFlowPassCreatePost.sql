CREATE PROCEDURE usp_ProcessTemplateFlowPassCreatePost (
	@ProcessTemplateFlowId int
	, @Sequence int
	, @ProcessTemplateFlowPassTypeId int
	, @ProcessTemplateFieldId int
	, @ProcessTemplateFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTemplateFlowPassestring nvarchar(max)
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

DECLARE @ProcessTemplateId int;

SELECT @ProcessTemplateId  = ProcessTemplateId FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID;
SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTemplateFlowPasses SET Sequence = Sequence + 1 
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId 
	AND Sequence >= @Sequence

INSERT INTO ProcessTemplateFlowPasses (
	ProcessTemplateFlowID
	,ProcessTemplateID
	, Sequence
	, ProcessTemplateFlowPassTypeID
	, ProcessTemplateFieldID
	, ProcessTemplateFieldIDRole 
	, ComparisonOperatorId 
	, ProcessTemplateFlowPassString 
	, ProcessTemplateFlowPassInt 
	, ProcessTemplateFlowPassDate 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateFlowID
	, @ProcessTemplateID
	, @Sequence
	, @ProcessTemplateFlowPassTypeID
	, @ProcessTemplateFieldID
	, @ProcessTemplateFieldIDRole 
	, @ComparisonOperatorId 
	, @ProcessTemplateFlowPassestring 
	, @ProcessTemplateFlowPassInt 
	, @ProcessTemplateFlowPassDate 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTemplateFlowPassId int	= scope_identity();

INSERT INTO ProcessTemplateFlowPassLanguages (
	ProcessTemplateFlowPassID
	, ProcessTemplateFlowID
	, ProcessTemplateID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewProcessTemplateFlowPassId 
	, @ProcessTemplateFlowID
	, @ProcessTemplateID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION



