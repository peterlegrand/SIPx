CREATE PROCEDURE [dbo].[usp_ClassificationLanguageDelete] (@ClassificationLanguageID int) 
AS 
DELETE FROM ClassificationLanguages WHERE ClassificationLanguageID= @ClassificationLanguageID