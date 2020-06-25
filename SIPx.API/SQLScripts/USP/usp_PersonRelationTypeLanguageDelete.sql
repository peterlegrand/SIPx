CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguageDelete] (@PersonRelationTypeLanguageID int) 
AS 
DELETE FROM PersonRelationTypeLanguages WHERE PersonRelationTypeLanguageID= @PersonRelationTypeLanguageID
