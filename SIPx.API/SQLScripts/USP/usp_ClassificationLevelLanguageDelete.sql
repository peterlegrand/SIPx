CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguageDelete] (@ClassificationLevelLanguageID int) 
AS 
DELETE FROM ClassificationLevelLanguages WHERE ClassificationLevelLanguageID= @ClassificationLevelLanguageID