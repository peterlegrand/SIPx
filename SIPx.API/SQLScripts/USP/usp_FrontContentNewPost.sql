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
	, @NewId int OUTPUT
	, @ClassificationValueTable AS udt_ContentClassificationValueInsert READONLY
)

AS
DECLARE @IsRelationBasedEdit bit 
, @IsRelationBasedRead bit 
, @IsOrganizationBasedEdit bit 
, @IsOrganizationBasedEditSub bit 
, @IsOrganizationBasedEditParent bit 
, @IsOrganizationBasedRead bit 
, @IsOrganizationBasedReadSub bit 
, @IsOrganizationBasedReadParent bit 
, @IsProjectBasedEdit bit 
, @IsProjectBasedEditSub bit 
, @IsProjectBasedEditParent bit 
, @IsProjectBasedRead bit 
, @IsProjectBasedReadSub bit 
, @IsProjectBasedReadParent bit 


select 
 @IsRelationBasedEdit = IsRelationBasedEdit 
 , @IsRelationBasedRead = IsRelationBasedRead 
 , @IsOrganizationBasedEdit = IsOrganizationBasedEdit
 , @IsOrganizationBasedEditSub = IsOrganizationBasedEditSub
 , @IsOrganizationBasedEditParent = IsOrganizationBasedEditParent 
 , @IsOrganizationBasedRead = IsOrganizationBasedRead 
 , @IsOrganizationBasedReadSub = IsOrganizationBasedReadSub 
 , @IsOrganizationBasedReadParent = IsOrganizationBasedReadParent 
 , @IsProjectBasedEdit =  IsProjectBasedEdit 
 , @IsProjectBasedEditSub  = IsProjectBasedEditSub 
 , @IsProjectBasedEditParent = IsProjectBasedEditParent 
 , @IsProjectBasedRead = IsProjectBasedRead
 , @IsProjectBasedReadSub = IsProjectBasedReadSub 
	, @IsProjectBasedReadParent  = IsProjectBasedReadParent
from contenttypes
WHERE ContentTypeId = @contentTypeId

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
	, ModifiedDate
	, ownerId
	,  IsRelationBasedEdit   
,  IsRelationBasedRead   
,  IsOrganizationBasedEdit   
,  IsOrganizationBasedEditSub   
,  IsOrganizationBasedEditParent   
,  IsOrganizationBasedRead   
,  IsOrganizationBasedReadSub   
,  IsOrganizationBasedReadParent   
,  IsProjectBasedEdit   
,  IsProjectBasedEditSub   
,  IsProjectBasedEditParent   
,  IsProjectBasedRead   
,  IsProjectBasedReadSub   
,  IsProjectBasedReadParent   
)
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
	, @UserID
	, @IsRelationBasedEdit   
, @IsRelationBasedRead   
, @IsOrganizationBasedEdit   
, @IsOrganizationBasedEditSub   
, @IsOrganizationBasedEditParent   
, @IsOrganizationBasedRead   
, @IsOrganizationBasedReadSub   
, @IsOrganizationBasedReadParent   
, @IsProjectBasedEdit   
, @IsProjectBasedEditSub   
, @IsProjectBasedEditParent   
, @IsProjectBasedRead   
, @IsProjectBasedReadSub   
, @IsProjectBasedReadParent  )

SET @NewId 	= scope_identity();

INSERT ContentClassificationValues (ContentId, ClassificationID, ClassificationValueID, CreatorID, CreatedDate, ModifierID, ModifiedDate)
SELECT @NewId, ClassificationId, ClassificationValueId, @UserID, getdate(), @UserID, Getdate() FROM @ClassificationValueTable


COMMIT TRANSACTION
