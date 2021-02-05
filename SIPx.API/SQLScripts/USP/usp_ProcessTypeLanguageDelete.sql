CREATE PROCEDURE [dbo].[usp_ProcessTypeLanguageDelete] (@ProcessTypeLanguageId int) 
AS 
DELETE FROM ProcessTypeLanguages WHERE ProcessTypeLanguageID= @ProcessTypeLanguageID


