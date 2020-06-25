CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleCreate] (
	@RoleID nvarchar(450)
	, @ClassificationValueID int 
	, @ClassificationID int 
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
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





