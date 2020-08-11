CREATE PROCEDURE usp_ClassificationValueCreatePostCheck (
	@ClassificationId int
	, @ParentId int = NULL
	, @LanguageId int
	, @Name nvarchar(50)
	, @CreatorId nvarchar(450))
AS
BEGIN

DECLARE @Error varchar(500) = '';

If @ParentId IS NOT NULL
BEGIN
	IF  (SELECT COUNT(*) 
	
		FROM ClassificationValues  
		WHERE ClassificationValueID = @ParentId
		AND @ClassificationId = @ClassificationId) = 0 
		BEGIN
	SET @Error = @Error + ' - The parent value does not exist'
	END
END






IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageId = @LanguageId AND languages.StatusId = 1
) =0
BEGIN
	SET @Error = @Error + ' - The language is not active'
END


IF  (SELECT COUNT(*) 
	FROM AspNetUsers 
	WHERE Id = @CreatorId) =0
BEGIN
	SET @Error = @Error + ' - The user does not exist '
END

SELECT @Error;

END