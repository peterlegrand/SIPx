CREATE PROCEDURE [dbo].[usp_UserMenuTemplateOptionCreatePostCheck] (
	@UserMenuTemplateId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @IconId int
	, @Sequence int
	, @CreatorId nvarchar(450))  
AS 
BEGIN 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CreatorID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @Error varchar(500) = '';


IF (SELECT MAX(Sequence) 
	FROM UserMenuTemplateOptions WHERE UserMenuTemplateId = @UserMenuTemplateId) < @Sequence + 1
BEGIN
	SET @Error = @Error + ' - sequence is bigger than current max value '
END

IF @Sequence < 0
BEGIN
	SET @Error = @Error + ' - sequence cannot be 0 '
END

IF  (SELECT COUNT(*) 
	FROM UserMenuTemplateOptions 
	JOIN UserMenuTemplateOptionLanguages 
		ON UserMenuTemplateOptionLanguages.UserMenuTemplateOptionId = UserMenuTemplateOptions.UserMenuTemplateOptionId 
	WHERE LanguageId = @LanguageID
		AND UserMenuTemplateOptionLanguages.Name = @Name
		AND UserMenuTemplateOptions.UserMenuTemplateId = @UserMenuTemplateId) >0
BEGIN
	SET @Error = @Error + ' - This name for this language already exists'
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