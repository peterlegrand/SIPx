CREATE PROCEDURE usp_ContentTypeUpdatePost (
	 @ContentTypeId int
	, @ContentTypeGroupId int
	, @ProcessTemplateId int
	, @SecurityLevelId int
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
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ContentTypes SET 
	ContentTypeGroupID= @ContentTypeGroupID
	, ProcessTemplateId = @ProcessTemplateID
	, SecurityLevelId = @SecurityLevelID
	, IsRelationBasedOwnership = @IsRelationBasedOwnership 
	, IsProjectBasedOwnership = @IsProjectBasedOwnership  
	, IsOrganizationBasedOwnership = @IsOrganizationBasedOwnership  
	, IsFreeOwnership = @IsFreeOwnership  
	, IsRelationBasedEdit = @IsRelationBasedEdit  
	, IsRelationBasedEditSelectable = @IsRelationBasedEditSelectable  
	, IsOrganizationBasedEdit = @IsOrganizationBasedEdit  
	, IsOrganizationBasedEditSelectable = @IsOrganizationBasedEditSelectable  
	, IsOrganizationBasedEditSub = @IsOrganizationBasedEditSub  
	, IsOrganizationBasedEditParent = @IsOrganizationBasedEditParent  
	, IsProjectBasedEdit = @IsProjectBasedEdit  
	, IsProjectBasedEditSelectable = @IsProjectBasedEditSelectable  
	, IsProjectBasedEditSub = @IsProjectBasedEditSub  
	, IsProjectBasedEditParent= @IsProjectBasedEditParent  
	, IsFreeEdit = @IsFreeEdit  
	, IsFreeEditSelectable = @IsFreeEditSelectable  
	, IsRelationBasedRead = @IsRelationBasedRead  
	, IsRelationBasedReadSelectable = @IsRelationBasedReadSelectable  
	, IsOrganizationBasedRead = @IsOrganizationBasedRead  
	, IsOrganizationBasedReadSelectable = @IsOrganizationBasedReadSelectable  
	, IsOrganizationBasedReadSub = @IsOrganizationBasedReadSub  
	, IsOrganizationBasedReadParent = @IsOrganizationBasedReadParent  
	, IsProjectBasedRead= @IsProjectBasedRead  
	, IsProjectBasedReadSelectable= @IsProjectBasedReadSelectable  
	, IsProjectBasedReadSub= @IsProjectBasedReadSub  
	, IsProjectBasedReadParent= @IsProjectBasedReadParent  
	, IsFreeRead = @IsFreeRead  
	, IsFreeReadSelectable = @IsFreeReadSelectable  
	, Color = @Color
	, IconID = @IconID
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE ContentTypeId = @ContentTypeID

UPDATE  ContentTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ContentTypeID= @ContentTypeID	
	AND LanguageID = @LanguageID

UPDATE ContentTypeClassifications SET ContentTypeClassifications.ContentTypeClassificationStatusId = UDT.ContentTypeClassificationStatusID , ModifierId = @UserId, ModifiedDate = getdate()
FROM  ContentTypeClassifications JOIN @ContentTypeClassificationTable UDT ON UDT.ClassificationId = ContentTypeClassifications.ClassificationID 
WHERE ContentTypeClassifications.ContentTypeID = @ContentTypeId

COMMIT TRANSACTION




