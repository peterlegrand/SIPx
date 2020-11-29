CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleUpdate] (
	@ClassificationValueRoleId int
	, @RoleId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 

UPDATE ClassificationValueRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationValueRoleId = @ClassificationValueRoleID


