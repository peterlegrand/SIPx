CREATE PROCEDURE [dbo].[usp_OrganizationCreatePost] (
	@ParentOrganizationId int
	, @StatusId int 
	, @OrganizationTypeId int 
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE UserId = @CreatorId
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
	, @CreatorId
	, getdate()
	, @CreatorId
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
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())

	COMMIT TRANSACTION
