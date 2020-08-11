CREATE PROCEDURE usp_UserMenuTemplateUpdatePostCheck(
	@UserId nvarchar(450)
	, @UserMenuTemplateID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50) )
AS
DECLARE @Error varchar(500) = '';

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

IF (SELECT COUNT(*) FROM UserMenuTemplateLanguages WHERE LanguageID = @LanguageId AND UserMenuTemplateID = @UserMenuTemplateID ) = 0
BEGIN
	SET @Error = @Error + ' - The language for this template does not exist '
END

IF (SELECT COUNT(*) FROM UserMenuTemplateLanguages WHERE LanguageID = @LanguageId AND UserMenuTemplateID <> @UserMenuTemplateID AND Name = @Name) = 0
BEGIN
	SET @Error = @Error + ' - There is already a template with this name for this language '
END

IF (SELECT COUNT(*) 
	FROM AspNetUsers WHERE @UserId = Id ) = 0
BEGIN
	SET @Error = @Error + ' - The user does not exist '
END


SELECT @Error;

