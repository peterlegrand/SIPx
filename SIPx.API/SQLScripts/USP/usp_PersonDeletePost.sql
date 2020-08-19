CREATE PROCEDURE usp_PersonDeletePost ( @PersonId int)
AS
DELETE FROM Persons 
WHERE PersonID = @PersonId
