CREATE PROCEDURE [dbo].[usp_ProcessTypeStageDelete] (
	@ProcessTypeStageId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTypeStageLanguages WHERE ProcessTypeStageId = @ProcessTypeStageID
DELETE FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeStageID
COMMIT TRANSACTION
