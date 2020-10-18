CREATE PROCEDURE usp_ClassificationRoleUpdatePost (
	@RoleId nvarchar(450)
	, @ClassificationRoleId int
	, @ClassificationRelationTypeId int
	, @UserID nvarchar(450)) 
AS 
UPDATE  ClassificationRoles SET 
	RoleId = @RoleId
	, ClassificationRelationTypeId = @ClassificationRelationTypeId
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationRoleId= @ClassificationRoleId
