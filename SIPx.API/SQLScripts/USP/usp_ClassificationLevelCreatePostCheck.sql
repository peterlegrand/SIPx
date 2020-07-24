CREATE PROCEDURE [dbo].[usp_ClassificationLevelCreatePostCheck] (
	@ClassificationId int
	, @Sequence int
	, @LanguageId int
	, @Name nvarchar(50)
	, @DateLevelId int
	, @UserId nvarchar(450)) 
AS 
BEGIN 
DECLARE @Error varchar(500) = '';


IF (SELECT MAX(Sequence) 
	FROM ClassificationLevels WHERE ClassificationId = @ClassificationId) < @Sequence + 1
BEGIN
	SET @Error = @Error + ' - sequence is bigger than current max value '
END

IF @Sequence <= 0
BEGIN
	SET @Error = @Error + ' - sequence cannot be 0 '
END

IF  (SELECT COUNT(*) 
	FROM ClassificationLevels 
	JOIN ClassificationLevelLanguages 
		ON ClassificationLevelLanguages.ClassificationLevelId = ClassificationLevels.ClassificationLevelId 
	WHERE LanguageId = @LanguageID
		AND ClassificationLevelLanguages.Name = @Name
		AND ClassificationLevels.ClassificationId = @ClassificationId) >0
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
IF  (SELECT COUNT(*) 
	FROM DateLevels 
	WHERE DateLevelId = @DateLevelId ) =0
BEGIN
	SET @Error = @Error + ' - The date level does not exist'
END

SELECT @Error;

END