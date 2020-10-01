CREATE PROCEDURE [dbo].[usp_ProjectIDPerUser] (@UserId nvarchar(450)) 
AS 
SELECT CAST(AspNetRoleClaims.ClaimValue as int)  
FROM AspNetUserRoles
JOIN AspNetRoleClaims
	ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId
WHERE AspNetUserRoles.UserId = @UserID
	AND AspNetRoleClaims.ClaimType = 'ProjectRight'