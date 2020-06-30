CREATE PROCEDURE [dbo].[usp_ClassificationRoleUpdate] (
	@ClassificationRoleId int
	, @RoleId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 

UPDATE ClassificationRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationRoleId = @ClassificationRoleID



