CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowLanguageDelete] (@ProcessTemplateFlowLanguageID int) 
AS 
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateFlowLanguageID= @ProcessTemplateFlowLanguageID


