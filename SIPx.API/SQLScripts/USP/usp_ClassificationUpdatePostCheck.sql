CREATE PROCEDURE usp_ClassificationUpdatePostCheck (
	@ClassificationLanguageId int
	, @StatusId int
	, @DefaultPageId int
	, @HasDropDown bit
	, @DropDownSequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450))
AS
BEGIN

DECLARE @Error varchar(500) = '';

IF @StatusId NOT IN (1,2) 
BEGIN
	SET @Error = @Error + ' - StatusId is not correct'
END

IF  (SELECT COUNT(*) 
	FROM ClassificationLanguages 
	WHERE ClassificationLanguages.ClassificationLanguageId = @ClassificationLanguageID) =0
BEGIN
	SET @Error = @Error + ' - The classificaation language Id does not exist'
END

IF  (SELECT COUNT(*) 
	FROM ClassificationPages JOIN ClassificationLanguages ON ClassificationPages.ClassificationId  = ClassificationLanguages.ClassificationID
	WHERE ClassificationPages.ClassificationPageId = @DefaultPageId 
		AND ClassificationLanguages.ClassificationLanguageID= @ClassificationLanguageID) = 0  AND @DefaultPageId IS NOT NULL 
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
		ON ClassificationLanguages.ClassificationId = Classifications.ClassificationId 
	WHERE LanguageId IN (
		SELECT LanguageId 
		FROM ClassificationLanguages 
			WHERE ClassificationLanguages.ClassificationLanguageId = @ClassificationLanguageID)
		AND ClassificationLanguageId <> @ClassificationLanguageID
		AND ClassificationLanguages.Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification name for this language already exists'
END

SELECT @Error;

END