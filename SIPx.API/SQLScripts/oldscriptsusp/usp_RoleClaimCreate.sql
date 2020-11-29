CREATE PROCEDURE [dbo].[usp_RoleClaimCreate] (@RoleId nvarchar(450),@ClaimValue nvarchar(max)) 
AS 
INSERT INTO AspNetRoleClaims (RoleId, ClaimType, ClaimValue) VALUES (@RoleId, 'ApplicationRights',@ClaimValue);
