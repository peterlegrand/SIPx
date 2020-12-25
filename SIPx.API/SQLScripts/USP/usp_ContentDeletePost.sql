CREATE PROCEDURE usp_ContentDeletePost ( @UserId nvarchar(450), @ContentId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM Contents 
WHERE ContentID = @ContentId
DELETE FROM ContentClassificationValues WHERE ContentID = @ContentId
COMMIT TRANSACTION