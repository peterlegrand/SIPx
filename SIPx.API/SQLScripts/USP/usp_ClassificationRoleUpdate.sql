CREATE PROCEDURE [dbo].[usp_ClassificationRoleUpdate] (
	@ClassificationRoleID int
	, @RoleID nvarchar(450)
	, @ClassificationRelationTypeID int
	, @User nvarchar(450)) 
AS 

UPDATE ClassificationRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE ClassificationRoleID = @ClassificationRoleID



