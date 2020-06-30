CREATE PROCEDURE [dbo].[usp_PageSectionLanguageDelete] (@PageSectionLanguageId int) 
AS 
DELETE FROM PageSectionLanguages WHERE PageSectionLanguageID= @PageSectionLanguageID


