CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationUpdatePost] (@ContentTypeClassificationId int, @ContentTypeClassificationStatusId int, @UserId nvarchar(450)) 
AS 
UPDATE ContentTypeClassifications 
SET ContentTypeClassificationStatusId = @ContentTypeClassificationStatusId
	, ModifierID = @UserId
	, ModifiedDate = getdate()
WHERE ContentTypeClassificationId = @ContentTypeClassificationId