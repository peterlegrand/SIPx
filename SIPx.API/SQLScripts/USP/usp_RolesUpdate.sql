CREATE PROCEDURE [dbo].[usp_RolesUpdate] (
	@UserID nvarchar(450)
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @RoleID nvarchar(450)
	, @RoleGroupID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
BEGIN TRANSACTION
UPDATE AspNetRoles SET 
	Name = @Name
	, NormalizedName = UPPER(@Name)
	, RoleGroupID = @RoleGroupID
WHERE Id = @RoleID;
UPDATE RoleLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE RoleID = @RoleID 
	AND LanguageID = @LanguageID
COMMIT TRANSACTION