CREATE PROCEDURE usp_PropertyValueDeleteGet (@UserId nvarchar(450),@PropertyValueId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PropertyValues.PropertyValueID
	, PropertyValues.PropertyID
	, Properties.PropertyTypeID
	, ISNULL(CustomType.Customization,DefaultType.Name) DatePropertyTypeName
	, ISNULL(UserPropertyValueLanguage.Name,ISNULL(DefaultPropertyValueLanguage.Name,'No name for this classification level')) Name
	, ISNULL(UserPropertyValueLanguage.Description,ISNULL(DefaultPropertyValueLanguage.Description,'No description for this classification level')) Description
	, ISNULL(UserPropertyValueLanguage.MenuName,ISNULL(DefaultPropertyValueLanguage.MenuName,'No menu name for this classification level')) MenuName
	, ISNULL(UserPropertyValueLanguage.MouseOver,ISNULL(DefaultPropertyValueLanguage.MouseOver,'No drop Mouse over for this classification level')) MouseOver
	, PropertyValues.PropertyValueBool
	, PropertyValues.PropertyValueDate
	, PropertyValues.PropertyValueInt
	, PropertyValues.PropertyValueString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PropertyValues.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PropertyValues.ModifiedDate
FROM PropertyValues
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserPropertyValueLanguage
	ON UserPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyValueLanguage
	ON DefaultPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
JOIN Properties
	ON Properties.PropertyID = Propertyvalues.PropertyID
JOIN PropertyTypes
	ON PropertyTypes.PropertyTypeID = Properties.PropertyTypeID
JOIN UITermLanguages DefaultType
	ON DefaultType.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomType
	ON CustomType.UITermId = PropertyTypes.NameTermID

JOIN PropertyValueLanguages 
	ON PropertyValues.PropertyValueId = PropertyValueLanguages.PropertyValueID
JOIN Persons Creator
	ON Creator.UserId = PropertyValues.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PropertyValues.ModifierID
WHERE PropertyValueLanguages.LanguageId = @LanguageID
	AND PropertyValues.PropertyValueId = @PropertyValueID
	AND DefaultType.LanguageId = @LanguageID