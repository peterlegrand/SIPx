CREATE PROCEDURE [dbo].[usp_ContentTypeUpdate] (
	@ContentTypeLanguageID int
	, @ContentTypeID int
	, @ContentTypeGroupID int
	, @ProcessTemplateID int
	, @SecurityLevelID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationUpdate READONLY)

AS 
BEGIN TRANSACTION
UPDATE ContentTypes SET 
	ContentTypeGroupID= @ContentTypeGroupID
	, ProcessTemplateID = @ProcessTemplateID
	, SecurityLevelID = @SecurityLevelID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeID = @ContentTypeID

UPDATE  ContentTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ContentTypeLanguageID= @ContentTypeLanguageID

UPDATE ContentTypeClassifications SET 
ContentTypeClassifications.ContentTypeClassificationStatusID = UpdateData.ContentTypeClassificationStatusID
FROM ContentTypeClassifications
INNER JOIN
@ContentTypeClassificationTable UpdateData
ON UpdateData.ContentTypeClassificationID = ContentTypeClassifications.ContentTypeClassificationID

COMMIT TRANSACTION




