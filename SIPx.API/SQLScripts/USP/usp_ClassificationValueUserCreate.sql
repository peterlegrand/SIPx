CREATE PROCEDURE [dbo].[usp_ClassificationValueUserCreate] (
	@UserOfClassificationID nvarchar(450)
	, @ClassificationValueID int 
	, @ClassificationID int 
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
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

GO


