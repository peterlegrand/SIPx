CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupLanguageDelete] (@ProcessTypeGroupLanguageId int) 
AS 
DELETE FROM ProcessTypeGroupLanguages WHERE ProcessTypeGroupLanguageID= @ProcessTypeGroupLanguageID


