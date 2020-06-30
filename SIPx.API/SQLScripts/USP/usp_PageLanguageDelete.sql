CREATE PROCEDURE [dbo].[usp_PageLanguageDelete] (@PageLanguageId int) 
AS 
DELETE FROM PageLanguages WHERE PageLanguageID= @PageLanguageID


