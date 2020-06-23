CREATE PROCEDURE [dbo].[usp_ClassificationValueUserUpdate] (
	@ClassificationValueUserID int
	, @UserIDforValue nvarchar(450)
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
AS 

UPDATE ClassificationValueUsers SET 
	UserID= @UserIDforValue
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueUserID = @ClassificationValueUserID


