CREATE PROCEDURE [dbo].[usp_RolesUpdate] (
	@UserId nvarchar(450)
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @RoleId nvarchar(450)
	, @RoleGroupId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN TRANSACTION
UPDATE AspNetRoles SET 
	Name = @Name
	, NormalizedName = UPPER(@Name)
	, RoleGroupId = @RoleGroupID
WHERE Id = @RoleID;
UPDATE RoleLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE RoleId = @RoleId 
	AND LanguageId = @LanguageID
COMMIT TRANSACTION