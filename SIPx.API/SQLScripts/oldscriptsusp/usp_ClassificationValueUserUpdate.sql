CREATE PROCEDURE [dbo].[usp_ClassificationValueUserUpdate] (
	@ClassificationValueUserId int
	, @UserIDforValue nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 

UPDATE ClassificationValueUsers SET 
	UserID= @UserIDforValue
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueUserId = @ClassificationValueUserID


