CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationUpdate] (
	@ContentTypeClassificationID int
	, @ContentTypeClassificationStatusID int
	, @UserID nvarchar(450)) 
AS 
UPDATE ContentTypeClassifications SET 
	ContentTypeClassificationStatusID = @ContentTypeClassificationStatusID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ContentTypeClassificationID= @ContentTypeClassificationID


