CREATE PROCEDURE [dbo].[usp_ContentTypeCreatePost] (
	@ContentTypeGroupId int 
	, @ProcessTemplateId int
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
	, @Color char(9)
	, @IconID int
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationNew READONLY)
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ContentTypes (
	ContentTypeGroupID
	, ProcessTemplateID
	, SecurityLevelID
	, Color 
	, IconID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ContentTypeGroupID
	, @ProcessTemplateID
	, @SecurityLevelID
	, @Color 
	, @IconID 
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

INSERT INTO ContentTypeClassifications ( ContentTypeId, ClassificationId, ContentTypeClassificationStatusId, ModifierId, ModifiedDate)
SELECT @NewContentTypeId, ClassificationId, ContentTypeClassificationStatusId, @UserId, getdate() FROM @ContentTypeClassificationTable


	COMMIT TRANSACTION
