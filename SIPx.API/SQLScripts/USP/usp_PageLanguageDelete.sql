CREATE PROCEDURE [dbo].[usp_PageLanguageDelete] (@PageLanguageID int) 
AS 
DELETE FROM PageLanguages WHERE PageLanguageID= @PageLanguageID


