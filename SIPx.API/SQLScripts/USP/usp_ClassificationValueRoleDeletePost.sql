CREATE PROCEDURE usp_ClassificationValueRoleDeletePost (@ValueRoleId nvarchar(450), @ClassificationValueRoleId int)
AS
DELETE FROM ClassificationValueRoles 
WHERE ClassificationValueRoleID = @ClassificationValueRoleId
