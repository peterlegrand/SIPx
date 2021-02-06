CREATE PROCEDURE usp_ContentCreatePost (
	@UserId nvarchar(450)
	, @ParentContentId int
	, @ContentTypeId int
	, @ContentStatusId int
	, @LanguageId int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelId int
	, @OrganizationId int
	, @ProjectId int
	, @ProcessId int
	, @ClassificationValueTable AS udt_ContentClassificationValuesNew READONLY)
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO Contents (
	ParentContentID
	, ContentTypeID
	, ContentStatusID
	, LanguageID
	, Title
	, SecurityLevelID
	, OrganizationID
	, ProjectID
	, ProcessID
	, CreatorID
	, ModifierID
	, CreatedDate
	, ModifiedDate) 
VALUES (	
	@ParentContentID
	, @ContentTypeID
	, @ContentStatusID
	, @LanguageID
	, @Title
	, @SecurityLevelID
	, @OrganizationID
	, @ProjectID
	, @ProcessID
	, @UserID
	, @UserID
	, getdate()
	, getdate())

DECLARE @NewContentId int	= scope_identity();

INSERT INTO ContentClassificationValues(ContentId, ClassificationValueId, ClassificationId, CreatorId, ModifierId, CreatedDate, ModifiedDate)
SELECT @NewContentId, ClassificationValueId, ClassificationId, @UserId,@UserId, getdate(), getdate() FROM @ClassificationValueTable

INSERT INTO ContentVersions (ContentId, Sequence, VersionStatusId, Description, CreatorID,ModifierID,CreatedDate, ModifiedDate)
VALUES(@NewContentId,1,2,@Description,@UserId,@UserId,getdate(),getdate())
COMMIT TRANSACTION

