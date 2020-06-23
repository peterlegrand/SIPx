CREATE PROCEDURE [dbo].[usp_ContentTypeCreate] (
	@ContentTypeGroupID int 
	, @ProcessTemplateID int
	, @SecurityLevelID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationNew READONLY)
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @User
	AND UserPreferences.PreferenceTypeID = 1 ;
BEGIN TRANSACTION

INSERT INTO ContentTypes (
	ContentTypeGroupID
	, ProcessTemplateID
	, SecurityLevelID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ContentTypeGroupID
	, @ProcessTemplateID
	, @SecurityLevelID
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

INSERT INTO ContentTypeClassifications ( ContentTypeID, ClassificationID, ContentTypeClassificationStatusID, ModifierID, ModifiedDate)
SELECT @NewContentTypeId, ClassificationID, ContentTypeClassificationStatusID, @User, getdate() FROM @ContentTypeClassificationTable


	COMMIT TRANSACTION
