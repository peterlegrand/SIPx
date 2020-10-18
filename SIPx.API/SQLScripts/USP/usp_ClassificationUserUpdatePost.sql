CREATE PROCEDURE usp_ClassificationUserUpdatePost (
	 @ClassificationUserId int
	, @UserOfClassificationId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)
) 
AS 
UPDATE  ClassificationUsers SET 
	UserId = @UserOfClassificationId
	, ClassificationRelationTypeId = @ClassificationRelationTypeId
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ClassificationUserId= @ClassificationUserId
