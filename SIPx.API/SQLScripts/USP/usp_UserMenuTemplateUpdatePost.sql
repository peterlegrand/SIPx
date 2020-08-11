CREATE PROCEDURE usp_UserMenuTemplateUpdatePost(
	@UserId nvarchar(450)
	, @UserMenuTemplateID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50) )
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


UPDATE UserMenuTemplateLanguages 
SET Name = @Name
	, Description= @Description
	, MenuName= @MenuName
	, MouseOver = @MouseOver 
WHERE UserMenuTemplateId = @UserMenuTemplateID
	AND LanguageId = @LanguageId
