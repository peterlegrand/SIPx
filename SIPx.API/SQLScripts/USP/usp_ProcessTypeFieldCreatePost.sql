CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldCreatePost] (
	@ProcessTypeId int
	, @ProcessTypeFieldTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @MissingValueText nvarchar(max)
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
FROM ProcessTypeStageFields 
WHERE processtypeId = @ProcessTypeId
IF @NewSequence IS NULL
BEGIN 
SET @NewSequence = 1
END

SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ProcessTypeFields (
	ProcessTypeID
	, ProcessTypeFieldTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeID
	, @ProcessTypeFieldTypeID
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewProcessTypeFieldId int	= scope_identity();

INSERT INTO ProcessTypeFieldLanguages (
	ProcessTypeFieldID
	,ProcessTypeID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, MissingValueText
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewProcessTypeFieldId 
	,@ProcessTypeID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @MissingValueText
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

INSERT INTO ProcessTypeStageFields (ProcessTypeId, ProcessTypeStageId, ProcessTypeFieldId, ProcessTypeStageFieldStatusID, Sequence, ValueUpdateTypeID, ModifierID, ModifiedDate)
SELECT @ProcessTypeId, ProcessTypeStageID, @NewProcessTypeFieldId, 1, @NewSequence, 1, @CreatorId, Getdate() FROM ProcessTypeStages WHERE ProcessTypeId = @ProcessTypeId

	COMMIT TRANSACTION


