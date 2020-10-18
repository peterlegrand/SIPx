CREATE PROCEDURE usp_PersonCreateGetUsers  
AS 
SELECT ID UserId
	, UserName Name
FROM AspNetUsers
WHERE Id NOT IN (SELECT UserId FROM Persons)
ORDER BY UserName