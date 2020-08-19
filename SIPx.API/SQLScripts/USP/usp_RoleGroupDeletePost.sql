CREATE PROCEDURE usp_RoleGroupDeletePost ( @RoleGroupId int)
AS
BEGIN TRANSACTION

DELETE FROM RoleGroupLanguages WHERE RoleGroupId = @RoleGroupId
DELETE FROM RoleGroups WHERE RoleGroupId = @RoleGroupId

COMMIT TRANSACTION
