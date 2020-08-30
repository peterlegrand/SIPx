CREATE PROCEDURE [dbo].[usp_ClassificationValueIndexGet] (@UserId nvarchar(450), @ClassificationId int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

WITH ClassificationValueHierarchy (ClassificationValueID
	, ClassificationID
	, DateFrom
	, DateTo
--	, Location
	, Path
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate
	, Level)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, ClassificationValues.ClassificationID
		, DateFrom
		, DateTo
--		, Location
		, CAST(ClassificationValues.ClassificationValueId AS VARCHAR(255)) AS Path
		, CreatorID
		, CreatedDate
		, ModifierID
		, ModifiedDate
		, 1
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueId IS NULL
		AND ClassificationValues.ClassificationId = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, ClassificationValueNextLevel.ClassificationID
		, ClassificationValueNextLevel.DateFrom
		, ClassificationValueNextLevel.DateTo
--		, ClassificationValueNextLevel.Location
		, CAST(ClassificationValueBaseLevel.Path + '.' + CAST(ClassificationValueNextLevel.ClassificationValueId AS VARCHAR(255)) AS VARCHAR(255))
		, ClassificationValueNextLevel.CreatorID
		, ClassificationValueNextLevel.CreatedDate
		, ClassificationValueNextLevel.ModifierID
		, ClassificationValueNextLevel.ModifiedDate
		, Level + 1
	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueId = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationId = @ClassificationID
)
-- Statement using the CTE
SELECT TOP (@Top) 
	ClassificationValueHierarchy.ClassificationValueID
	, ClassificationValueHierarchy.ClassificationID
	, DateFrom
	, DateTo
--	, ISNULL(Location, '') Location
	, ISNULL(UserClassificationLanguage.ClassificationLanguageID,ISNULL(DefaultClassificationLanguage.ClassificationLanguageID,0)) ClassificationLanguageID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,0)) ClassificationLanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this value')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this value')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this value')) MouseOver
	, ISNULL(UserLanguage.DropDownName,ISNULL(DefaultLanguage.DropDownName,'No drop downName for this value')) DropDownName
	, ISNULL(UserLanguage.PageName,ISNULL(DefaultLanguage.PageName,'No page name for this value')) PageName
	, ISNULL(UserLanguage.PageDescription,ISNULL(DefaultLanguage.PageDescription,'No page description for this value')) PageDescription
	, ISNULL(UserLanguage.HeaderName,ISNULL(DefaultLanguage.HeaderName,'No header name for this value')) HeaderName
	, ISNULL(UserLanguage.HeaderDescription,ISNULL(DefaultLanguage.HeaderDescription,'No header description for this value')) HeaderDescription
	, ISNULL(UserLanguage.TopicName,ISNULL(DefaultLanguage.TopicName,'No topic name for this value')) TopicName
	, Path
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationValueHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationValueHierarchy.ModifiedDate
	, Level
	, ClassificationLevels.MaxLevel
FROM   ClassificationValueHierarchy
LEFT JOIN (SELECT ClassificationId,ClassificationLanguageID, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID= ClassificationValueHierarchy.ClassificationID
LEFT JOIN (SELECT ClassificationId,ClassificationLanguageID, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ClassificationValueHierarchy.ClassificationID

LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueId = ClassificationValueHierarchy.ClassificationValueID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueHierarchy.ModifierID
JOIN (SELECT MAX(Sequence) MaxLevel, ClassificationId FROM ClassificationLevels GROUP BY ClassificationId) ClassificationLevels
	ON CLassificationLevels.ClassificationId = ClassificationValueHierarchy.ClassificationID
ORDER BY Path;
END;
