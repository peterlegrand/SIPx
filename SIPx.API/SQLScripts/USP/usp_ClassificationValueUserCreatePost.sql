CREATE PROCEDURE [dbo].[usp_ClassificationValueUserCreatePost] (
	@UserOfClassificationValueId nvarchar(450)
	, @ClassificationValueId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450)) 
AS

DECLARE @ClassificationId int;
SELECT @ClassificationId = ClassificationId FROM ClassificationValues WHERE ClassificationValueId = @ClassificationValueId 
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
	@UserOfClassificationValueId
	, @ClassificationValueID
	, @ClassificationID
	, @ClassificationRelationTypeID
	, @UserID
	, getdate()
	, @UserID
	, getdate())



