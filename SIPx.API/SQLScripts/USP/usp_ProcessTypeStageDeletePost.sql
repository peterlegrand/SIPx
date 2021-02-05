CREATE PROCEDURE usp_ProcessTypeStageDeletePost (@UserId nvarchar(450),  @ProcessTypeStageId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION

DELETE FROM ProcessTypeStageFields WHERE ProcessTypeStageId = @ProcessTypeStageId

DELETE FROM ProcessTypeStageLanguages WHERE ProcessTypeStageId = @ProcessTypeStageId
DELETE FROM ProcessTypeStages WHERE ProcessTypeStageId = @ProcessTypeStageId

COMMIT TRANSACTION
