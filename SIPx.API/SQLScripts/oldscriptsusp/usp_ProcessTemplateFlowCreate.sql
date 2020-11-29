CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowCreate] (
	@ProcessTemplateId int
	, @ProcessTemplateFromStageId int
	, @ProcessTemplateToStageId int
	, @DateLevelId int
	, @OnTheFly bit
	, @Alhpabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ProcessTemplateFlows (
	ProcessTemplateID
	, ProcessTemplateFromStageID
	, ProcessTemplateToStageID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ProcessTemplateID
	, @ProcessTemplateFromStageID
	, @ProcessTemplateToStageID
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewProcessTemplateFlowId int	= scope_identity();

INSERT INTO ProcessTemplateFlowLanguages (
	ProcessTemplateFlowID
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
	@NewProcessTemplateFlowId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	COMMIT TRANSACTION



