CREATE PROCEDURE [dbo].[usp_ClassificationValueUserUpdatePost] (
	@ClassificationValueUserId int
	, @UserOfClassificationId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserID nvarchar(450)) 
AS 

UPDATE ClassificationValueUsers SET 
	UserID= @ClassificationValueUserId
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueUserId = @ClassificationValueUserID


