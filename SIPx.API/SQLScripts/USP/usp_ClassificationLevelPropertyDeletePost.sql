CREATE PROCEDURE usp_ClassificationLevelPropertyDeletePost (@ClassificationLevelPropertyId int) 
AS 
DELETE FROM ClassificationLevelProperties WHERE ClassificationLevelProperties.ClassificationLevelPropertyId = @ClassificationLevelPropertyId

