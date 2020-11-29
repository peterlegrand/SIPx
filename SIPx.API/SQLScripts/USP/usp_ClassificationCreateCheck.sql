CREATE PROCEDURE [dbo].[usp_ClassificationCreateCheck] (
	@StatusId bit
	, @HasDropDown bit
	, @DropDownSequence int
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

BEGIN 
DECLARE @Error varchar(500) = '';

IF @StatusId NOT IN (1,2) 
BEGIN
	SET @Error = @Error + ' - StatusId is not correct'
END


IF  @HasDropDown NOT IN (0,1) 
BEGIN
	SET @Error = @Error + ' - dropdown value must be 0 or 1'
END
	
IF (SELECT MAX(DropDownSequence) 
	FROM Classifications ) < @DropDownSequence + 1
BEGIN
	SET @Error = @Error + ' - dropdown sequence is bigger than current max value '
END

IF  (SELECT COUNT(*) 
	FROM ClassificationLanguages 
	WHERE LanguageId = @LanguageID
		AND ClassificationLanguages.Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification name for this language already exists'
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