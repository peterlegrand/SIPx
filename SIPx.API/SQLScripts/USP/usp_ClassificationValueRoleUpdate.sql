CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleUpdate] (
	@ClassificationValueRoleID int
	, @RoleID nvarchar(450)
	, @ClassificationRelationTypeID int
	, @User nvarchar(450)) 
AS 

UPDATE ClassificationValueRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE ClassificationValueRoleID = @ClassificationValueRoleID


