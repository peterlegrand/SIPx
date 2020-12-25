CREATE PROCEDURE usp_ClassificationValueUserDeletePost (@UserId nvarchar(450), @ClassificationValueUserId int)
AS
DELETE FROM ClassificationValueUsers 
WHERE ClassificationValueUserID = @ClassificationValueUserId
