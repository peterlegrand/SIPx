CREATE PROCEDURE usp_ClassificationUserDeletePost (@UserId nvarchar(450), @ClassificationUserId int)
AS
DELETE FROM ClassificationUsers 
WHERE ClassificationUserID = @ClassificationUserId
