CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationUpdate] (
	@ContentTypeClassificationID int
	, @ContentTypeClassificationStatusID int
	, @User nvarchar(450)) 
AS 
UPDATE ContentTypeClassifications SET 
	ContentTypeClassificationStatusID = @ContentTypeClassificationStatusID
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE ContentTypeClassificationID= @ContentTypeClassificationID


