CREATE PROCEDURE [dbo].[usp_ContentTypeGroupCreatePost] (
	@Sequence int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorId
	AND UserPreferences.PreferenceTypeId = 1 ;

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
	, @CreatorId
	, getdate()
	, @CreatorId
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
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	COMMIT TRANSACTION
