CREATE PROCEDURE usp_ClassificationLevelPropertyCreatePost (
	@ClassificationLevelId int
	, @PropertyId int
	, @ClassificationLevelPropertyStatusId int
	, @UserId nvarchar(450)) 
AS 
DECLARE @ClassificationId int;
SELECT @ClassificationId = ClassificationId FROM Classificationlevels WHERE ClassificationLevelID = @ClassificationLevelId;
INSERT ClassificationLevelProperties (ClassificationLevelId , ClassificationId, PropertyId , ClassificationLevelPropertyStatusId, CreatorID, ModifierID, CreatedDate, ModifiedDate)
VALUES (@ClassificationLevelId , @ClassificationId, @PropertyId , @ClassificationLevelPropertyStatusId, @UserId, @UserId, Getdate(), Getdate())

--DECLARE @Sequence int;
--SELECT @Sequence = Sequence FROM Classificationlevels where classificationlevels.ClassificationLevelID = @ClassificationLevelId;

--WITH ClassificationValueHierarchy (ClassificationValueID
--	, ClassificationID
--	, Level)
--AS
--(
--	SELECT 
--		ClassificationValues.ClassificationValueID
--		, ClassificationValues.ClassificationID
--		, 1
--	FROM ClassificationValues 
--	WHERE ClassificationValues.ParentValueId IS NULL
--		AND ClassificationValues.ClassificationId = @ClassificationID

--   UNION ALL
--	SELECT 
--		ClassificationValueNextLevel.ClassificationValueID
--		, ClassificationValueNextLevel.ClassificationID
--		, Level + 1
--	FROM ClassificationValues ClassificationValueNextLevel
--	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
--		ON ClassificationValueBaseLevel.ClassificationValueId = ClassificationValueNextLevel.ParentValueID
--	WHERE ClassificationValueNextLevel.ClassificationId = @ClassificationID
--)
---- Statement using the CTE
--INSERT INTO ClassificationValueProperties (ClassificationValueId, ClassificationID, PropertyID, CreatorID, ModifierID, CreatedDate, ModifiedDate)
--SELECT  
--	ClassificationValueId, @ClassificationId, @PropertyID, @UserId, @UserId, Getdate(),Getdate()
--FROM   ClassificationValueHierarchy
--WHERE  Level = @Sequence 
--	AND ClassificationId = @ClassificationId
