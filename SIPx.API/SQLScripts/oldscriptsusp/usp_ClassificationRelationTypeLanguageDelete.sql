CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguageDelete] (@ClassificationRelationTypeLanguageId int) 
AS 
DELETE FROM ClassificationRelationTypeLanguages WHERE ClassificationRelationTypeLanguageID= @ClassificationRelationTypeLanguageID