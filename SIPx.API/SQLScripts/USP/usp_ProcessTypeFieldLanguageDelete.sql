CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldLanguageDelete] (@ProcessTypeFieldLanguageId int) 
AS 
DELETE FROM ProcessTypeFieldLanguages WHERE ProcessTypeFieldLanguageID= @ProcessTypeFieldLanguageID


