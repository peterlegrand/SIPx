CREATE PROCEDURE usp_UserDeletePostGetUserId (@SelectedPersonId int)
AS
SELECT UserId FROM Persons WHERE PersonID = @SelectedPersonId;
