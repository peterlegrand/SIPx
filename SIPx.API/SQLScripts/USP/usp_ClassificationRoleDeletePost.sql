CREATE PROCEDURE usp_ClassificationRoleDeletePost ( @UserId nvarchar(450), @ClassificationRoleId int)
AS
DELETE FROM ClassificationRoles 
WHERE ClassificationRoleID = @ClassificationRoleId
