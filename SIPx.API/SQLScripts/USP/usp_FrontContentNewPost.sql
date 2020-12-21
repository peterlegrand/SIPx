CREATE PROCEDURE usp_FrontContentNewPost (	
	@ContentTypeId int
	, @ContentStatusID int
	, @LanguageID int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelID int
	, @ProjectID int
	, @OrganizationID int
	, @UserID nvarchar(450)
	, @ClassificationValueTable AS udt_ContentClassificationValueInsert READONLY
)

AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO Contents (
	ContentTypeId
	, ContentStatusID
	, LanguageID
	, Title
	, Description
	, SecurityLevelID
	, ProjectID
	, OrganizationID
	, ProcessID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
	VALUES
	(	@ContentTypeId
	, @ContentStatusID
	, @LanguageID
	, @Title
	, @Description
	, @SecurityLevelID
	, @ProjectID
	, @OrganizationID
	,1
	, @UserID
	, getdate()
	, @UserID
	, getdate()
	)

DECLARE @NewContentId int	= scope_identity();

INSERT ContentClassificationValues (ContentId, ClassificationID, ClassificationValueID, CreatorID, CreatedDate, ModifierID, ModifiedDate)
SELECT @NewContentId, ClassificationId, ClassificationValueId, @UserID, getdate(), @UserID, Getdate() FROM @ClassificationValueTable

COMMIT TRANSACTION
