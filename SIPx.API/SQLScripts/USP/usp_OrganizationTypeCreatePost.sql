CREATE PROCEDURE usp_OrganizationTypeCreatePost (
	@Internal bit
	, @LegalEntity bit
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color nchar(9)
	, @IconId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO OrganizationTypes (
	Internal
	, LegalEntity
	, CodePrefix 
	, CodeSuffix 
	, CodeTypeId 
	, ObjectTypeStatusId
	, Color
	, IconId
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Internal
	, @LegalEntity
	, @CodePrefix 
	, @CodeSuffix 
	, @CodeTypeId 
	, @ObjectTypeStatusId
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



