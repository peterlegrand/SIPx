CREATE PROCEDURE [dbo].[usp_RoleClaimDelete] (@RoleID nvarchar(450),@ClaimValue nvarchar(max)) 
AS 
DELETE FROM AspNetRoleClaims 
WHERE RoleID = @RoleID 
	AND ClaimType='ApplicationRights'
	AND  ClaimValue =@ClaimValue;
