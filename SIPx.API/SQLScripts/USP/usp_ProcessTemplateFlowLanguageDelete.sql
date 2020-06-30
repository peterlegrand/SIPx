CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageDelete] (@ProcessTemplateFlowLanguageId int) 
AS 
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateFlowLanguageID= @ProcessTemplateFlowLanguageID


