CREATE PROCEDURE usp_RoleIdForSpecificUser (@UserId nvarchar(450)) 
AS 
SELECT AspNetUserRoles.RoleId 
FROM AspNetUserRoles
WHERE AspNetUserRoles.UserId = @UserId
