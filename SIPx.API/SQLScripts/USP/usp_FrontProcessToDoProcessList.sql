CREATE PROCEDURE [dbo].[usp_FrontProcessToDoProcessList] (@ProcessTemplateFlowId int)
AS

SELECT ProcessId 
, Processes.CreatorId	 
FROM Processes

JOIN ProcessTemplateFlows	
	ON Processes.ProcessTemplateStageID = ProcessTemplateFlows.ProcessTemplateFromStageID	
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId

