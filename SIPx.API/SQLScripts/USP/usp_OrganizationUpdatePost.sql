CREATE PROCEDURE [dbo].[usp_OrganizationUpdatePost] (
	@OrganizationId int
	, @ParentOrganizationId int
	, @StatusId int 
	, @OrganizationTypeId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @ModifierId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION
UPDATE Organizations SET
	ParentOrganizationId = @ParentOrganizationID
	, StatusId = @StatusID
	, OrganizationTypeId = @OrganizationTypeID
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE 
	OrganizationId = @OrganizationID

UPDATE OrganizationLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE OrganizationId = @OrganizationId
	AND LanguageID = @LanguageId

COMMIT TRANSACTION
