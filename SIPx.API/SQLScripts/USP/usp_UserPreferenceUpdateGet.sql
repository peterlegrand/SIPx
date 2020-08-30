CREATE PROCEDURE [dbo].[usp_UserPreferenceUpdateGet] (@UserId nvarchar(450),@UserPreferenceID Int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserPreferences.UserPreferenceID
	, UserPreferences.PreferenceTypeID
	, UserPreferences.StringPreference
	, UserPreferences.IntPreference
	, UserPreferences.DateTimePreference
	, UserPreferences.GuidPreference
	, '' LocationPreference
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) TypeName
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, UserPreferences.ModifierID
	, UserPreferences.ModifiedDate
FROM UserPreferences 
JOIN PreferenceTypes
	ON UserPreferences.PreferenceTypeId = PreferenceTypes.PreferenceTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = PreferenceTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId = PreferenceTypes.NameTermID
JOIN Persons Modifier
	ON Modifier.UserId = UserPreferences.ModifierID
WHERE UITypeName.LanguageId = @LanguageID
AND UserPreferences.UserPreferenceId = @UserPreferenceID


