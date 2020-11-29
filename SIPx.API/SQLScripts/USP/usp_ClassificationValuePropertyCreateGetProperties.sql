CREATE PROCEDURE usp_ClassificationValuePropertyCreateGetProperties (@UserId nvarchar(450), @ClassificationValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ClassificationId int;
SELECT @ClassificationId =  ClassificationId FROM ClassificationValues WHERE ClassificationValueId = @ClassificationValueId;
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
SELECT Properties.PropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) Name
FROM ClassificationLevels 
JOIN ClassificationLevelProperties 
	ON ClassificationLevels.ClassificationLevelId = ClassificationLevelProperties.ClassificationLevelId 
JOIN Properties 
	ON ClassificationLevelProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyId = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID

WHERE @ClassificationId = ClassificationLevels.ClassificationID AND Sequence = @Level

END;