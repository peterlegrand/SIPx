CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupDelete] (
	@ProcessTypeGroupId int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTypeGroups WHERE ProcessTypeGroupId = @ProcessTypeGroupID;
BEGIN TRANSACTION
UPDATE ProcessTypeGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 
DELETE FROM ProcessTypeGroupLanguages WHERE @ProcessTypeGroupId = ProcessTypeGroupID
DELETE FROM ProcessTypeGroups WHERE @ProcessTypeGroupId = ProcessTypeGroupID
COMMIT TRANSACTION

