CREATE PROCEDURE [dbo].[usp_RoleClaimDeletePost] (@UserId nvarchar(450), @RoleClaimId int) 
AS 
DELETE FROM AspNetRoleClaims 
WHERE AspNetRoleClaims.Id = @RoleClaimId 
