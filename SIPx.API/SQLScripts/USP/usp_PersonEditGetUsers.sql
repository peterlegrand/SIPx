CREATE PROCEDURE usp_PersonEditGetUsers (@PersonId int)
AS 
SELECT Id UserId
	, UserName Name
FROM AspNetUsers
WHERE Id NOT IN (SELECT UserId FROM Persons WHERE PersonID <> @PersonId)
ORDER BY UserName