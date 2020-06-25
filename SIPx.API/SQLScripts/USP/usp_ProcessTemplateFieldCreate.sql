CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldCreate] (
	@ProcessTemplateID int
	, @ProcessTemplateFieldTypeID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
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
	, @User
	, getdate()
	, @User
	, getdate())


DECLARE @NewProcessTemplateFieldId int	= scope_identity();

INSERT INTO ProcessTemplateFieldLanguages (
	ProcessTemplateFieldID
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


