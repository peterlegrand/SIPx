CREATE PROCEDURE [dbo].[usp_UserRoleCreate] (@UserID nvarchar(450),@RoleID nvarchar(450)) 
AS 
INSERT INTO AspNetUserRoles ( UserId, RoleId) VALUES (@UserID,@RoleID) 
	
