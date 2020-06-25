CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupDelete] (
	@ProcessTemplateGroupID int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTemplateGroups WHERE ProcessTemplateGroupID = @ProcessTemplateGroupID;
BEGIN TRANSACTION
UPDATE ProcessTemplateGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 
DELETE FROM ProcessTemplateGroupLanguages WHERE @ProcessTemplateGroupID = ProcessTemplateGroupID
DELETE FROM ProcessTemplateGroups WHERE @ProcessTemplateGroupID = ProcessTemplateGroupID
COMMIT TRANSACTION

