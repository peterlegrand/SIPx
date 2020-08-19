CREATE PROCEDURE usp_ClassificationValueUserDeletePost (@ValueUserId nvarchar(450), @ClassificationValueUserId int)
AS
DELETE FROM ClassificationValueUsers 
WHERE ClassificationValueUserID = @ClassificationValueUserId
