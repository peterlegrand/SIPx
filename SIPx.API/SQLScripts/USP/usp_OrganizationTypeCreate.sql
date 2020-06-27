CREATE PROCEDURE [dbo].[usp_OrganizationTypeCreate] (
	@Internal bit
	, @LegalEntity bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO OrganizationTypes (
	Internal
	, LegalEntity
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Internal
	, @LegalEntity
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewOrganizationTypeId int	= scope_identity();

INSERT INTO OrganizationTypeLanguages (
	OrganizationTypeID
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
	@NewOrganizationTypeId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION



