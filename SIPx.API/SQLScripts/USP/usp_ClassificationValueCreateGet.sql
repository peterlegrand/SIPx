CREATE PROCEDURE [dbo].[usp_ClassificationValueCreateGet] (@ClassificationId int, @ClassificationValueId int) 
AS 
BEGIN
DECLARE @Level int;

IF @ClassificationValueId <> 0
BEGIN

WITH ClassificationValueHierarchy (ClassificationValueID
	, ClassificationID
	, Level)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, ClassificationValues.ClassificationID
		, 1
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueId IS NULL
		AND ClassificationValues.ClassificationId = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, ClassificationValueNextLevel.ClassificationID
		, Level + 1
	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueId = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationId = @ClassificationID
)
-- Statement using the CTE
SELECT  
	@Level = Level+1
FROM   ClassificationValueHierarchy
WHERE  ClassificationValueID = @ClassificationValueId

END
ELSE
BEGIN
SET @Level=1
END
SELECT DateLevelID FROM ClassificationLevels WHERE @ClassificationId = ClassificationID AND Sequence = @Level

END;