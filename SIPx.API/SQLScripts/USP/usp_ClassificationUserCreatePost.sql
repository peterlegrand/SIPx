CREATE PROCEDURE [dbo].[usp_ClassificationUserCreatePost] (
	@UserOfClassificationId nvarchar(450)
	, @ClassificationId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS 
INSERT INTO ClassificationUsers (
	UserID
	, ClassificationID
	, ClassificationRelationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserOfClassificationID
	, @ClassificationID
	, @ClassificationRelationTypeID
	, @UserID
	, getdate()
	, @UserID
	, getdate())



