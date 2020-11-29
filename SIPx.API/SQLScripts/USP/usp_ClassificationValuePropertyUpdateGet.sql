CREATE PROCEDURE usp_ClassificationValuePropertyUpdateGet (@UserId nvarchar(450), @ClassificationValuePropertyId int) 
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
	, Properties.PropertyTypeID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this classification value')) ClassificationValueName
	, ISNULL(UserClassificationValuePropertyLanguage.Name,ISNULL(DefaultClassificationValuePropertyLanguage.Name,'No name for this classification ValueProperty')) Name
	, ISNULL(UserClassificationValuePropertyLanguage.Description,ISNULL(DefaultClassificationValuePropertyLanguage.Description,'No description for this classification ValueProperty')) Description
	, ISNULL(UserClassificationValuePropertyLanguage.MenuName,ISNULL(DefaultClassificationValuePropertyLanguage.MenuName,'No menu name for this classification ValueProperty')) MenuName
	, ISNULL(UserClassificationValuePropertyLanguage.MouseOver,ISNULL(DefaultClassificationValuePropertyLanguage.MouseOver,'No mouse over for this classification ValueProperty')) MouseOver
	, ClassificationValueProperties.PropertyValueId
	, Properties.PropertyTypeId
	, ClassificationValueProperties.PropertyInt
	, ClassificationValueProperties.PropertyString
	, ClassificationValueProperties.PropertyBool
	, ClassificationValueProperties.PropertyDate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationValueProperties.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationValueProperties.ModifiedDate
	, Modifier.PersonID ModifierID
FROM ClassificationValueProperties 
JOIN Properties	
	ON Properties.PropertyID = ClassificationValueProperties.PropertyID
LEFT JOIN (SELECT ClassificationValuePropertyId, Name, Description, MenuName, MouseOver, ClassificationValuePropertyLanguageId FROM ClassificationValuePropertyLanguages WHERE LanguageId = @LanguageID) UserClassificationValuePropertyLanguage
	ON UserClassificationValuePropertyLanguage.ClassificationValuePropertyId = ClassificationValueProperties.ClassificationValuePropertyID
LEFT JOIN (SELECT ClassificationValuePropertyId, Name, Description, MenuName, MouseOver, ClassificationValuePropertyLanguageId FROM ClassificationValuePropertyLanguages JOIN Settings ON ClassificationValuePropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValuePropertyLanguage
	ON DefaultClassificationValuePropertyLanguage.ClassificationValuePropertyId = ClassificationValueProperties.ClassificationValuePropertyID

LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= ClassificationValueProperties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = ClassificationValueProperties.PropertyID

LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID= ClassificationValueProperties.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ClassificationValueProperties.ClassificationID

LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueID= ClassificationValueProperties.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValueProperties.ClassificationValueID

JOIN Persons Creator
	ON Creator.UserId = ClassificationValueProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueProperties.ModifierID
WHERE ClassificationValueProperties.ClassificationValuePropertyId = @ClassificationValuePropertyID
	