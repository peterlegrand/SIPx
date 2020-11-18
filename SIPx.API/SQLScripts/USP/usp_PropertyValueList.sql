CREATE PROCEDURE usp_PropertyValueList (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PropertyValues.PropertyValueID 
	, ISNULL(UserPropertyValueLanguage.Name,ISNULL(DefaultPropertyValueLanguage.Name,'No name for this PropertyValue')) Name
FROM PropertyValues
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserPropertyValueLanguage
	ON UserPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyValueLanguage
	ON DefaultPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID

ORDER BY ISNULL(UserPropertyValueLanguage.Name,ISNULL(DefaultPropertyValueLanguage.Name,'No name for this PropertyValue'))

