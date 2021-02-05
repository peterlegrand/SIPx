CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeDeletePost] (
	@UserId nvarchar(450), @ProcessTypeStageTypeId int) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ProcessTypeStageTypeLanguages WHERE @ProcessTypeStageTypeId = ProcessTypeStageTypeId
DELETE FROM ProcessTypeStageTypes WHERE @ProcessTypeStageTypeId = ProcessTypeStageTypeId
COMMIT TRANSACTION