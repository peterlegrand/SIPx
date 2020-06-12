CREATE PROCEDURE [dbo].[usp_ClassificationValues] (@UserID nvarchar(450), @ClassificationID int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

WITH ClassificationValueHierarchy (ClassificationValueID, Path)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, CAST(ClassificationValues.ClassificationValueID AS VARCHAR(255)) AS Path
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueID IS NULL
		AND ClassificationValues.ClassificationID = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, CAST(ClassificationValueBaseLevel.Path + '.' + CAST(ClassificationValueNextLevel.ClassificationValueID AS VARCHAR(255)) AS VARCHAR(255))

	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueID = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationID = @ClassificationID
)
-- Statement using the CTE
SELECT TOP (@Top) ClassificationValueHierarchy.ClassificationValueID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	--, Path
FROM   ClassificationValueHierarchy
LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueID = ClassificationValueHierarchy.ClassificationValueID
ORDER BY Path;
END;
