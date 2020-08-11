CREATE PROCEDURE usp_ClassificationUserCreatePostCheck (
	@userId nvarchar(450)
	, @ClassificationId int
	, @classificationRelationTypeId int
	, @CreatorId nvarchar(450)
)
AS 
BEGIN 
DECLARE @Error varchar(500) = '';


IF  (SELECT COUNT(*) 
	FROM ClassificationRelationTypes 
	WHERE  classificationRelationTypeId = @classificationRelationTypeId) =0
BEGIN
	SET @Error = @Error + ' - This classification relation type does not exist '
END

IF  (SELECT COUNT(*) 
	FROM ClassificationUsers
	WHERE  classificationRelationTypeId = @classificationRelationTypeId
		AND userId = @userId
		AND ClassificationId = @ClassificationId) >0
BEGIN
	SET @Error = @Error + ' - This role already exists '
END

IF  (SELECT COUNT(*) 
	FROM AspNetUsers 
	WHERE Id = @userId 
) =0
BEGIN
	SET @Error = @Error + ' - The user does not exist '
END
IF  (SELECT COUNT(*) 
	FROM AspNetUsers 
	WHERE Id = @CreatorId 
) =0
BEGIN
	SET @Error = @Error + ' - The creator does not exist '
END

SELECT @Error;

END