CREATE PROCEDURE usp_ClassificationLevelPropertyUpdatePost (
	@UserId nvarchar(450)
	, @ClassificationLevelPropertyId int
	, @PropertyStatusId int) 
AS 
UPDATE ClassificationLevelProperties 
SET PropertyStatusId = @PropertyStatusId
	, ModifierID = @UserId
	, ModifiedDate = Getdate() 
WHERE ClassificationLevelPropertyId = @ClassificationLevelPropertyId 

