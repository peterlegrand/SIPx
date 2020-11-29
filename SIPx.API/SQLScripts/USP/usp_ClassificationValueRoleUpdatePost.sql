CREATE PROCEDURE usp_ClassificationValueRoleUpdatePost (
	@ClassificationValueRoleId int
	, @RoleId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 

UPDATE ClassificationValueRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE ClassificationValueRoleId = @ClassificationValueRoleID


