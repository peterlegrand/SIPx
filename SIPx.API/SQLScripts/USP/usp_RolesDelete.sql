CREATE PROCEDURE [dbo].[usp_RolesDelete] (@RoleId nvarchar(450)) 
AS 
BEGIN TRANSACTION
DELETE FROM RoleLanguages WHERE RoleId = @RoleId ;
DELETE FROM AspNetRoles WHERE Id = @RoleID;
COMMIT TRANSACTION