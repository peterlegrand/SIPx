CREATE PROCEDURE [dbo].[usp_ClassificationLanguageDelete] (@ClassificationLanguageId int) 
AS 
DELETE FROM ClassificationLanguages WHERE ClassificationLanguageID= @ClassificationLanguageID