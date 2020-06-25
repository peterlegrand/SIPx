CREATE PROCEDURE [dbo].[usp_PageSectionLanguageDelete] (@PageSectionLanguageID int) 
AS 
DELETE FROM PageSectionLanguages WHERE PageSectionLanguageID= @PageSectionLanguageID


