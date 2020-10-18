CREATE PROCEDURE [dbo].[usp_UserList]  
AS 
SELECT UserId, FirstName + ' ' + LastName Name FROM Persons 
WHERE UserId IS NOT NULL
ORDER BY FirstName + ' ' + LastName 
