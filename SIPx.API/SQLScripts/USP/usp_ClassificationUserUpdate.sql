CREATE PROCEDURE [dbo].[usp_ClassificationUserUpdate] (
	@UserIDOfClassificationUser nvarchar(450)
	, @ClassificationUserID int 
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
AS 
UPDATE ClassificationUsers SET 
	UserID = @UserIDOfClassificationUser
	, ClassificationRelationTypeID = @ClassificationRelationTypeID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationUserID = @ClassificationUserID

