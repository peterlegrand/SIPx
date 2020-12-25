CREATE PROCEDURE usp_ClassificationValueDeletePost ( @UserId nvarchar(450), @ClassificationValueId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ClassificationValueLanguages 
WHERE ClassificationValueID  = @ClassificationValueId 

DELETE FROM ClassificationValues 
WHERE ClassificationValueID = @ClassificationValueId
COMMIT TRANSACTION