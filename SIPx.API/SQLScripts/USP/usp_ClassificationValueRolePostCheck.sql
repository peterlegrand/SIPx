CREATE PROCEDURE [dbo].usp_ClassificationValueRolePostCheck (
	@RoleId bit
	, @ClassificationValueId bit
	, @ClassificationId int
	, @ClassificationRelationTypeId int
	, CreatorId nvarchar(50)
AS 
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
	FROM Classifications 
	JOIN ClassificationLanguages 
		ON ClassificationLanguages.ClassificationId = Classifications.ClassificationId 
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