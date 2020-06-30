CREATE PROCEDURE [dbo].[usp_PersonRelationDelete] (
	@PersonRelationId int) 
AS 
DELETE FROM PersonRelations WHERE PersonRelationId = @PersonRelationID


