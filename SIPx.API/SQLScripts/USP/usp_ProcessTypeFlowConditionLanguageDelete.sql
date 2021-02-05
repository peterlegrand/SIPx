CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionLanguageDelete] (@ProcessTypeFlowConditionLanguageId int) 
AS 
DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeFlowConditionLanguageID= @ProcessTypeFlowConditionLanguageID


