CREATE PROCEDURE [dbo].[usp_UserRoleDelete] (@UserID nvarchar(450),@RoleID nvarchar(450)) 
AS 
DELETE FROM  AspNetUserRoles WHERE UserId = @UserID and RoleId = @RoleID	
