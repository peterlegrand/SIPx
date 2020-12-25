CREATE PROCEDURE usp_PersonRelationDeletePost ( @UserId nvarchar(450), @PersonRelationId int)
AS
DELETE FROM PersonRelations 
WHERE PersonRelationID = @PersonRelationId
