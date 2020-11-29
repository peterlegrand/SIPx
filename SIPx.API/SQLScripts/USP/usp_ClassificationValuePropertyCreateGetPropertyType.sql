CREATE PROCEDURE usp_ClassificationValuePropertyCreateGetPropertyType (@UserId nvarchar(450), @PropertyId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Properties.PropertyTypeID
	, ISNULL(UINameCustom.Customization,UIName.Name) PropertyTypeName
FROM PropertyTypes 
JOIN Properties	
ON Properties.PropertyTypeID = PropertyTypes.PropertyTypeID
JOIN UITermLanguages UIName
	ON UIName.UITermId = PropertyTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PropertyTypes.NameTermID
WHERE UIName.LanguageId = @LanguageID
