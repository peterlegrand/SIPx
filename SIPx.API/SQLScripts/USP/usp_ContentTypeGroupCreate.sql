CREATE PROCEDURE [dbo].[usp_ContentTypeGroupCreate] (
	@Sequence int 
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ContentTypeGroups SET Sequence = Sequence + 1 
	WHERE Sequence >= @Sequence

INSERT INTO ContentTypeGroups (
	Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Sequence
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewContentTypeGroupId int	= scope_identity();

INSERT INTO ContentTypeGroupLanguages (
	ContentTypeGroupId
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
	@NewContentTypeGroupId 
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
