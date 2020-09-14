CREATE PROCEDURE [dbo].[usp_OrganizationTypeCreatePost] (
	@Internal bit
	, @LegalEntity bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @Color nchar(9)
	, @IconId int
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION

INSERT INTO OrganizationTypes (
	Internal
	, LegalEntity
	, Color
	, IconId
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Internal
	, @LegalEntity
	, @Color
	, @IconId
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



