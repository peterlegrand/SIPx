CREATE PROCEDURE usp_ContentTypeUpdatePost (
	 @ContentTypeId int
	, @ContentTypeGroupId int
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
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ContentTypes SET 
	ContentTypeGroupID= @ContentTypeGroupID
	, ProcessTemplateId = @ProcessTemplateID
	, SecurityLevelId = @SecurityLevelID
	, Color = @Color
	, IconID = @IconID
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
WHERE ContentTypeID= @ContentTypeID	
	AND LanguageID = @LanguageID

UPDATE ContentTypeClassifications SET ContentTypeClassifications.ContentTypeClassificationStatusId = UDT.ContentTypeClassificationStatusID , ModifierId = @UserId, ModifiedDate = getdate()
FROM  ContentTypeClassifications JOIN @ContentTypeClassificationTable UDT ON UDT.ClassificationId = ContentTypeClassifications.ClassificationID 
WHERE ContentTypeClassifications.ContentTypeID = @ContentTypeId

COMMIT TRANSACTION




