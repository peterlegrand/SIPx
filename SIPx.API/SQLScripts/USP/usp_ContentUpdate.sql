CREATE PROCEDURE usp_ContentUpdate (
	@UserID nvarchar(450)
	, @ContentID int
	, @ParentContentID int
	, @ContentStatusID int
	, @LanguageID int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelID int
	, @OrganizationID int
	, @ProjectID int
	, @ProcessID int
	, @ClassificationValueTable AS udt_ContentClassificationValuesUpdate READONLY)
AS 
BEGIN TRANSACTION
UPDATE Contents SET ParentContentID = @ParentContentID 
	, ContentStatusID = @ContentStatusID
	, LanguageID = @LanguageID
	, Title = @Title
	, Description = @Description
	, SecurityLevelID = @SecurityLevelID
	, OrganizationID = @OrganizationID
	, ProjectID = @ProjectID
	, ProcessID = @ProcessID
	, ModifierID = @UserID
	, ModifiedDate = getdate()

DECLARE @NewContentID int	= scope_identity();

UPDATE ContentClassificationValues
SET 
ContentClassificationValues.ClassificationValueID  = NewData.ClassificationValueID 
FROM ContentClassificationValues
INNER JOIN
@ClassificationValueTable NewData
ON NewData.ContentClassificationValueID = ContentClassificationValues.ContentClassificationValueID

INSERT INTO ContentClassificationValues (ContentID, ClassificationID, ClassificationValueID, CreatorID, ModifierID, CreatedDate, ModifiedDate) 
SELECT @ContentID, ClassificationID, ClassificationValueID, @UserID,@UserID, getdate(), getdate() 
FROM @ClassificationValueTable WHERE ContentClassificationValueID NOT IN (SELECT ContentClassificationValueID FROM ContentClassificationValues)

COMMIT TRANSACTION