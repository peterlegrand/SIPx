CREATE PROCEDURE [dbo].[usp_UserRoleCreate] (@UserId nvarchar(450),@RoleId nvarchar(450)) 
AS 
INSERT INTO AspNetUserRoles ( UserId, RoleId) VALUES (@UserId,@RoleID) 
	
