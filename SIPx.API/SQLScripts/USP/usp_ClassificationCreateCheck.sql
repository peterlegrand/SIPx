CREATE PROCEDURE [dbo].[usp_ClassificationCreateCheck] (
	@StatusID bit
	, @HasDropDown bit
	, @DropDownSequence int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
BEGIN 
DECLARE @Error varchar(500) = '';

IF @StatusID NOT IN (1,2) 
BEGIN
	SET @Error = @Error + ' - StatusID is not correct'
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
	FROM Classifications 
	JOIN ClassificationLanguages 
		ON ClassificationLanguages.ClassificationID = Classifications.ClassificationID 
	WHERE LanguageID = @LanguageID
		AND ClassificationLanguages.Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification name for this language already exists'
END
IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageID = @LanguageID AND languages.StatusID = 1
) >0
BEGIN
	SET @Error = @Error + ' - The language is not active'
END

SELECT @Error;

END