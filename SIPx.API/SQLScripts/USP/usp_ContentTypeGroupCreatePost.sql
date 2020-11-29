CREATE PROCEDURE usp_ContentTypeGroupCreatePost (
	@Sequence int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
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
	, @UserId
	, getdate()
	, @UserId
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
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	COMMIT TRANSACTION
