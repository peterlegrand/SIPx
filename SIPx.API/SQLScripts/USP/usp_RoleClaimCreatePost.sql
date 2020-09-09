CREATE PROCEDURE [dbo].[usp_RoleClaimCreatePost] ( @RoleId  nvarchar(450), @ClaimId int) 
AS 
DECLARE @ClaimType nvarchar(max);
DECLARE @ClaimValue nvarchar(max);
SELECT @ClaimType = ClaimType , @ClaimValue = ClaimValue  FROM Claims WHERE ClaimID = @ClaimId;
INSERT INTO AspNetRoleClaims (RoleId, ClaimType, ClaimValue) 
VALUES(@RoleId, @ClaimType, @ClaimValue)