CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleUpdate] (
	@ClassificationValueRoleID int
	, @RoleID nvarchar(450)
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
AS 

UPDATE ClassificationValueRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueRoleID = @ClassificationValueRoleID


