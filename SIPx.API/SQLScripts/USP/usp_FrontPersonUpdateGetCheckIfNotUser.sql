CREATE PROCEDURE usp_FrontPersonUpdateGetCheckIfNotUser (@SelectedPersonId int)
AS
SELECT COUNT(*) IsNonUser
FROM Persons
WHERE Persons.PersonID = @SelectedPersonId
	AND Persons.UserID is null