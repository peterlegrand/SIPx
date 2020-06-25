CREATE PROCEDURE [dbo].[usp_ClassificationValuesLimited] (@UserID nvarchar(450), @ClassificationID int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

WITH ClassificationValueHierarchy (
	ClassificationValueID
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
	, DateFrom
	, DateTo
	, Location
	, Path	
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, ClassificationValueLanguages.Name
		, ClassificationValueLanguages.Description
		, ClassificationValueLanguages.MenuName
		, ClassificationValueLanguages.MouseOver
		, ClassificationValueLanguages.DropDownName
		, ClassificationValueLanguages.PageName
		, ClassificationValueLanguages.PageDescription
		, ClassificationValueLanguages.HeaderName
		, ClassificationValueLanguages.HeaderDescription
		, ClassificationValueLanguages.TopicName
		, ClassificationValues.DateFrom
		, ClassificationValues.DateTo
		, ClassificationValues.Location
		, CAST(ClassificationValueLanguages.Name AS VARCHAR(255)) AS Path
		, ClassificationValues.CreatorID
		, ClassificationValues.CreatedDate
		, ClassificationValues.ModifierID
		, ClassificationValues.ModifiedDate
	FROM ClassificationValues 
	JOIN ClassificationValueLanguages 
		ON ClassificationValueLanguages.ClassificationValueID = ClassificationValues.ClassificationValueID
	WHERE ClassificationValues.ParentValueID IS NULL
		AND ClassificationValues.ClassificationID = @ClassificationID
		AND ClassificationValueLanguages.LanguageID = @LanguageID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, ClassificationValueLanguages.Name
		, ClassificationValueLanguages.Description
		, ClassificationValueLanguages.MenuName
		, ClassificationValueLanguages.MouseOver
		, ClassificationValueLanguages.DropDownName
		, ClassificationValueLanguages.PageName
		, ClassificationValueLanguages.PageDescription
		, ClassificationValueLanguages.HeaderName
		, ClassificationValueLanguages.HeaderDescription
		, ClassificationValueLanguages.TopicName
		, ClassificationValueNextLevel.DateFrom
		, ClassificationValueNextLevel.DateTo
		, ClassificationValueNextLevel.Location
		, CAST(ClassificationValueBaseLevel.Path + '.' + CAST(ClassificationValueLanguages.Name AS VARCHAR(255)) AS VARCHAR(255))
		, ClassificationValueLanguages.CreatorID
		, ClassificationValueLanguages.CreatedDate
		, ClassificationValueLanguages.ModifierID
		, ClassificationValueLanguages.ModifiedDate
	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueLanguages 
		ON ClassificationValueLanguages.ClassificationValueID = ClassificationValueNextLevel.ClassificationValueID
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueID = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationID = @ClassificationID
		AND ClassificationValueLanguages.LanguageID = @LanguageID
)
-- Statement using the CTE
SELECT TOP (@Top) ClassificationValueHierarchy.ClassificationValueID
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
	, DateFrom
	, Dateto
	, Location
	, Path
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueHierarchy.ModifiedDate
FROM   ClassificationValueHierarchy
--LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages WHERE LanguageID = @LanguageID) UserLanguage
--	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
--LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
--	ON DefaultLanguage.ClassificationValueID = ClassificationValueHierarchy.ClassificationValueID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValueHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValueHierarchy.ModifierID
ORDER BY Path;
END;


