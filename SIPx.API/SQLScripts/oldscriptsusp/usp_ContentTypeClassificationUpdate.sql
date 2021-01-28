CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationUpdate] (
	@ContentTypeClassificationId int
	, @ObjectTypeClassificationStatusId int
	, @UserId nvarchar(450)) 
AS 
UPDATE ContentTypeClassifications SET 
	ObjectTypeClassificationStatusId = @ObjectTypeClassificationStatusId
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeClassificationID= @ContentTypeClassificationID


