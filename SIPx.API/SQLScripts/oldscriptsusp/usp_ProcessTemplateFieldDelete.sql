CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldDelete] (
	@ProcessTemplateFieldId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateFieldId = @ProcessTemplateFieldID
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateFieldId = @ProcessTemplateFieldID
COMMIT TRANSACTION


