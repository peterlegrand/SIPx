CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupCreate] (
	@Sequence int	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ProcessTemplateGroups SET Sequence = Sequence + 1 
WHERE Sequence >= @Sequence

INSERT INTO ProcessTemplateGroups (
	Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Sequence
	, @User
	, getdate()
	, @User
	, getdate())


DECLARE @NewProcessTemplateGroupId int	= scope_identity();

INSERT INTO ProcessTemplateGroupLanguages (
	ProcessTemplateGroupID
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
	@NewProcessTemplateGroupId 
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
GO


