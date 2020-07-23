CREATE PROCEDURE [dbo].[usp_ClassificationPageCreatePostCheck] (
	@StatusId bit
	, @LanguageId int
	, @Name nvarchar(50)
) 
AS 
BEGIN 
DECLARE @Error varchar(500) = '';

IF @StatusId NOT IN (1,2) 
BEGIN
	SET @Error = @Error + ' - StatusId is not correct'
END



IF  (SELECT COUNT(*) 
	FROM ClassificationPageLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification page name for this language already exists'
END

SELECT @Error;

END