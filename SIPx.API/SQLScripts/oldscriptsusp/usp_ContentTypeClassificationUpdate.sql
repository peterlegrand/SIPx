CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationUpdate] (
	@ContentTypeClassificationId int
	, @ContentTypeClassificationStatusId int
	, @UserId nvarchar(450)) 
AS 
UPDATE ContentTypeClassifications SET 
	ContentTypeClassificationStatusId = @ContentTypeClassificationStatusID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeClassificationID= @ContentTypeClassificationID


