CREATE PROCEDURE usp_ContentTypeGroupDeletePost ( @UserId nvarchar(450), @ContentTypeGroupId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ContentTypeGroupLanguages 
WHERE ContentTypeGroupID  = @ContentTypeGroupId 

DELETE FROM ContentTypeGroups 
WHERE ContentTypeGroupID = @ContentTypeGroupId
COMMIT TRANSACTION