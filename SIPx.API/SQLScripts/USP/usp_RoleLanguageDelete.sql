CREATE PROCEDURE [dbo].[usp_RoleLanguageDelete] (@RoleLanguageID int) 
AS 
DELETE FROM RoleLanguages WHERE RoleLanguageID= @RoleLanguageID


