CREATE PROCEDURE usp_ContentCreate (
	@User nvarchar(450)
	, @ParentContentID int
	, @ContentTypeID int
	, @ContentStatusID int
	, @LanguageID int
	, @Title nvarchar(50)
	, @Description nvarchar(max)
	, @SecurityLevelID int
	, @OrganizationID int
	, @ProjectID int
	, @ProcessID int
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
	, @User
	, @User
	, getdate()
	, getdate())

DECLARE @NewContentID int	= scope_identity();

INSERT INTO ContentClassificationValues(ContentID, ClassificationValueID, ClassificationID, CreatorID, ModifierID, CreatedDate, ModifiedDate)
SELECT @NewContentID, ClassificationValueID, ClassificationID, @User,@User, getdate(), getdate() FROM @ClassificationValueTable
COMMIT TRANSACTION