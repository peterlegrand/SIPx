CREATE PROCEDURE [dbo].[usp_ClassificationValuesLimited] (@UserId nvarchar(450), @ClassificationId int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
		ON ClassificationValueLanguages.ClassificationValueId = ClassificationValues.ClassificationValueID
	WHERE ClassificationValues.ParentValueId IS NULL
		AND ClassificationValues.ClassificationId = @ClassificationID
		AND ClassificationValueLanguages.LanguageId = @LanguageID

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
		ON ClassificationValueLanguages.ClassificationValueId = ClassificationValueNextLevel.ClassificationValueID
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueId = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationId = @ClassificationID
		AND ClassificationValueLanguages.LanguageId = @LanguageID
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
--LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
--	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
--LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
--	ON DefaultLanguage.ClassificationValueId = ClassificationValueHierarchy.ClassificationValueID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueHierarchy.ModifierID
ORDER BY Path;
END;


