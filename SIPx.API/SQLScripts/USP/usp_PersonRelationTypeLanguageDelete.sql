CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguageDelete] (@PersonRelationTypeLanguageId int) 
AS 
DELETE FROM PersonRelationTypeLanguages WHERE PersonRelationTypeLanguageID= @PersonRelationTypeLanguageID
