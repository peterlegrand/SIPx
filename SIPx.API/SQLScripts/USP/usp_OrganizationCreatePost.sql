CREATE PROCEDURE [dbo].[usp_OrganizationCreatePost] (
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
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
	, @UserID
	, getdate()
	, @UserID
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
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION