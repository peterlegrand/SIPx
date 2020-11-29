CREATE PROCEDURE usp_FrontContentNewClassificationValuesOld (@UserId nvarchar(450), @ClassificationId int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

WITH ClassificationValueHierarchy (
	ClassificationValueID
	, DateFrom
	, DateTo
--	, Location
	, Path
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, DateFrom
		, DateTo
--		, Location
		, CAST(ClassificationValues.ClassificationValueId AS VARCHAR(255)) AS Path
		, CreatorID
		, CreatedDate
		, ModifierID
		, ModifiedDate
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueId IS NULL
		AND ClassificationValues.ClassificationId = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, ClassificationValueNextLevel.DateFrom
		, ClassificationValueNextLevel.DateTo
--		, ClassificationValueNextLevel.Location
		, CAST(ClassificationValueBaseLevel.Path + '.' + CAST(ClassificationValueNextLevel.ClassificationValueId AS VARCHAR(255)) AS VARCHAR(255))
		, ClassificationValueNextLevel.CreatorID
		, ClassificationValueNextLevel.CreatedDate
		, ClassificationValueNextLevel.ModifierID
		, ClassificationValueNextLevel.ModifiedDate
	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueId = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationId = @ClassificationID
)
-- Statement using the CTE
SELECT TOP (@Top) 
	ClassificationValueHierarchy.ClassificationValueID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) Name
	, @ClassificationId ClassificationId
FROM   ClassificationValueHierarchy
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueId = ClassificationValueHierarchy.ClassificationValueID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueHierarchy.ModifierID
ORDER BY Path;
END;
