CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionLanguageDelete] (@ProcessTemplateFlowConditionLanguageId int) 
AS 
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowConditionLanguageID= @ProcessTemplateFlowConditionLanguageID


