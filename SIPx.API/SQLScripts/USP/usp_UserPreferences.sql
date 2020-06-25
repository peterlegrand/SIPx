CREATE PROCEDURE [dbo].[usp_UserPreferences] (@UserID nvarchar(450), @SelectedUserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT UserPreferences.UserPreferenceID
	, UserPreferences.PreferenceTypeID
	, UserPreferences.StringPreference
	, UserPreferences.IntPreference
	, UserPreferences.DateTimePreference
	, UserPreferences.GuidPreference
	, UserPreferences.LocationPreference
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) TypeName
FROM UserPreferences 
JOIN PreferenceTypes
	ON UserPreferences.PreferenceTypeID = PreferenceTypes.PreferenceTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermID = PreferenceTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermID = PreferenceTypes.NameTermID
WHERE UITypeName.LanguageID = @LanguageID
AND UserPreferences.UserID= @SelectedUserID


