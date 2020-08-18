CREATE PROCEDURE [dbo].[usp_ClassificationValueUserUpdatePost] (
	@ClassificationValueUserId int
	, @UserId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @ModifierId nvarchar(450)) 
AS 

UPDATE ClassificationValueUsers SET 
	UserID= @UserID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE ClassificationValueUserId = @ClassificationValueUserID


