CREATE PROCEDURE [dbo].[usp_OrganizationTypeUpdate] (
	@OrganizationTypeLanguageId int
	, @OrganizationTypeId int
	, @Internal bit
	, @LegalEntity bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

UPDATE OrganizationTypes SET 
	Internal= @Internal
	, LegalEntity = @LegalEntity
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE OrganizationTypeId = @OrganizationTypeID

UPDATE  OrganizationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE OrganizationTypeLanguageID= @OrganizationTypeLanguageID

COMMIT TRANSACTION



