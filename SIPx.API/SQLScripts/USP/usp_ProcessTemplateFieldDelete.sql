CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldDelete] (
	@ProcessTemplateFieldID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateFieldID = @ProcessTemplateFieldID
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateFieldID = @ProcessTemplateFieldID
COMMIT TRANSACTION


