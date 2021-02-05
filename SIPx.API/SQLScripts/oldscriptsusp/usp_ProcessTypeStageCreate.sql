CREATE PROCEDURE [dbo].[usp_ProcessTypeStageCreate] (
	@ProcessTypeId int
	, @ProcessTypeTypeId int
	, @InToDo bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
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
	, @ProcessTypeTypeID
	, @InToDo
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTypeStageId int	= scope_identity();

INSERT INTO ProcessTypeStageLanguages (
	ProcessTypeStageID
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
