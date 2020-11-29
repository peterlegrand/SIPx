CREATE PROCEDURE usp_OrganizationCreatePost (
	@ParentOrganizationId int
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
	, StatusID
	, OrganizationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ParentOrganizationID
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
