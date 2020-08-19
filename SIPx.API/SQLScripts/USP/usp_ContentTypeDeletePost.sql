CREATE PROCEDURE usp_ContentTypeDeletePost ( @ContentTypeId int)
AS
BEGIN TRANSACTION
DELETE FROM ContentTypeLanguages 
WHERE ContentTypeID  = @ContentTypeId 

DELETE FROM ContentTypes 
WHERE ContentTypeID = @ContentTypeId
COMMIT TRANSACTION