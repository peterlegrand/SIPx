CREATE PROCEDURE [dbo].[usp_OrganizationTypeUpdate] (
	@OrganizationTypeLanguageID int
	, @OrganizationTypeID int
	, @Internal bit
	, @LegalEntity bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

UPDATE OrganizationTypes SET 
	Internal= @Internal
	, LegalEntity = @LegalEntity
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE OrganizationTypeID = @OrganizationTypeID

UPDATE  OrganizationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE OrganizationTypeLanguageID= @OrganizationTypeLanguageID

COMMIT TRANSACTION



