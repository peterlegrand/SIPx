CREATE PROCEDURE usp_PropertyValueIndexGet (@UserId nvarchar(450), @PropertyID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PropertyValues.PropertyValueID
	, PropertyValues.PropertyID
	, Properties.PropertyTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this PropertyValue level')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this PropertyValue level')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this PropertyValue level')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this PropertyValue level')) MouseOver
	, PropertyValues.PropertyValueBool
	, PropertyValues.PropertyValueInt
	, PropertyValues.PropertyValueDate
	, PropertyValues.PropertyValueString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PropertyValues.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, PropertyValues.ModifiedDate
FROM PropertyValues 
JOIN Properties	
	ON PropertyValues.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PropertyValueID= PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PropertyValueId = PropertyValues.PropertyValueID
JOIN Persons Creator
	ON Creator.UserId = PropertyValues.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PropertyValues.ModifierID
WHERE PropertyValues.PropertyID = @PropertyID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this PropertyValue level')) 
