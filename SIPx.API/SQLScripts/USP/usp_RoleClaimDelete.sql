CREATE PROCEDURE [dbo].[usp_RoleClaimDelete] (@RoleId nvarchar(450),@ClaimValue nvarchar(max)) 
AS 
DELETE FROM AspNetRoleClaims 
WHERE RoleId = @RoleId 
	AND ClaimType='ApplicationRights'
	AND  ClaimValue =@ClaimValue;
