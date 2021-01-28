CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationUpdatePost] (@ContentTypeClassificationId int, @ObjectTypeClassificationStatusId int, @UserId nvarchar(450)) 
AS 
UPDATE ContentTypeClassifications 
SET ObjectTypeClassificationStatusId = @ObjectTypeClassificationStatusId
	, ModifierID = @UserId
	, ModifiedDate = getdate()
WHERE ContentTypeClassificationId = @ContentTypeClassificationId