CREATE PROCEDURE usp_ClassificationValueCreatePost (
	@ClassificationId int
	, @ParentId int = NULL
	, @DateFrom datetime = NULL
	, @DateTo datetime = NULL
--	, @Location nvarchar(100) = NULL
--	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownName nvarchar(50)
	, @PageName nvarchar(50)
	, @PageDescription nvarchar(max)
	, @HeaderName nvarchar(50)
	, @HeaderDescription nvarchar(max)
	, @TopicName nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

	
DECLARE @Level int;

IF @ParentId <> 0
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
WHERE  ClassificationValueID = @ParentId

END
ELSE
BEGIN
SET @Level=1
END

DECLARE @ClassificationLevelId int;
SELECT @ClassificationLevelId = ClassificationLevelId FROM ClassificationLevels WHERE ClassificationId = @ClassificationId AND Sequence = @Level

SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @ParentId = 0
BEGIN
SET @ParentId = NULL
END
INSERT INTO ClassificationValues (
	ClassificationID
	, ParentValueID
	, DateFrom
	, DateTo
	--, Location
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ClassificationID
	, @ParentID
	, @DateFrom
	, @DateTo
	--, @Location
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewClassificationValueId int	= scope_identity();

INSERT INTO ClassificationValueLanguages (
	ClassificationValueID
	, ClassificationID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, DropDownName
	, PageName
	, PageDescription
	, HeaderName
	, HeaderDescription
	, TopicName
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewClassificationValueId 
	, @ClassificationId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @DropDownName
	, @PageName
	, @PageDescription
	, @HeaderName
	, @HeaderDescription
	, @TopicName
	, @UserID
	, getdate()
	, @UserID
	, getdate())

INSERT ClassificationValueProperties (ClassificationValueID, ClassificationID, PropertyID, CreatorID, CreatedDate, ModifierID, ModifiedDate)
SELECT @NewClassificationValueId, @ClassificationId, PropertyID, @UserID, getdate(), @UserID, GETDATE() FROM ClassificationLevelProperties WHERE ClassificationLevelID = @ClassificationLevelId

	COMMIT TRANSACTION
