CREATE PROCEDURE usp_PropertyIndexGet (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Properties.PropertyID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Property')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Property')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Property')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Property')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) PropertyTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Properties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Properties.ModifiedDate
FROM Properties 
JOIN PropertyTypes
	ON Properties.PropertyTypeID = PropertyTypes.PropertyTypeID
JOIN UITermLanguages UIName
	ON UIName.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT PropertyId, Name, Description, MenuName, MouseOver, PropertyLanguageID FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name, Description, MenuName, MouseOver, PropertyLanguageID FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PropertyId = Properties.PropertyID
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
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Property')) 


