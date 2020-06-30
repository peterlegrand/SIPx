CREATE PROCEDURE [dbo].[usp_RoleGroupLanguageDelete] (@RoleGroupLanguageId int) 
AS 
DELETE FROM RoleGroupLanguages WHERE RoleGroupLanguageID= @RoleGroupLanguageID


