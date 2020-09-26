CREATE PROCEDURE usp_UserSecurityLevel (@UserId nvarchar(450)
	)
AS
SELECT 
	ISNULL(SecurityLevelId,0) SecurityLevelId 
FROM AspNetUsers
WHERE Id = @UserId

