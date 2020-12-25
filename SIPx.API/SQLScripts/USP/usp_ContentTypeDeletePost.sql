CREATE PROCEDURE usp_ContentTypeDeletePost ( @UserId nvarchar(450), @ContentTypeId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ContentTypeLanguages 
WHERE ContentTypeID  = @ContentTypeId 

DELETE FROM ContentTypes 
WHERE ContentTypeID = @ContentTypeId
COMMIT TRANSACTION