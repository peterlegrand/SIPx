CREATE PROCEDURE [dbo].[usp_ClassificationPageLanguageDelete] (@ClassificationPageLanguageID int) 
AS 
DELETE FROM ClassificationPageLanguages WHERE ClassificationPageLanguageID= @ClassificationPageLanguageID