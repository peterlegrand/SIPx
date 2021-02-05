CREATE PROCEDURE [dbo].[usp_ContentTypeCreate] (
	@ContentTypeGroupId int 
	, @ProcessTypeId int
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationNew READONLY)
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN TRANSACTION

INSERT INTO ContentTypes (
	ContentTypeGroupID
	, ProcessTypeID
	, SecurityLevelID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ContentTypeGroupID
	, @ProcessTypeID
	, @SecurityLevelID
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewContentTypeId int	= scope_identity();

INSERT INTO ContentTypeLanguages (
	ContentTypeId
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
	@NewContentTypeId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

INSERT INTO ContentTypeClassifications ( ContentTypeId, ClassificationId, ObjectTypeClassificationStatusId, ModifierId, ModifiedDate)
SELECT @NewContentTypeId, ClassificationId, ObjectTypeClassificationStatusId, @UserId, getdate() FROM @ContentTypeClassificationTable


	COMMIT TRANSACTION
