CREATE PROCEDURE [dbo].[usp_RoleDeletePost] (
	@UserId nvarchar(450), @RoleId nvarchar(450)) 
AS 

SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM RoleLanguages WHERE @RoleId = RoleID
DELETE FROM AspNetRoleClaims WHERE RoleId = @RoleId
DELETE FROM AspNetRoles WHERE RoleId = @RoleId
COMMIT TRANSACTION
