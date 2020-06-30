CREATE PROCEDURE [dbo].[usp_ProjectLanguageDelete] (@ProjectLanguageId int) 
AS 
DELETE FROM ProjectLanguages WHERE ProjectLanguageID= @ProjectLanguageID


