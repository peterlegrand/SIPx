CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguageDelete] (@ProcessTemplateFlowConditionLanguageID int) 
AS 
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowConditionLanguageID= @ProcessTemplateFlowConditionLanguageID

