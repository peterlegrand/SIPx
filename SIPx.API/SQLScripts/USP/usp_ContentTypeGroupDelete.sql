CREATE PROCEDURE [dbo].[usp_ContentTypeGroupDelete] (
	@ContentTypeGroupID int) 
AS 
BEGIN TRANSACTION
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ContentTypeGroups WHERE ContentTypeGroupID = @ContentTypeGroupID;
UPDATE ContentTypeGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 

DELETE FROM ContentTypeGroupLanguages WHERE ContentTypeGroupID = @ContentTypeGroupID
DELETE FROM ContentTypeGroups WHERE ContentTypeGroupID = @ContentTypeGroupID
COMMIT TRANSACTION


