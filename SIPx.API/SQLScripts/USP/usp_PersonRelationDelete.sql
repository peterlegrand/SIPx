CREATE PROCEDURE [dbo].[usp_PersonRelationDelete] (
	@PersonRelationID int) 
AS 
DELETE FROM PersonRelations WHERE PersonRelationID = @PersonRelationID


