CREATE PROCEDURE usp_ClassificationRelationTypeCreatePostCheck (
	@LanguageId int
	, @Name nvarchar(50))
AS 
BEGIN 
DECLARE @Error varchar(500) = '';


IF  (SELECT COUNT(*) 
	FROM ClassificationRelationTypes 
	JOIN ClassificationRelationTypeLanguages 
		ON ClassificationRelationTypeLanguages.ClassificationRelationTypeId = ClassificationRelationTypes.ClassificationRelationTypeId 
	WHERE LanguageId = @LanguageID
		AND ClassificationRelationTypeLanguages.Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification relation type name for this language already exists'
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