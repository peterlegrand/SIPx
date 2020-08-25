CREATE PROCEDURE usp_FrontContentNewPost (	@ContentTypeId int
	, @ContentStatusID int
	, @LanguageID int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelID int
	, @ProjectID int
	, @OrganizationID int
	, @CreatorID nvarchar(450)
	, @ClassificationValueTable AS udt_ContentClassificationValueInsert READONLY
)

AS
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
	, @CreatorID
	, getdate()
	, @CreatorID
	, getdate()
	)

DECLARE @NewContentId int	= scope_identity();

INSERT ContentClassificationValues (ContentId, ClassificationID, ClassificationValueID, CreatorID, CreatedDate, ModifierID, ModifiedDate)
SELECT @NewContentId, ClassificationId, ClassificationValueId, CreatorId, getdate(), CreatorId, Getdate() FROM @ClassificationValueTable

COMMIT TRANSACTION
