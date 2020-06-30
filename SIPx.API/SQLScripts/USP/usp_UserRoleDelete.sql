CREATE PROCEDURE [dbo].[usp_UserRoleDelete] (@UserId nvarchar(450),@RoleId nvarchar(450)) 
AS 
DELETE FROM  AspNetUserRoles WHERE UserId = @UserId and RoleId = @RoleID	
