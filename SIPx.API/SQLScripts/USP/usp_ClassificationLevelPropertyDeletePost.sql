CREATE PROCEDURE usp_ClassificationLevelPropertyDeletePost (@UserId nvarchar(450), @ClassificationLevelPropertyId int) 
AS 
DELETE FROM ClassificationLevelProperties WHERE ClassificationLevelProperties.ClassificationLevelPropertyId = @ClassificationLevelPropertyId


