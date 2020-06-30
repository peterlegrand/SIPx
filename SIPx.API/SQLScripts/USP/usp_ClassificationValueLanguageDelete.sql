CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguageDelete] (@ClassificationValueLanguageId int) 
AS 
DELETE FROM ClassificationValueLanguages WHERE ClassificationValueLanguageID= @ClassificationValueLanguageID