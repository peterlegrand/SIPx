CREATE PROCEDURE usp_PropertyValueCreateGetSequence (@UserId nvarchar(450), @PropertyId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PropertyValues.Sequence
	, ISNULL(UserPropertyValueLanguage.Name,ISNULL(DefaultPropertyValueLanguage.Name,'No name for this property value')) Name
FROM PropertyValues 
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserPropertyValueLanguage
	ON UserPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueId, Name, Description, MenuName, MouseOver FROM PropertyValueLanguages JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyValueLanguage
	ON DefaultPropertyValueLanguage.PropertyValueId = PropertyValues.PropertyValueID
WHERE PropertyValues.PropertyID = @PropertyId
ORDER BY  ISNULL(UserPropertyValueLanguage.Name,ISNULL(DefaultPropertyValueLanguage.Name,'No name for this level'))

