CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleCreatePost] (
	@RoleId nvarchar(450)
	, @ClassificationValueId int 
	, @ClassificationRelationTypeId int
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @ClassificationId int
SELECT @ClassificationId = ClassificationId FROM ClassificationValues WHERE ClassificationValueId = @ClassificationValueId;
INSERT INTO ClassificationValueRoles (
	RoleID
	, ClassificationValueID
	, ClassificationID
	, ClassificationRelationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@RoleID
	, @ClassificationValueID
	, @ClassificationID
	, @ClassificationRelationTypeID
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())





