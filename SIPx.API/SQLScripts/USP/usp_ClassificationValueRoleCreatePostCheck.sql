CREATE PROCEDURE [dbo].usp_ClassificationValueRoleCreatePostCheck (
	@RoleId nvarchar(450)
	, @ClassificationValueId int
	, @ClassificationId int
	, @ClassificationRelationTypeId int
	, @CreatorId nvarchar(450))
AS 
BEGIN 
DECLARE @Error varchar(500) = '';

IF  (SELECT COUNT(*) 
	FROM ClassificationValues 
	WHERE ClassificationValues.ClassificationID = @ClassificationID
		AND ClassificationValues.ClassificationValueID = @ClassificationValueID) = 0
BEGIN
	SET @Error = @Error + ' - This classification and value combination does not exist'
END
IF  (SELECT COUNT(*) 
	FROM AspNetRoles 
	WHERE AspNetRoles.Id = @RoleId ) =0
BEGIN
	SET @Error = @Error + ' - The role does not exist'
END

IF  (SELECT COUNT(*) 
	FROM AspNetUsers 
	WHERE Id = @CreatorId ) =0
BEGIN
	SET @Error = @Error + ' - The user does not exist'
END

IF  (SELECT COUNT(*) 
	FROM ClassificationValueRoles 
	WHERE RoleId = @RoleId 
		AND ClassificationValueId = @ClassificationValueId
		AND ClassificationId = @ClassificationId
		AND ClassificationRelationTypeId = @ClassificationRelationTypeId
	) >0
BEGIN
	SET @Error = @Error + ' - This combination already exist'
END


SELECT @Error;

END