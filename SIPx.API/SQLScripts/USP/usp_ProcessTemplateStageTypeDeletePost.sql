CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeDeletePost] (
	@UserId nvarchar(450), @ProcessTemplateStageTypeId int) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ProcessTemplateStageTypeLanguages WHERE @ProcessTemplateStageTypeId = ProcessTemplateStageTypeId
DELETE FROM ProcessTemplateStageTypes WHERE @ProcessTemplateStageTypeId = ProcessTemplateStageTypeId
COMMIT TRANSACTION