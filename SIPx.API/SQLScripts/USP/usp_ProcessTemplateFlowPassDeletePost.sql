CREATE PROCEDURE usp_ProcessTemplateFlowPassDeletePost (@UserId nvarchar(450), @ProcessTemplateFlowPassId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTemplateFlowPassLanguages WHERE ProcessTemplateFlowPassId = @ProcessTemplateFlowPassId
DELETE FROM ProcessTemplateFlowPasses WHERE ProcessTemplateFlowPassId = @ProcessTemplateFlowPassId

COMMIT TRANSACTION
