CREATE PROCEDURE usp_ClassificationLevelDeleteGet (@UserId nvarchar(450),@ClassificationLevelId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevels.ClassificationLevelID
	, ClassificationLevels.ClassificationID
	, ClassificationLevels.CodePrefix
	, ClassificationLevels.CodeSuffix
	, ClassificationLevels.CodeTypeId
	, ISNULL(CustomDateLevel.Customization,DefaultDateLevel.Name) DateLevelName
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.CanLink
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this classification level')) Name
	, ISNULL(UserClassificationLevelLanguage.Description,ISNULL(DefaultClassificationLevelLanguage.Description,'No description for this classification level')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName,ISNULL(DefaultClassificationLevelLanguage.MenuName,'No menu name for this classification level')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver,ISNULL(DefaultClassificationLevelLanguage.MouseOver,'No drop Mouse over for this classification level')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationLevels.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationLevels.ModifiedDate
FROM ClassificationLevels
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
JOIN DateLevels
	ON DateLevels.DateLevelID = ClassificationLevels.DateLevelID
JOIN UITermLanguages DefaultDateLevel
	ON DefaultDateLevel.UITermId = DateLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomDateLevel
	ON CustomDateLevel.UITermId = DateLevels.NameTermID

JOIN ClassificationLevelLanguages 
	ON ClassificationLevels.ClassificationLevelId = ClassificationLevelLanguages.ClassificationLevelID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLevels.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLevels.ModifierID
WHERE ClassificationLevelLanguages.LanguageId = @LanguageID
	AND ClassificationLevels.ClassificationLevelId = @ClassificationLevelID
	AND DefaultDateLevel.LanguageId = @LanguageID