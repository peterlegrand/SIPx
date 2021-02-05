CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowLanguageDelete] (@ProcessTypeFlowLanguageId int) 
AS 
DELETE FROM ProcessTypeFlowLanguages WHERE ProcessTypeFlowLanguageID= @ProcessTypeFlowLanguageID


