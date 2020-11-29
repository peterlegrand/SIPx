CREATE PROCEDURE usp_ContentUpdate (
	@UserId nvarchar(450)
	, @ContentId int
	, @ParentContentId int
	, @ContentStatusId int
	, @LanguageId int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelId int
	, @OrganizationId int
	, @ProjectId int
	, @ProcessId int
	, @ClassificationValueTable AS udt_ContentClassificationValuesUpdate READONLY)
AS 
BEGIN TRANSACTION
UPDATE Contents SET ParentContentId = @ParentContentId 
	, ContentStatusId = @ContentStatusID
	, LanguageId = @LanguageID
	, Title = @Title
	, Description = @Description
	, SecurityLevelId = @SecurityLevelID
	, OrganizationId = @OrganizationID
	, ProjectId = @ProjectID
	, ProcessId = @ProcessID
	, ModifierId = @UserID
	, ModifiedDate = getdate()

DECLARE @NewContentId int	= scope_identity();

UPDATE ContentClassificationValues
SET 
ContentClassificationValues.ClassificationValueId  = NewData.ClassificationValueId 
FROM ContentClassificationValues
INNER JOIN
@ClassificationValueTable NewData
ON NewData.ContentClassificationValueId = ContentClassificationValues.ContentClassificationValueID

INSERT INTO ContentClassificationValues (ContentId, ClassificationId, ClassificationValueId, CreatorId, ModifierId, CreatedDate, ModifiedDate) 
SELECT @ContentId, ClassificationId, ClassificationValueId, @UserId,@UserId, getdate(), getdate() 
FROM @ClassificationValueTable WHERE ContentClassificationValueId NOT IN (SELECT ContentClassificationValueId FROM ContentClassificationValues)

COMMIT TRANSACTION