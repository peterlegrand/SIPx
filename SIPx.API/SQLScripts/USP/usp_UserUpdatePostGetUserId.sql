CREATE PROCEDURE usp_UserUpdatePostGetUserId (@SelectedPersonId int)
AS
SELECT UserId FROM Persons WHERE PersonID = @SelectedPersonId;
