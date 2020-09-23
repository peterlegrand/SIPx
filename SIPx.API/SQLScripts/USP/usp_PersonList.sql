CREATE PROCEDURE usp_PersonList 
AS
SELECT Persons.PersonID, FirstName + ' ' + LastName Name 
FROM Persons 
