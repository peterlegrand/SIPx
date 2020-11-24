CREATE PROCEDURE usp_ClassificationLevelPropertyDeleteGet (@UserId nvarchar(450), @ClassificationLevelPropertyId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevelProperties.ClassificationLevelPropertyID
	, ClassificationLevelProperties.ClassificationLevelID
	, ISNULL(PropertyUserLanguage.Name,ISNULL(PropertyDefaultLanguage.Name,'No name for this Property')) PropertyName
	, ISNULL(ClassificationLevelUserLanguage.Name,ISNULL(ClassificationLevelDefaultLanguage.Name,'No description for this classification level')) ClassificationLevelName
	, ISNULL(ClassificationUserLanguage.Name,ISNULL(ClassificationDefaultLanguage.Name,'No description for this classification')) ClassificationName
	, ISNULL(UINameCustom.Customization ,UIName.Name) PropertyTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Properties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Properties.ModifiedDate
FROM ClassificationLevelProperties 
JOIN Properties
	ON Properties.PropertyID = ClassificationLevelProperties.PropertyID
JOIN PropertyTypes
	ON Properties.PropertyTypeID = PropertyTypes.PropertyTypeID
JOIN UITermLanguages UIName
	ON UIName.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) PropertyUserLanguage
	ON PropertyUserLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) PropertyDefaultLanguage
	ON PropertyDefaultLanguage.PropertyId = Properties.PropertyID
LEFT JOIN (SELECT ClassificationLevelId, Name  FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) ClassificationLevelUserLanguage
	ON ClassificationLevelUserLanguage.ClassificationLevelID= ClassificationLevelProperties.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ClassificationLevelDefaultLanguage
	ON ClassificationLevelDefaultLanguage.ClassificationLevelId = ClassificationLevelProperties.ClassificationLevelID
LEFT JOIN (SELECT ClassificationId, Name  FROM ClassificationLanguages WHERE LanguageId = @LanguageID) ClassificationUserLanguage
	ON ClassificationUserLanguage.ClassificationID= ClassificationLevelProperties.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ClassificationDefaultLanguage
	ON ClassificationDefaultLanguage.ClassificationId = ClassificationLevelProperties.ClassificationID
JOIN Persons Creator
	ON Creator.UserId = Properties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Properties.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE UIName.LanguageId = @LanguageID
	AND LanguageTerm.LanguageID = @LanguageId
	AND ClassificationLevelProperties.ClassificationLevelPropertyId = @ClassificationLevelPropertyId
ORDER BY  ISNULL(PropertyUserLanguage.Name,ISNULL(PropertyDefaultLanguage.Name,'No name for this property')) 


