CREATE PROCEDURE usp_ProcessTemplateGroupDeletePost (@ProcessTemplateGroupId int)
AS
BEGIN TRANSACTION
DELETE FROM ProcessTemplateGroupLanguages 
WHERE ProcessTemplateGroupID  = @ProcessTemplateGroupId 

DELETE FROM ProcessTemplateGroups 
WHERE ProcessTemplateGroupID = @ProcessTemplateGroupId
COMMIT TRANSACTION