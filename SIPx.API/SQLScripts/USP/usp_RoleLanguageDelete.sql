CREATE PROCEDURE [dbo].[usp_RoleLanguageDelete] (@RoleLanguageId int) 
AS 
DELETE FROM RoleLanguages WHERE RoleLanguageID= @RoleLanguageID


