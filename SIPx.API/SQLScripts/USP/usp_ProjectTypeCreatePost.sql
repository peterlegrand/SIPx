CREATE PROCEDURE usp_ContentTypeCreatePost (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CodePrefix nvarchar(25)=''
	, @CodeSuffix nvarchar(25)=''
	, @CodeTypeId int
	, @HasAnyChildContentType bit
	, @HasAnyMatrixContentType bit
	, @Color char(9)
	, @IconID int
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

INSERT INTO ContentTypes (
	Color 
	, IconID 
	, CodePrefix
	, CodeSuffix
	, CodeTypeId
	, HasAnyChildContentType
	, HasAnyMatrixContentType
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Color 
	, @IconID 
	, @CodePrefix
	, @CodeSuffix
	, @CodeTypeId
	, @HasAnyChildContentType
	, @HasAnyMatrixContentType
	, @UserId
	, getdate()
	, @UserId
	, getdate())


DECLARE @NewContentTypeId int	= scope_identity();

INSERT INTO ContentTypeLanguages (
	ContentTypeID
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
	@NewContentTypeID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	INSERT INTO ContentTypeClassifications (ContentTypeId, ClassificationID, ObjectTypeClassificationStatusID, ModifierID, ModifiedDate)
SELECT @NewContentTypeID, ClassificationID, 2, @UserId, getDate() FROM Classifications
	

	COMMIT TRANSACTION
