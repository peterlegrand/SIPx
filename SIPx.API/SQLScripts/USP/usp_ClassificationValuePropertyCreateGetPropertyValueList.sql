CREATE PROCEDURE usp_ClassificationValuePropertyCreateGetPropertyValueList (@UserId nvarchar(450), @PropertyId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @PropertyTypeId int;
SELECT @PropertyTypeId = PropertyTypeId FROM Properties WHERE PropertyId = @PropertyId;

IF @PropertyTypeId = 6
BEGIN
SELECT PropertyValues.PropertyValueId,  
CONVERT(VARCHAR, PropertyValues.PropertyValueDate, 102) Name
FROM PropertyValues 
WHERE PropertyId = @PropertyId 
ORDER BY PropertyValues.PropertyValueDate
END

IF @PropertyTypeId = 7
BEGIN
SELECT PropertyValues.PropertyValueId,  
CONVERT(VARCHAR, PropertyValues.PropertyValueInt) Name
FROM PropertyValues 
WHERE PropertyId = @PropertyId 
ORDER BY PropertyValues.PropertyValueInt
END

IF @PropertyTypeId = 8
BEGIN
SELECT PropertyValues.PropertyValueId,  
PropertyValues.PropertyValueString Name
FROM PropertyValues 
WHERE PropertyId = @PropertyId 
ORDER BY PropertyValues.PropertyValueString
END

IF @PropertyTypeId = 9
BEGIN
SELECT PropertyValues.PropertyValueId  
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) Name
FROM PropertyValues 
LEFT JOIN (SELECT PropertyValueId, Name FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PropertyValueID = PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueID, Name FROM PropertyValueLanguages  JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PropertyValueID = PropertyValues.PropertyValueID
WHERE PropertyId = @PropertyId 
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value'))
END

IF @PropertyTypeId = 10
BEGIN
SELECT PropertyValues.PropertyValueId,  
PropertyValues.PropertyValueString Name
FROM PropertyValues 
WHERE PropertyId = @PropertyId 
ORDER BY PropertyValues.Sequence
END

IF @PropertyTypeId = 11
BEGIN
SELECT PropertyValues.PropertyValueId  
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this value')) Name
FROM PropertyValues 
LEFT JOIN (SELECT PropertyValueId, Name FROM PropertyValueLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PropertyValueID = PropertyValues.PropertyValueID
LEFT JOIN (SELECT PropertyValueID, Name FROM PropertyValueLanguages  JOIN Settings ON PropertyValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PropertyValueID = PropertyValues.PropertyValueID
WHERE PropertyId = @PropertyId 
ORDER BY PropertyValues.Sequence
END
