CREATE PROCEDURE [dbo].[usp_CheckProjectRole](@RoleId nvarchar(450))
AS
SELECT CASE COUNT(*) WHEN 0 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END HasProjectRole 
FROM AspNetRoleClaims
WHERE AspNetRoleClaims.RoleId = @RoleID
	AND AspNetRoleClaims.ClaimType = 'ProjectRight'
