CREATE PROCEDURE usp_ContentTypeUpdatePost (
	@ContentTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @HasAnyChildContentType bit
	, @HasAnyMatrixContentType bit
	, @Color char(9) 
	, @IconId int 
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ContentTypes SET 
	 Color = @Color
	, IconId = @IconId
	, HasAnyChildContentType = @HasAnyChildContentType 
	, HasAnyMatrixContentType =@HasAnyMatrixContentType 
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE ContentTypeId = @ContentTypeID

UPDATE  ContentTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ContentTypeId = @ContentTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


