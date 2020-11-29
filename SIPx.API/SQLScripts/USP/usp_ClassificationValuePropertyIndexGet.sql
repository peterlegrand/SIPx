CREATE PROCEDURE usp_ClassificationValuePropertyIndexGet (@UserId nvarchar(450), @ClassificationValueID int) 
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
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification ValueProperty')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this classification ValueProperty')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this classification ValueProperty')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this classification ValueProperty')) MouseOver
	, ClassificationValueProperties.PropertyInt
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
WHERE ClassificationValueProperties.ClassificationValueID = @ClassificationValueID
	AND UILanguageName.LanguageID= @LanguageID
ORDER BY ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) 