CREATE PROCEDURE usp_ClassificationUserUpdatePost (
	@UserId nvarchar(450)
	, @ClassificationId int
	, @ClassificationRelationTypeId int
	, @ModifierID nvarchar(450)) 
AS 
UPDATE  ClassificationUsers SET 
	UserId = @UserId
	, ClassificationRelationTypeId = @ClassificationRelationTypeId
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE ClassificationId= @ClassificationId
