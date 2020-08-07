CREATE PROCEDURE [dbo].[usp_UserMenuTemplateCreateCheck] (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @CreatorID nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorID
	AND UserPreferences.PreferenceTypeId = 1 ;
BEGIN 
DECLARE @Error varchar(500) = '';


IF  (SELECT COUNT(*) 
	FROM UserMenuTemplates 
	JOIN UserMenuTemplateLanguages 
		ON UserMenuTemplateLanguages.UserMenuTemplateId = UserMenuTemplates.UserMenuTemplateId 
	WHERE LanguageId = @LanguageID
		AND UserMenuTemplateLanguages.Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This user menu template name for this language already exists'
END
IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageId = @LanguageId AND languages.StatusId = 1
) =0
BEGIN
	SET @Error = @Error + ' - The language is not active'
END

SELECT @Error;

END