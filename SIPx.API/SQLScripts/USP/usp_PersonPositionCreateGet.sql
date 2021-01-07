CREATE PROCEDURE usp_PersonPositionCreateGet (@UserId nvarchar(450), @PersonId int) 
AS 
SELECT  FirstName, LastName
FROM Persons
WHERE  Persons.PersonId = @PersonId
