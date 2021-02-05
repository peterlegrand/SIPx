CREATE PROCEDURE [dbo].[usp_ProcessTypeStageLanguageDelete] (@ProcessTypeStageLanguageId int) 
AS 
DELETE FROM ProcessTypeStageLanguages WHERE ProcessTypeStageLanguageID= @ProcessTypeStageLanguageID


