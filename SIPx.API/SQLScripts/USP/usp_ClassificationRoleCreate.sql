CREATE PROCEDURE [dbo].[usp_ClassificationRoleCreate] (
	@RoleID nvarchar(450)
	, @ClassificationID int 
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
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



