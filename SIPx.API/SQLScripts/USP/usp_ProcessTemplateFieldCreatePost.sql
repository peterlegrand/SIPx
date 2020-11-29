CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldCreatePost] (
	@ProcessTemplateId int
	, @ProcessTemplateFieldTypeId int
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

DECLARE @NewSequence int;
SET @NewSequence = 1
SELECT @NewSequence = MAX(Sequence)+1  
FROM ProcessTemplateStageFields 
WHERE processtemplateId = @ProcessTemplateId
IF @NewSequence IS NULL
BEGIN 
SET @NewSequence = 1
END

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ProcessTemplateFields (
	ProcessTemplateID
	, ProcessTemplateFieldTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateID
	, @ProcessTemplateFieldTypeID
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewProcessTemplateFieldId int	= scope_identity();

INSERT INTO ProcessTemplateFieldLanguages (
	ProcessTemplateFieldID
	,ProcessTemplateID
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
	@NewProcessTemplateFieldId 
	,@ProcessTemplateID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

INSERT INTO ProcessTemplateStageFields (ProcessTemplateId, ProcessTemplateStageId, ProcessTemplateFieldId, ProcessTemplateStageFieldStatusID, Sequence, ValueUpdateTypeID, ModifierID, ModifiedDate)
SELECT @ProcessTemplateId, ProcessTemplateStageID, @NewProcessTemplateFieldId, 1, @NewSequence, 1, @CreatorId, Getdate() FROM ProcessTemplateStages WHERE ProcessTemplateId = @ProcessTemplateId

	COMMIT TRANSACTION


