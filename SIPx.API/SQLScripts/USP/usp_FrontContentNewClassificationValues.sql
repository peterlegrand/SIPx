CREATE PROCEDURE usp_FrontContentNewClassificationValues (@UserId nvarchar(450), @ClassificationId int, @Sequence int, @Alphabetical bit) --, @ParentValueId int ) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

WITH ClassificationValueHierarchy (ClassificationValueID
	, Level, ParentValueId)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, 1
		, ParentValueID
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueId IS NULL
		AND ClassificationValues.ClassificationId = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, Level + 1
		, ClassificationValueNextLevel.ParentValueId
	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueId = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationId = @ClassificationID
)
-- Statement using the CTE
SELECT ClassificationValueHierarchy.ClassificationValueID 
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) Name
	
FROM   ClassificationValueHierarchy
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueId = ClassificationValueHierarchy.ClassificationValueID
WHERE  ClassificationValueHierarchy.Level = @Sequence --AND  (ParentValueId = @ParentValueID OR ParentValueId = NULL)
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) 
END;
