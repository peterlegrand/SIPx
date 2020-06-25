CREATE PROCEDURE [dbo].[usp_ProjectLanguageDelete] (@ProjectLanguageID int) 
AS 
DELETE FROM ProjectLanguages WHERE ProjectLanguageID= @ProjectLanguageID


