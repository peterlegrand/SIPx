CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeDelete] (
	@ProcessTypeStageTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTypeStageTypeLanguages WHERE @ProcessTypeStageTypeId = ProcessTypeStageTypeID
DELETE FROM ProcessTypeStageTypes WHERE @ProcessTypeStageTypeId = ProcessTypeStageTypeID
COMMIT TRANSACTION


