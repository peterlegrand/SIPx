CREATE PROCEDURE [dbo].[usp_ClassificationValues] (@UserID nvarchar(450), @ClassificationID int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

WITH ClassificationValueHierarchy (ClassificationValueID
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
		, CAST(ClassificationValues.ClassificationValueID AS VARCHAR(255)) AS Path
		, CreatorID
		, CreatedDate
		, ModifierID
		, ModifiedDate
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueID IS NULL
		AND ClassificationValues.ClassificationID = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, ClassificationValueNextLevel.DateFrom
		, ClassificationValueNextLevel.DateTo
--		, ClassificationValueNextLevel.Location
		, CAST(ClassificationValueBaseLevel.Path + '.' + CAST(ClassificationValueNextLevel.ClassificationValueID AS VARCHAR(255)) AS VARCHAR(255))
		, ClassificationValueNextLevel.CreatorID
		, ClassificationValueNextLevel.CreatedDate
		, ClassificationValueNextLevel.ModifierID
		, ClassificationValueNextLevel.ModifiedDate
	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueID = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationID = @ClassificationID
)
-- Statement using the CTE
SELECT TOP (@Top) 
	ClassificationValueHierarchy.ClassificationValueID
	, DateFrom
	, DateTo
--	, ISNULL(Location, '') Location
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this value')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this value')) MenuName
	, ISNULL(UserLanguage.DropDownName,ISNULL(DefaultLanguage.DropDownName,'No drop downName for this value')) DropDownName
	, ISNULL(UserLanguage.PageName,ISNULL(DefaultLanguage.PageName,'No page name for this value')) PageName
	, ISNULL(UserLanguage.PageDescription,ISNULL(DefaultLanguage.PageDescription,'No page description for this value')) PageDescription
	, ISNULL(UserLanguage.HeaderName,ISNULL(DefaultLanguage.HeaderName,'No header name for this value')) HeaderName
	, ISNULL(UserLanguage.HeaderDescription,ISNULL(DefaultLanguage.HeaderDescription,'No header description for this value')) HeaderDescription
	, ISNULL(UserLanguage.TopicName,ISNULL(DefaultLanguage.TopicName,'No topic name for this value')) TopicName
	, Path
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueHierarchy.ModifiedDate
FROM   ClassificationValueHierarchy
LEFT JOIN (SELECT ClassificationValueID, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueID, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName  FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueID = ClassificationValueHierarchy.ClassificationValueID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValueHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValueHierarchy.ModifierID
ORDER BY Path;
END;
