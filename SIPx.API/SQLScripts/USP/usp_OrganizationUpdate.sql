CREATE PROCEDURE [dbo].[usp_OrganizationUpdate] (
	@OrganizationId int
	, @OrganizationLanguageId int
	, @ParentOrganizationId int
	, @StatusId int 
	, @OrganizationTypeId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

BEGIN TRANSACTION
UPDATE Organizations SET
	ParentOrganizationId = @ParentOrganizationID
	, StatusId = @StatusID
	, OrganizationTypeId = @OrganizationTypeID
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE 
	OrganizationId = @OrganizationID

UPDATE OrganizationLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE OrganizationLanguageId = @OrganizationLanguageID

COMMIT TRANSACTION
