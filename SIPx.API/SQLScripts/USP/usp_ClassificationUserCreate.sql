CREATE PROCEDURE [dbo].[usp_ClassificationUserCreate] (
	@UserOfClassificationID nvarchar(450)
	, @ClassificationID int 
	, @ClassificationRelationTypeID int
	, @UserID nvarchar(450)) 
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

GO


