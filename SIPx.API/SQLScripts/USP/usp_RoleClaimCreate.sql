CREATE PROCEDURE [dbo].[usp_RoleClaimCreate] (@RoleID nvarchar(450),@ClaimValue nvarchar(max)) 
AS 
INSERT INTO AspNetRoleClaims (RoleID, ClaimType, ClaimValue) VALUES (@RoleID, 'ApplicationRights',@ClaimValue);
