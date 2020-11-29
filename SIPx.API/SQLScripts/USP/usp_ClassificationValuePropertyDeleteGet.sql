CREATE PROCEDURE usp_ClassificationValuePropertyDeleteGet (@UserId nvarchar(450), @ClassificationValuePropertyID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueProperties.ClassificationValuePropertyID
	, ClassificationValueProperties.ClassificationValueID
	, ClassificationValueProperties.ClassificationID
	, ClassificationValueProperties.PropertyID
	, ClassificationValueProperties.PropertyValueID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this classification value')) ClassificationValueName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification ValueProperty')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this classification ValueProperty')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this classification ValueProperty')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this classification ValueProperty')) MouseOver
	, ClassificationValueProperties.PropertyInt
	, Properties.PropertyTypeID
	, ClassificationValueProperties.PropertyString
	, ClassificationValueProperties.PropertyDate
	, ClassificationValueProperties.PropertyBool
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationValueProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, ClassificationValueProperties.ModifiedDate
FROM ClassificationValueProperties 
JOIN Properties	
	ON ClassificationValueProperties.PropertyID = Properties.PropertyID	
LEFT JOIN (SELECT ClassificationValuePropertyId, Name, Description, MenuName, MouseOver FROM ClassificationValuePropertyLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValuePropertyID= ClassificationValueProperties.ClassificationValuePropertyID
LEFT JOIN (SELECT ClassificationValuePropertyId, Name, Description, MenuName, MouseOver FROM ClassificationValuePropertyLanguages JOIN Settings ON ClassificationValuePropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValuePropertyId = ClassificationValueProperties.ClassificationValuePropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= ClassificationValueProperties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = ClassificationValueProperties.PropertyID
LEFT JOIN (SELECT PropertyValueId, Name FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserPropertyValueLanguage
	ON UserPropertyValueLanguage.PropertyValueID= ClassificationValueProperties.PropertyValueID
LEFT JOIN (SELECT PropertyValueId, Name FROM PropertyValueLanguages JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyValueLanguage
	ON DefaultPropertyValueLanguage.PropertyValueId = ClassificationValueProperties.ClassificationValueID

LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID= ClassificationValueProperties.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ClassificationValueProperties.ClassificationID

LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueID= ClassificationValueProperties.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValueProperties.ClassificationValueID


JOIN Languages 
	ON Languages.LanguageId = @LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueProperties.ModifierID
WHERE ClassificationValueProperties.ClassificationValuePropertyID = @ClassificationValuePropertyID
	AND UILanguageName.LanguageID= @LanguageID