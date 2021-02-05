CREATE PROCEDURE [dbo].[usp_FrontProcessToDoProcessList] (@ProcessTypeFlowId int)
AS

SELECT ProcessId 
, Processes.CreatorId	 
FROM Processes

JOIN ProcessTypeFlows	
	ON Processes.ProcessTypeStageID = ProcessTypeFlows.ProcessTypeFromStageID	
WHERE ProcessTypeFlowId = @ProcessTypeFlowId

