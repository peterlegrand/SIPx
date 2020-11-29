CREATE PROCEDURE [dbo].[usp_ClassificationUserUpdate] (
	@UserIDOfClassificationUser nvarchar(450)
	, @ClassificationUserId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 
UPDATE ClassificationUsers SET 
	UserId = @UserIDOfClassificationUser
	, ClassificationRelationTypeId = @ClassificationRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationUserId = @ClassificationUserID

