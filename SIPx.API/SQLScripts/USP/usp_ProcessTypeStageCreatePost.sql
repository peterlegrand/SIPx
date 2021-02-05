CREATE PROCEDURE [dbo].[usp_ProcessTypeStageCreatePost] (
	@ProcessTypeId int
	, @ProcessTypeStageTypeId int
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

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ProcessTypeStages (
	ProcessTypeID
	, ProcessTypeStageTypeID
	, InToDo
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTypeID
	, @ProcessTypeStageTypeID
	, @InToDo
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


DECLARE @NewProcessTypeStageId int	= scope_identity();

INSERT INTO ProcessTypeStageLanguages (
	ProcessTypeStageID
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
	@NewProcessTypeStageId 
	, @ProcessTypeID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	INSERT INTO ProcessTypeStageFields(
	ProcessTypeId
	, ProcessTypeFieldID
	, ProcessTypeStageId
	, ProcessTypeStageFieldStatusID
	, Sequence
	, ValueUpdateTypeID
	, ModifierID
	, ModifiedDate)
SELECT 
	@ProcessTypeId
	,ProcessTypeFieldId
	, @NewProcessTypeStageId
	, 1
	, ROW_NUMBER()  OVER(ORDER BY ProcessTypeFieldID ASC) AS Sequence
	,1 
	, @CreatorId
	, getdate()
	FROM ProcessTypeFields WHERE ProcessTypeID  = @ProcessTypeId



	COMMIT TRANSACTION
