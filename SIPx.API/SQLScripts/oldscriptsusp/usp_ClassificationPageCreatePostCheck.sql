CREATE PROCEDURE [dbo].[usp_ClassificationPageCreatePostCheck] (
	@ClassificationId int
	, @StatusId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @CreatorId nvarchar(450)
) 
AS 
BEGIN 
DECLARE @Error varchar(500) = '';

IF @StatusId NOT IN (1,2) 
BEGIN
	SET @Error = @Error + ' - StatusId is not correct'
END


IF  (SELECT COUNT(*) 
	FROM Languages 
	WHERE LanguageID = @LanguageId
		AND StatusID = 1
		) =0
BEGIN
	SET @Error = @Error + ' - This classification does not exist'
END


IF  (SELECT COUNT(*) 
	FROM Classifications 
	WHERE ClassificationID = @ClassificationId
		) =0
BEGIN
	SET @Error = @Error + ' - This classification does not exist'
END

IF  (SELECT COUNT(*) 
	FROM ClassificationPageLanguages 
	WHERE LanguageId = @LanguageID
		AND ClassificationID = @ClassificationId
		AND Name = @Name) >0
BEGIN
	SET @Error = @Error + ' - This classification page name for this language already exists'
END

SELECT @Error;

END