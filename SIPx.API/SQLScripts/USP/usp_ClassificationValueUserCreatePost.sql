CREATE PROCEDURE [dbo].[usp_ClassificationValueUserCreatePost] (
	@UserOfClassificationId nvarchar(450)
	, @ClassificationValueId int 
	, @ClassificationId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ClassificationValueUsers (
	UserID
	, ClassificationValueID
	, ClassificationID
	, ClassificationRelationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserOfClassificationID
	, @ClassificationValueID
	, @ClassificationID
	, @ClassificationRelationTypeID
	, @UserID
	, getdate()
	, @UserID
	, getdate())



