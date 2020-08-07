CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageCreate] (
	@ProcessTemplateId int
	, @ProcessTemplateTypeId int
	, @InToDo bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
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
	, @ProcessTemplateTypeID
	, @InToDo
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTemplateStageId int	= scope_identity();

INSERT INTO ProcessTemplateStageLanguages (
	ProcessTemplateStageID
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
