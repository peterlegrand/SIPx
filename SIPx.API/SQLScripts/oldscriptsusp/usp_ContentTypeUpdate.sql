CREATE PROCEDURE [dbo].[usp_ContentTypeUpdate] (
	@ContentTypeLanguageId int
	, @ContentTypeId int
	, @ContentTypeGroupId int
	, @ProcessTypeId int
	, @SecurityLevelId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationUpdate READONLY)

AS 
BEGIN TRANSACTION
UPDATE ContentTypes SET 
	ContentTypeGroupID= @ContentTypeGroupID
	, ProcessTypeId = @ProcessTypeID
	, SecurityLevelId = @SecurityLevelID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeId = @ContentTypeID

UPDATE  ContentTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ContentTypeLanguageID= @ContentTypeLanguageID

UPDATE ContentTypeClassifications SET 
ContentTypeClassifications.ObjectTypeClassificationStatusId = UpdateData.ObjectTypeClassificationStatusId
FROM ContentTypeClassifications
INNER JOIN
@ContentTypeClassificationTable UpdateData
ON UpdateData.ContentTypeClassificationId = ContentTypeClassifications.ContentTypeClassificationID

COMMIT TRANSACTION




