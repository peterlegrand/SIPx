CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageCreatePost] (
	@ProcessTemplateId int
	, @ProcessTemplateStageTypeId int
	, @InToDo bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION

INSERT INTO ProcessTemplateStages (
	ProcessTemplateID
	, ProcessTemplateStageTypeID
	, InToDo
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateID
	, @ProcessTemplateStageTypeID
	, @InToDo
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewProcessTemplateStageId int	= scope_identity();

INSERT INTO ProcessTemplateStageLanguages (
	ProcessTemplateStageID
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
	@NewProcessTemplateStageId 
	, @ProcessTemplateID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	INSERT INTO ProcessTemplateStageFields(
	ProcessTemplateId
	, ProcessTemplateFieldID
	, ProcessTemplateStageId
	, ProcessTemplateStageFieldStatusID
	, Sequence
	, ValueUpdateTypeID
	, ModifierID
	, ModifiedDate)
SELECT 
	@ProcessTemplateId
	,ProcessTemplateFieldId
	, @NewProcessTemplateStageId
	, 1
	, ROW_NUMBER()  OVER(ORDER BY ProcessTemplateFieldID ASC) AS Sequence
	,1 
	, @CreatorId
	, getdate()
	FROM ProcessTemplateFields WHERE ProcessTemplateID  = @ProcessTemplateId



	COMMIT TRANSACTION
