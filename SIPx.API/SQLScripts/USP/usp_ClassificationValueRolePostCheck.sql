CREATE PROCEDURE [dbo].usp_ClassificationValueRolePostCheck (
	@RoleId nvarchar(450)
	, @ClassificationValueId bit
	, @ClassificationId int
	, @ClassificationRelationTypeId int
	, @CreatorId nvarchar(450))
AS 
BEGIN 
DECLARE @Error varchar(500) = '';


IF (SELECT COUNT(*) 
	FROM AspNetRoles WHERE Id = @RoleId ) = 0
BEGIN
	SET @Error = @Error + ' - The role does not exist '
END

IF  (SELECT COUNT(*) 
	FROM ClassificationValues 
	WHERE ClassificationValueId = @ClassificationValueId
		AND ClassificationId = @ClassificationId) =0
BEGIN
	SET @Error = @Error + ' - The value and classification id does not exist'
END

IF  (SELECT COUNT(*) 
	FROM ClassificationValueRoles
	WHERE ClassificationValueId = @ClassificationValueId
		AND ClassificationId = @ClassificationId
		AND RoleID = @RoleId) >0
BEGIN
	SET @Error = @Error + ' - This role already is assigned to the classifcation'
END

IF  (SELECT COUNT(*) 
	FROM AspNetUsers 
	WHERE Id = @CreatorId
) =0
BEGIN
	SET @Error = @Error + ' - The user does not exist'
END

SELECT @Error;

END