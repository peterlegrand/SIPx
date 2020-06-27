CREATE PROCEDURE [dbo].[usp_ClassificationRoleUpdate] (
	@ClassificationRoleID int
	, @RoleID nvarchar(450)
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
AS 

UPDATE ClassificationRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationRoleID = @ClassificationRoleID



