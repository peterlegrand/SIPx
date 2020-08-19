CREATE PROCEDURE usp_ContentDeletePost ( @ContentId int)
AS
BEGIN TRANSACTION
DELETE FROM Contents 
WHERE ContentID = @ContentId
DELETE FROM ContentClassificationValues WHERE ContentID = @ContentId
COMMIT TRANSACTION