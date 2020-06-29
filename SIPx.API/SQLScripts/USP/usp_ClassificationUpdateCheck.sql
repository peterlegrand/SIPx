CREATE PROCEDURE usp_ClassificationUpdateCheck (
	@ClassificationLanguageID int
	, @StatusID int
	, @DefaultPageID int
	, @HasDropDown bit
	, @DropDownSequence int
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

IF  (SELECT COUNT(*) 
	FROM ClassificationLanguages 
	WHERE ClassificationLanguages.ClassificationLanguageID = @ClassificationLanguageID) =0
BEGIN
	SET @Error = @Error + ' - The classificaation language ID does not exist'
END

IF  (SELECT COUNT(*) 
	FROM ClassificationPages JOIN ClassificationLanguages ON ClassificationPages.ClassificationID  = ClassificationLanguages.ClassificationID
	WHERE ClassificationPages.ClassificationPageID = @DefaultPageID 
		AND ClassificationLanguages.ClassificationLanguageID= @ClassificationLanguageID) = 0  AND @DefaultPageID IS NOT NULL 
BEGIN
	SET @Error = @Error + ' - The default page is not correct'
END

IF  @HasDropDown NOT IN (0,1) 
BEGIN
	SET @Error = @Error + ' - dropdown value must be 0 or 1'
END
	
IF (SELECT MAX(DropDownSequence) 
	FROM Classifications ) < @DropDownSequence
BEGIN
	SET @Error = @Error + ' - dropdown sequence is bigger than current max value '
END

IF  (SELECT COUNT(*) 
	FROM Classifications 
	JOIN ClassificationLanguages 
		ON ClassificationLanguages.ClassificationID = Classifications.ClassificationID 
	WHERE LanguageID IN (
		SELECT LanguageID 
		FROM ClassificationLanguages 
			WHERE ClassificationLanguages.ClassificationLanguageID = @ClassificationLanguageID)
		AND ClassificationLanguageID <> @ClassificationLanguageID
		AND ClassificationLanguages.Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification name for this language already exists'
END

SELECT @Error;

END