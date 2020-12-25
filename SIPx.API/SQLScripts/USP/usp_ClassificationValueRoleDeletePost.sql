CREATE PROCEDURE usp_ClassificationValueRoleDeletePost (@UserId nvarchar(450), @ClassificationValueRoleId int)
AS
DELETE FROM ClassificationValueRoles 
WHERE ClassificationValueRoleID = @ClassificationValueRoleId
