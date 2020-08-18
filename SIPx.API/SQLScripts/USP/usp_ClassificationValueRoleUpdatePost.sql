CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleUpdatePost] (
	@ClassificationValueRoleId int
	, @RoleId nvarchar(450)
	, @ClassificationRelationTypeId int
	, @ModifierId nvarchar(450)) 
AS 

UPDATE ClassificationValueRoles SET 
	RoleID= @RoleID
	, ClassificationRelationTypeID= @ClassificationRelationTypeID
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE ClassificationValueRoleId = @ClassificationValueRoleID


