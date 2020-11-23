CREATE PROCEDURE usp_PropertyDeleteGet (@UserId nvarchar(450),@PropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Properties.PropertyID
	, ISNULL(CustomStatus.Customization,DefaultStatus.Name) PropertyTypeName
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this Property')) Name
	, ISNULL(UserPropertyLanguage.Description,ISNULL(DefaultPropertyLanguage.Description,'No description for this Property')) Description
	, ISNULL(UserPropertyLanguage.MenuName,ISNULL(DefaultPropertyLanguage.MenuName,'No menu name for this Property')) MenuName
	, ISNULL(UserPropertyLanguage.MouseOver,ISNULL(DefaultPropertyLanguage.MouseOver,'No drop Mouse over for this Property')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Properties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Properties.ModifiedDate
FROM Properties
LEFT JOIN (SELECT PropertyId, Name, Description, MenuName, MouseOver FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyId = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name, Description, MenuName, MouseOver FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID
JOIN PropertyTypes
	ON PropertyTypes.PropertyTypeID = Properties.PropertyTypeID
JOIN UITermLanguages DefaultStatus
	ON DefaultStatus.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomStatus
	ON CustomStatus.UITermId = PropertyTypes.NameTermID

JOIN PropertyLanguages 
	ON Properties.PropertyId = PropertyLanguages.PropertyID
JOIN Persons Creator
	ON Creator.UserId = Properties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Properties.ModifierID
WHERE PropertyLanguages.LanguageId = @LanguageID
	AND Properties.PropertyId = @PropertyID
	AND DefaultStatus.LanguageId = @LanguageID
