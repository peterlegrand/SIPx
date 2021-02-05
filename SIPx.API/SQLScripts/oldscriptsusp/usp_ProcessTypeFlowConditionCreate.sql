CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionCreate] (
	@ProcessTypeFlowId int
	, @Sequence int
	, @ProcessTypeFlowConditionTypeId int
	, @ProcessTypeFieldId int
	, @ProcessTypeFieldIDRole int
	, @ComparisonOperatorId int
	, @ProcessTypeFlowConditionString nvarchar(max)
	, @ProcessTypeFlowConditionInt int
	, @ProcessTypeFlowConditionDate DateTime
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @ProcessTypeId int;

SELECT @ProcessTypeId  = ProcessTypeId FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowID;
BEGIN TRANSACTION

UPDATE ProcessTypeFlowConditions SET Sequence = Sequence + 1 
WHERE ProcessTypeFlowId = @ProcessTypeFlowId 
	AND Sequence >= @Sequence

INSERT INTO ProcessTypeFlowConditions (
	ProcessTypeFlowID
	,ProcessTypeID
	, Sequence
	, ProcessTypeFlowConditionTypeID
	, ProcessTypeFieldID
	, ProcessTypeFieldIDRole 
	, ComparisonOperatorId 
	, ProcessTypeFlowConditionString 
	, ProcessTypeFlowConditionInt 
	, ProcessTypeFlowConditionDate 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeFlowID
	, @ProcessTypeID
	, @Sequence
	, @ProcessTypeFlowConditionTypeID
	, @ProcessTypeFieldID
	, @ProcessTypeFieldIDRole 
	, @ComparisonOperatorId 
	, @ProcessTypeFlowConditionString 
	, @ProcessTypeFlowConditionInt 
	, @ProcessTypeFlowConditionDate 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeFlowConditionId int	= scope_identity();

INSERT INTO ProcessTypeFlowConditionLanguages (
	ProcessTypeFlowConditionID
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
	@NewProcessTypeFlowConditionId 
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



