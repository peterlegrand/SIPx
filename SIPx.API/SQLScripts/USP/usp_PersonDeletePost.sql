CREATE PROCEDURE usp_PersonDeletePost ( @UserId nvarchar(450), @PersonId int)
AS
DELETE FROM Persons 
WHERE PersonID = @PersonId
