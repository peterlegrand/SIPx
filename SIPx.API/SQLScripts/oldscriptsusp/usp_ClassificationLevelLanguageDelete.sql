CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguageDelete] (@ClassificationLevelLanguageId int) 
AS 
DELETE FROM ClassificationLevelLanguages WHERE ClassificationLevelLanguageID= @ClassificationLevelLanguageID