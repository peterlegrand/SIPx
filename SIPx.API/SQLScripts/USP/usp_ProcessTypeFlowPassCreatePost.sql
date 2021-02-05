CREATE PROCEDURE usp_ProcessTypeFlowPassCreatePost (
	@ProcessTypeFlowId int
	, @Sequence int
	, @ProcessTypeFlowPassTypeId int
	, @ProcessTypeFieldId int
	, @ProcessTypeFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTypeFlowPassestring nvarchar(max)
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

DECLARE @ProcessTypeId int;

SELECT @ProcessTypeId  = ProcessTypeId FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowID;
SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTypeFlowPasses SET Sequence = Sequence + 1 
WHERE ProcessTypeFlowId = @ProcessTypeFlowId 
	AND Sequence >= @Sequence

INSERT INTO ProcessTypeFlowPasses (
	ProcessTypeFlowID
	,ProcessTypeID
	, Sequence
	, ProcessTypeFlowPassTypeID
	, ProcessTypeFieldID
	, ProcessTypeFieldIDRole 
	, ComparisonOperatorId 
	, ProcessTypeFlowPassString 
	, ProcessTypeFlowPassInt 
	, ProcessTypeFlowPassDate 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeFlowID
	, @ProcessTypeID
	, @Sequence
	, @ProcessTypeFlowPassTypeID
	, @ProcessTypeFieldID
	, @ProcessTypeFieldIDRole 
	, @ComparisonOperatorId 
	, @ProcessTypeFlowPassestring 
	, @ProcessTypeFlowPassInt 
	, @ProcessTypeFlowPassDate 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeFlowPassId int	= scope_identity();

INSERT INTO ProcessTypeFlowPassLanguages (
	ProcessTypeFlowPassID
	, ProcessTypeFlowID
	, ProcessTypeID
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
	@NewProcessTypeFlowPassId 
	, @ProcessTypeFlowID
	, @ProcessTypeID
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



