CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldDelete] (
	@ProcessTypeFieldId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTypeFieldLanguages WHERE ProcessTypeFieldId = @ProcessTypeFieldID
DELETE FROM ProcessTypeFields WHERE ProcessTypeFieldId = @ProcessTypeFieldID
COMMIT TRANSACTION


