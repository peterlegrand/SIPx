CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeLanguageDelete] (@ProcessTypeStageTypeLanguageId int) 
AS 
DELETE FROM ProcessTypeStageTypeLanguages WHERE ProcessTypeStageTypeLanguageID= @ProcessTypeStageTypeLanguageID


