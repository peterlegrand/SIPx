CREATE PROCEDURE [dbo].[usp_ContentTypeGroupDelete] (
	@ContentTypeGroupId int) 
AS 
BEGIN TRANSACTION
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ContentTypeGroups WHERE ContentTypeGroupId = @ContentTypeGroupID;
UPDATE ContentTypeGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 

DELETE FROM ContentTypeGroupLanguages WHERE ContentTypeGroupId = @ContentTypeGroupID
DELETE FROM ContentTypeGroups WHERE ContentTypeGroupId = @ContentTypeGroupID
COMMIT TRANSACTION


