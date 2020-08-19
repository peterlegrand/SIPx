CREATE PROCEDURE usp_ContentTypeGroupDeletePost ( @ContentTypeGroupId int)
AS
BEGIN TRANSACTION
DELETE FROM ContentTypeGroupLanguages 
WHERE ContentTypeGroupID  = @ContentTypeGroupId 

DELETE FROM ContentTypeGroups 
WHERE ContentTypeGroupID = @ContentTypeGroupId
COMMIT TRANSACTION