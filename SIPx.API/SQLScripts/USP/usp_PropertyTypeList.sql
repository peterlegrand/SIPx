CREATE PROCEDURE usp_PropertyTypeList (@UserID nvarchar(450)) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	PropertyTypes.PropertyTypeId
	, ISNULL(UINameCustom.Customization ,UIName.Name) Name
FROM PropertyTypes
JOIN UITermLanguages UIName
	ON UIName.UITermID = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = PropertyTypes.NameTermID
WHERE UIName.LanguageID = @LanguageID
END