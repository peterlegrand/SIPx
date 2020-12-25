CREATE PROCEDURE usp_RoleGroupDeletePost (@UserId nvarchar(450),  @RoleGroupId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM RoleGroupLanguages WHERE RoleGroupId = @RoleGroupId
DELETE FROM RoleGroups WHERE RoleGroupId = @RoleGroupId

COMMIT TRANSACTION
