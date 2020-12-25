CREATE PROCEDURE usp_FrontContentRightsUpdatePost (
@ContentId int
	, @IsRelationBasedEdit bit
	, @IsRelationBasedRead bit
	, @IsProjectBasedEdit bit
	, @IsProjectBasedEditSub bit
	, @IsProjectBasedEditParent bit
	, @IsOrganizationBasedEdit bit
	, @IsOrganizationBasedEditSub bit
	, @IsOrganizationBasedEditParent bit
	, @IsProjectBasedRead bit
	, @IsProjectBasedReadSub bit
	, @IsProjectBasedReadParent bit
	, @IsOrganizationBasedRead bit
	, @IsOrganizationBasedReadSub bit
	, @IsOrganizationBasedReadParent bit
	, @OwnerId nvarchar(450)
	, @UserId nvarchar(450)
)
AS
UPDATE Contents
SET 
	IsRelationBasedEdit  = @IsRelationBasedEdit 
	, IsRelationBasedRead = @IsRelationBasedRead 
	, IsProjectBasedEdit = @IsProjectBasedEdit 
	, IsProjectBasedEditSub = @IsProjectBasedEditSub 
	, IsProjectBasedEditParent = @IsProjectBasedEditParent 
	, IsOrganizationBasedEdit = @IsOrganizationBasedEdit 
	, IsOrganizationBasedEditSub= @IsOrganizationBasedEditSub 
	, IsOrganizationBasedEditParent= @IsOrganizationBasedEditParent 
	, IsProjectBasedRead  = @IsProjectBasedRead 
	, IsProjectBasedReadSub = @IsProjectBasedReadSub 
	, IsProjectBasedReadParent = @IsProjectBasedReadParent 
	, IsOrganizationBasedRead = @IsOrganizationBasedRead 
	, IsOrganizationBasedReadSub= @IsOrganizationBasedReadSub 
	, IsOrganizationBasedReadParent = @IsOrganizationBasedReadParent 
	, OwnerId = @OwnerId 
	, ModifierId = @UserId 
	, ModifiedDate = getdate()
WHERE ContentId = @ContentId