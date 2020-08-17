CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleCreatePost] (
	@RoleId nvarchar(450)
	, @ClassificationValueId int 
	, @ClassificationId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())





