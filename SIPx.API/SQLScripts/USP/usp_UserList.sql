CREATE PROCEDURE [dbo].[usp_UserList]  
AS 
SELECT UserId, FirstName + ' ' + LastName Name FROM Persons 
ORDER BY FirstName + ' ' + LastName 