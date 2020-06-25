CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeCreate] (
	@LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO ProcessTemplateStageTypes (
	CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@User
	, getdate()
	, @User
	, getdate())


DECLARE @NewProcessTemplateStageTypeId int	= scope_identity();

INSERT INTO ProcessTemplateStageTypeLanguages (
	ProcessTemplateStageTypeID
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
	@NewProcessTemplateStageTypeID
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
