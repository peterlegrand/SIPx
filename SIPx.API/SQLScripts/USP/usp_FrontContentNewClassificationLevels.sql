CREATE PROCEDURE usp_FrontContentNewClassificationLevels (@ClassificationId int) 
AS 

SELECT Sequence
	, Alphabetically
	, CanLink 
	, 'ControlA' + trim(cast(@ClassificationID as varchar(5)))+ trim(cast(Sequence as varchar(5))) ControlA
	, 'ControlB' + trim(cast(@ClassificationID as varchar(5)))+ trim(cast(Sequence as varchar(5))) ControlB
FROM CLassificationlevels WHERE ClassificationID = @ClassificationId ORDER BY Sequence