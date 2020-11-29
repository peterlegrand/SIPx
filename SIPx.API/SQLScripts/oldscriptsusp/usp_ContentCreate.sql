CREATE PROCEDURE usp_ContentCreate (
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
BEGIN TRANSACTION
INSERT INTO Contents (
	ParentContentID
	, ContentTypeID
	, ContentStatusID
	, LanguageID
	, Title
	, Description
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
	, @Description
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
COMMIT TRANSACTION