CREATE PROCEDURE [dbo].[usp_RoleGroupLanguageDelete] (@RoleGroupLanguageID int) 
AS 
DELETE FROM RoleGroupLanguages WHERE RoleGroupLanguageID= @RoleGroupLanguageID


