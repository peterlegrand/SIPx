CREATE PROCEDURE [dbo].[usp_ContentTypeCreatePost] (
	@ContentTypeGroupId int 
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ContentProcessTypeId int
	, @ContentVersionProcessTypeId int
	, @SecurityLevelId int
	, @ObjectTypeStatusId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)
	, @IsRelationBasedOwnership bit
	, @IsProjectBasedOwnership  bit
	, @IsOrganizationBasedOwnership bit 
	, @IsFreeOwnership  bit
	, @IsRelationBasedEdit  bit
	, @IsRelationBasedEditSelectable  bit
	, @IsOrganizationBasedEdit  bit
	, @IsOrganizationBasedEditSelectable  bit
	, @IsOrganizationBasedEditSub  bit
	, @IsOrganizationBasedEditParent  bit
	, @IsProjectBasedEdit  bit
	, @IsProjectBasedEditSelectable  bit
	, @IsProjectBasedEditSub  bit
	, @IsProjectBasedEditParent  bit
	, @IsFreeEdit  bit
	, @IsFreeEditSelectable  bit
	, @IsRelationBasedRead  bit
	, @IsRelationBasedReadSelectable  bit
	, @IsOrganizationBasedRead  bit
	, @IsOrganizationBasedReadSelectable  bit
	, @IsOrganizationBasedReadSub  bit
	, @IsOrganizationBasedReadParent  bit
	, @IsProjectBasedRead  bit
	, @IsProjectBasedReadSelectable  bit
	, @IsProjectBasedReadSub  bit
	, @IsProjectBasedReadParent  bit
	, @IsFreeRead  bit
	, @IsFreeReadSelectable  bit
	, @Color char(9)
	, @IconID int
	, @ContentTypeClassificationTable AS udt_ContentTypeClassificationNew READONLY)
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ContentTypes (
	ContentTypeGroupID
	, CodePrefix 
	, CodeSuffix 
	, CodeTypeId 
	, ContentProcessTypeID
	, ContentVersionProcessTypeId
	, SecurityLevelID
	, ObjectTypeStatusId
	, IsRelationBasedOwnership
    , IsProjectBasedOwnership 
	, IsOrganizationBasedOwnership 
	, IsFreeOwnership 
	, IsRelationBasedEdit 
	, IsRelationBasedEditSelectable 
	, IsOrganizationBasedEdit 
	, IsOrganizationBasedEditSelectable 
	, IsOrganizationBasedEditSub 
	, IsOrganizationBasedEditParent 
	, IsProjectBasedEdit 
	, IsProjectBasedEditSelectable 
	, IsProjectBasedEditSub 
	, IsProjectBasedEditParent 
	, IsFreeEdit 
	, IsFreeEditSelectable 
	, IsRelationBasedRead 
	, IsRelationBasedReadSelectable 
	, IsOrganizationBasedRead 
	, IsOrganizationBasedReadSelectable 
	, IsOrganizationBasedReadSub 
	, IsOrganizationBasedReadParent 
	, IsProjectBasedRead 
	, IsProjectBasedReadSelectable 
	, IsProjectBasedReadSub 
	, IsProjectBasedReadParent 
	, IsFreeRead 
	, IsFreeReadSelectable 
	, Color 
	, IconID 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ContentTypeGroupID
	, @CodePrefix 
	, @CodeSuffix 
	, @CodeTypeId 
	, @ContentProcessTypeID
	, @ContentVersionProcessTypeId
	, @SecurityLevelID
	, @ObjectTypeStatusId
	, @IsRelationBasedOwnership
    , @IsProjectBasedOwnership 
	, @IsOrganizationBasedOwnership 
	, @IsFreeOwnership 
	, @IsRelationBasedEdit 
	, @IsRelationBasedEditSelectable 
	, @IsOrganizationBasedEdit 
	, @IsOrganizationBasedEditSelectable 
	, @IsOrganizationBasedEditSub 
	, @IsOrganizationBasedEditParent 
	, @IsProjectBasedEdit 
	, @IsProjectBasedEditSelectable 
	, @IsProjectBasedEditSub 
	, @IsProjectBasedEditParent 
	, @IsFreeEdit 
	, @IsFreeEditSelectable 
	, @IsRelationBasedRead 
	, @IsRelationBasedReadSelectable 
	, @IsOrganizationBasedRead 
	, @IsOrganizationBasedReadSelectable 
	, @IsOrganizationBasedReadSub 
	, @IsOrganizationBasedReadParent 
	, @IsProjectBasedRead 
	, @IsProjectBasedReadSelectable 
	, @IsProjectBasedReadSub 
	, @IsProjectBasedReadParent 
	, @IsFreeRead 
	, @IsFreeReadSelectable 
	, @Color 
	, @IconID 
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewContentTypeId int	= scope_identity();

INSERT INTO ContentTypeLanguages (
	ContentTypeId
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewContentTypeId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

INSERT INTO ContentTypeClassifications ( ContentTypeId, ClassificationId, ObjectTypeClassificationStatusId, ModifierId, ModifiedDate)
SELECT @NewContentTypeId, ClassificationId, ObjectTypeClassificationStatusId, @UserId, getdate() FROM @ContentTypeClassificationTable


	COMMIT TRANSACTION
