CREATE PROCEDURE usp_PersonRelationDeletePost ( @PersonRelationId int)
AS
DELETE FROM PersonRelations 
WHERE PersonRelationID = @PersonRelationId
