CREATE PROCEDURE usp_ClassificationRoleDeletePost ( @ClassificationRoleId int)
AS
DELETE FROM ClassificationRoles 
WHERE ClassificationRoleID = @ClassificationRoleId
