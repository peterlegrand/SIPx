CREATE PROCEDURE [dbo].[usp_OrganizationUpdate] (
	@OrganizationID int
	, @OrganizationLanguageID int
	, @ParentOrganizationID int
	, @StatusID int 
	, @OrganizationTypeID int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

BEGIN TRANSACTION
UPDATE Organizations SET
	ParentOrganizationID = @ParentOrganizationID
	, StatusID = @StatusID
	, OrganizationTypeID = @OrganizationTypeID
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE 
	OrganizationID = @OrganizationID

UPDATE OrganizationLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE OrganizationLanguageID = @OrganizationLanguageID

COMMIT TRANSACTION
