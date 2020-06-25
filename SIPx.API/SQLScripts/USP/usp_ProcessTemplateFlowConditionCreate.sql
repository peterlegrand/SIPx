CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionCreate] (
	@ProcessTemplateFlowID int
	, @Sequence int
	, @ProcessTemplateFlowConditionTypeID int
	, @ProcessTemplateFieldID int
	, @ProcessTemplateFieldIDRole int
	, @ComparisonOperatorID int
	, @ProcessTemplateFlowConditionString nvarchar(max)
	, @ProcessTemplateFlowConditionInt int
	, @ProcessTemplateFlowConditionDate DateTime
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 

DECLARE @ProcessTemplateID int;

SELECT @ProcessTemplateID  = ProcessTemplateID FROM ProcessTemplateFlows WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID;
BEGIN TRANSACTION

UPDATE ProcessTemplateFlowConditions SET Sequence = Sequence + 1 
WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID 
	AND Sequence >= @Sequence

INSERT INTO ProcessTemplateFlowConditions (
	ProcessTemplateFlowID
	,ProcessTemplateID
	, Sequence
	, ProcessTemplateFlowConditionTypeID
	, ProcessTemplateFieldID
	, ProcessTemplateFieldIDRole 
	, ComparisonOperatorID 
	, ProcessTemplateFlowConditionString 
	, ProcessTemplateFlowConditionInt 
	, ProcessTemplateFlowConditionDate 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateFlowID
	, @ProcessTemplateID
	, @Sequence
	, @ProcessTemplateFlowConditionTypeID
	, @ProcessTemplateFieldID
	, @ProcessTemplateFieldIDRole 
	, @ComparisonOperatorID 
	, @ProcessTemplateFlowConditionString 
	, @ProcessTemplateFlowConditionInt 
	, @ProcessTemplateFlowConditionDate 
	, @User
	, getdate()
	, @User
	, getdate())


DECLARE @NewProcessTemplateFlowConditionId int	= scope_identity();

INSERT INTO ProcessTemplateFlowConditionLanguages (
	ProcessTemplateFlowConditionID
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
	@NewProcessTemplateFlowConditionId 
	, @ProcessTemplateFlowID
	, @ProcessTemplateID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION



