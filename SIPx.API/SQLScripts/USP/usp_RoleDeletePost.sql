CREATE PROCEDURE [dbo].[usp_RoleDeletePost] (
	@RoleId nvarchar(450)) 
AS 
DELETE FROM RoleLanguages WHERE @RoleId = RoleID
