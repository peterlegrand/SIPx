CREATE PROCEDURE usp_PropertyValueUpdateGet (@UserId nvarchar(450), @PropertyValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @PropertyTypeName nvarchar(max);
DECLARE @PropertyTypeId int;
SELECT 
	@PropertyTypeId = Properties.PropertyTypeID, @PropertyTypeName = ISNULL(UINameCustom.Customization ,UIName.Name) 
FROM PropertyTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PropertyTypes.NameTermID
JOIN Properties
	ON Properties.PropertyTypeID = PropertyTypes.PropertyTypeID
JOIN PropertyValues 
	ON Properties.PropertyID = PropertyValues.PropertyID
WHERE PropertyValues.PropertyValueID = @PropertyValueId


SELECT PropertyValues.PropertyValueID
	, PropertyValues.PropertyID
	, PropertyValues.Sequence
	, @PropertyTypeId PropertyTypeId
	, @PropertyTypeName PropertyTypeName
	, ISNULL(UserPropertyValueLanguage.Name,ISNULL(DefaultPropertyValueLanguage.Name,'No name for this role')) Name
	, ISNULL(UserPropertyValueLanguage.Description,ISNULL(DefaultPropertyValueLanguage.Description,'No description for this role')) Description
	, ISNULL(UserPropertyValueLanguage.MenuName,ISNULL(DefaultPropertyValueLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserPropertyValueLanguage.MouseOver,ISNULL(DefaultPropertyValueLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, PropertyValues.PropertyValueInt
	, PropertyValues.PropertyValueBool
	, PropertyValues.PropertyValueDate
	, PropertyValues.PropertyValueString
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, PropertyValues.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, PropertyValues.ModifiedDate
	, Modifier.PersonID ModifierID
FROM PropertyValues 
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver, PropertyValueLanguageId FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserPropertyValueLanguage
	ON UserPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver, PropertyValueLanguageId FROM PropertyValueLanguages JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyValueLanguage
	ON DefaultPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
JOIN Persons Creator
	ON Creator.UserId = PropertyValues.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PropertyValues.ModifierID
WHERE PropertyValues.PropertyValueId = @PropertyValueID
