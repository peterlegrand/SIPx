CREATE PROCEDURE usp_UserHasClaim (@UserID nvarchar(450), @Claim nvarchar(max))
AS
BEGIN
IF ((SELECT COUNT(*) FROM 
	AspNetUserRoles 
JOIN AspNetRoleClaims
	ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId
WHERE AspNetRoleClaims.ClaimValue = 'a'
	AND AspNetUserRoles.UserId = 'a')= 0)
SELECT 0 HasClaim;
ELSE SELECT 1 HasClaim;
END