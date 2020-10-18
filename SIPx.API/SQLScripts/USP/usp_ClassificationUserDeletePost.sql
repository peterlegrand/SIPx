CREATE PROCEDURE usp_ClassificationUserDeletePost (@ClassificationUserId int)
AS
DELETE FROM ClassificationUsers 
WHERE ClassificationUserID = @ClassificationUserId
