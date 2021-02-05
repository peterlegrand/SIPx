CREATE PROCEDURE usp_FrontProcessToDoFlowList
AS

SELECT DISTINCT ProcessTypeFlows.ProcessTypeFlowID from processtypestages 
JOIN Processes 
	ON Processes.ProcessTypeStageID = processtypestages.ProcessTypeStageID 
JOIN ProcessTypeFlows	
	ON ProcessTypeflows.ProcessTypeFromStageID = Processtypestages.ProcessTypeStageID
WHERE  intodo = 1