CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageCreate] (
	@ProcessTemplateID int
	, @ProcessTemplateTypeID int
	, @IsEndStage bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ProcessTemplateStages (
	ProcessTemplateID
	, ProcessTemplateStageTypeID
	, IsEndStage
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateID
	, @ProcessTemplateTypeID
	, @IsEndStage
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION
