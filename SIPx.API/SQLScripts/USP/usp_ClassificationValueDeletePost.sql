CREATE PROCEDURE usp_ClassificationValueDeletePost ( @ClassificationValueId int)
AS
BEGIN TRANSACTION
DELETE FROM ClassificationValueLanguages 
WHERE ClassificationValueID  = @ClassificationValueId 

DELETE FROM ClassificationValues 
WHERE ClassificationValueID = @ClassificationValueId
COMMIT TRANSACTION