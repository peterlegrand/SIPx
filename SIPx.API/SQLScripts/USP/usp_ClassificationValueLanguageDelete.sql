CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguageDelete] (@ClassificationValueLanguageID int) 
AS 
DELETE FROM ClassificationValueLanguages WHERE ClassificationValueLanguageID= @ClassificationValueLanguageID