CREATE PROCEDURE usp_ClassificationLevelPropertyUpdatePost (@UserId nvarchar(450), @ClassificationLevelPropertyId int, @ClassificationLevelPropertyStatusId int) 
AS 
UPDATE ClassificationLevelProperties 
SET ClassificationLevelPropertyStatusId = @ClassificationLevelPropertyStatusId
	, ModifierID = @UserId
	, ModifiedDate = Getdate() 
WHERE ClassificationLevelPropertyId = @ClassificationLevelPropertyId 

