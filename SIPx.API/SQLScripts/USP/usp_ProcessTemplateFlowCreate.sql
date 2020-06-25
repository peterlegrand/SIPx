CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowCreate] (
	@ProcessTemplateID int
	, @ProcessTemplateFromStageID int
	, @ProcessTemplateToStageID int
	, @DateLevelID int
	, @OnTheFly bit
	, @Alhpabetically bit
	, @CanLink bit
	, @InDropDown bit
	, @InMenu bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
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
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION



