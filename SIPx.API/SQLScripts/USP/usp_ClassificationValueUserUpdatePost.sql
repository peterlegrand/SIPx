CREATE PROCEDURE [dbo].[usp_ClassificationValueUserUpdatePost] (
	@ClassificationValueUserId int
	, @UserOfClassificationValueId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserID nvarchar(450)) 
AS 

UPDATE ClassificationValueUsers SET 
	UserID= @UserOfClassificationValueId
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueUserId = @ClassificationValueUserID


