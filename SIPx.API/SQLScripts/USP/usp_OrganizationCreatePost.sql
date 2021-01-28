CREATE PROCEDURE usp_OrganizationCreatePost (
	@ParentOrganizationId int
	, @CodePrefix nvarchar(25)
	, @CodeInt Int
	, @CodeSuffix nvarchar(25)
	, @Code nvarchar(50)
	, @StatusId int 
	, @OrganizationTypeId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE UserId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO Organizations (
	ParentOrganizationID
	, CodePrefix 
	, CodeInt 
	, CodeSuffix 
	, Code 
	, StatusID
	, OrganizationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ParentOrganizationID
	, @CodePrefix 
	, @CodeInt
	, @CodeSuffix 
	, @Code 
	, @StatusID
	, @OrganizationTypeID
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	DECLARE @NewOrganizationId int	= scope_identity();

INSERT INTO OrganizationLanguages (
	OrganizationID
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
	@NewOrganizationId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserId
	, getdate()
	, @UserId
	, getdate())

	COMMIT TRANSACTION
