CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionCreatePost] (
	@ProcessTemplateFlowId int
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

DECLARE @ProcessTemplateId int;

SELECT @ProcessTemplateId  = ProcessTemplateId FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID;
SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTemplateFlowConditions SET Sequence = Sequence + 1 
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId 
	AND Sequence >= @Sequence

INSERT INTO ProcessTemplateFlowConditions (
	ProcessTemplateFlowID
	,ProcessTemplateID
	, Sequence
	, ProcessTemplateFlowConditionTypeID
	, ProcessTemplateFieldID
	, ProcessTemplateFieldIDRole 
	, ComparisonOperatorId 
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
	, @ComparisonOperatorId 
	, @ProcessTemplateFlowConditionString 
	, @ProcessTemplateFlowConditionInt 
	, @ProcessTemplateFlowConditionDate 
	, @UserID
	, getdate()
	, @UserID
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION



