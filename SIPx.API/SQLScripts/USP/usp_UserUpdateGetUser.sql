CREATE PROCEDURE usp_UserUpdateGetUser (@SelectedPersonId int)
AS
DECLARE @UserId nvarchar(450);
SELECT @UserId = UserId FROM Persons WHERE PersonID = @SelectedPersonId;
SELECT UserName
	, Email
	, @UserId UserId
	, SecurityLevelID
FROM AspNetUsers
WHERE @UserId = Id