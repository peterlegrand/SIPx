CREATE PROCEDURE [dbo].[usp_RoleClaimDeletePost] (@RoleClaimId int) 
AS 
DELETE FROM AspNetRoleClaims 
WHERE AspNetRoleClaims.Id = @RoleClaimId 
