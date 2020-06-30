CREATE PROCEDURE [dbo].[usp_ClassificationRoleCreate] (
	@RoleId nvarchar(450)
	, @ClassificationId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ClassificationRoles (
	RoleID
	, ClassificationID
	, ClassificationRelationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@RoleID
	, @ClassificationID
	, @ClassificationRelationTypeID
	, @UserID
	, getdate()
	, @UserID
	, getdate())



