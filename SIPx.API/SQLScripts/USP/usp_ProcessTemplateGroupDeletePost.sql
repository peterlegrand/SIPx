CREATE PROCEDURE usp_ProcessTemplateGroupDeletePost (@UserId nvarchar(450), @ProcessTemplateGroupId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ProcessTemplateGroupLanguages 
WHERE ProcessTemplateGroupID  = @ProcessTemplateGroupId 

DELETE FROM ProcessTemplateGroups 
WHERE ProcessTemplateGroupID = @ProcessTemplateGroupId
COMMIT TRANSACTION