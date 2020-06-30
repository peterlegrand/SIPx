CREATE PROCEDURE [dbo].[usp_ProcessTemplateGroupDelete] (
	@ProcessTemplateGroupId int) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ProcessTemplateGroups WHERE ProcessTemplateGroupId = @ProcessTemplateGroupID;
BEGIN TRANSACTION
UPDATE ProcessTemplateGroups SET Sequence = Sequence - 1 WHERE Sequence > @OldSequence 
DELETE FROM ProcessTemplateGroupLanguages WHERE @ProcessTemplateGroupId = ProcessTemplateGroupID
DELETE FROM ProcessTemplateGroups WHERE @ProcessTemplateGroupId = ProcessTemplateGroupID
COMMIT TRANSACTION

