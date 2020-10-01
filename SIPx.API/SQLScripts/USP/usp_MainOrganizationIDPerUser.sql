CREATE PROCEDURE [dbo].[usp_MainOrganizationIDPerUser] (@UserId nvarchar(450)) 
AS 
SELECT persons.DefaultOrganizationID  
FROM Persons
WHERE Persons.UserId = @UserID
