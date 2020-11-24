CREATE PROCEDURE usp_ClassificationLevelPropertyCreatePost (@ClassificationLevelId int, @PropertyId int, @ClassificationLevelPropertyStatusId int, @UserId nvarchar(450)) 
AS 
DECLARE @ClassificationId int;
SELECT @ClassificationId = ClassificationId FROM Classificationlevels WHERE ClassificationLevelID = @ClassificationLevelId;
INSERT ClassificationLevelProperties (ClassificationLevelId , ClassificationId, PropertyId , ClassificationLevelPropertyStatusId, CreatorID, ModifierID, CreatedDate, ModifiedDate)
VALUES (@ClassificationLevelId , @ClassificationId, @PropertyId , @ClassificationLevelPropertyStatusId, @UserId, @UserId, Getdate(), Getdate())

