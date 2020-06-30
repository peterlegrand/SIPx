CREATE PROCEDURE [dbo].[usp_ClassificationPageLanguageDelete] (@ClassificationPageLanguageId int) 
AS 
DELETE FROM ClassificationPageLanguages WHERE ClassificationPageLanguageID= @ClassificationPageLanguageID