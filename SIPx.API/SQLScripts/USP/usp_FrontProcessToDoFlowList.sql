CREATE PROCEDURE usp_FrontProcessToDoFlowList
AS

SELECT DISTINCT ProcessTemplateFlows.ProcessTemplateFlowID from processtemplatestages 
JOIN Processes 
	ON Processes.ProcessTemplateStageID = processtemplatestages.ProcessTemplateStageID 
JOIN ProcessTemplateFlows	
	ON ProcessTemplateflows.ProcessTemplateFromStageID = Processtemplatestages.ProcessTemplateStageID
WHERE  intodo = 1