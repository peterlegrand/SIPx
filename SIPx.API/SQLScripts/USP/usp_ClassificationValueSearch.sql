CREATE PROCEDURE [dbo].[usp_ClassificationValueSearch](@Contains nvarchar(500),  @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ClassificationValues.ClassificationValueID
	, ClassificationValues.CreatedDate
	, Persons.FirstName + ' ' + Persons.LastName CreatorName
	, Persons.PersonID CreatorId
	, ISNULL(ClassificationValueUserLanguage.Name,ISNULL(ClassificationValueDefaultLanguage.Name,'No name for this ClassificationValue')) ClassificationValueName
	, ISNULL(ClassificationValueUserLanguage.Description,ISNULL(ClassificationValueDefaultLanguage.Description,'No description for this ClassificationValue')) ClassificationValueDescription
	, ISNULL(ClassificationUserLanguage.Name,ISNULL(ClassificationDefaultLanguage.Name,'No name for this Classification')) ClassificationName
FROM 
	ClassificationValues
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID, FullText FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID AND Contains(ClassificationValueLanguages.Fulltext, @Contains)) ClassificationValueUserLanguage
	ON ClassificationValueUserLanguage.ClassificationValueID= ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID, FullText FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 AND Contains(ClassificationValueLanguages.Fulltext, @Contains)) ClassificationValueDefaultLanguage
	ON ClassificationValueDefaultLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID ) ClassificationUserLanguage
	ON ClassificationUserLanguage.ClassificationID= ClassificationValues.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ) ClassificationDefaultLanguage
	ON ClassificationDefaultLanguage.ClassificationId = ClassificationValues.ClassificationID
JOIN Persons 
	ON Persons.UserID = ClassificationValues.CreatorID
WHERE ClassificationValueUserLanguage.ClassificationValueID IS NOT NULL AND ClassificationValueDefaultLanguage.ClassificationValueID IS NOT NULL
