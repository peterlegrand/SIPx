CREATE PROCEDURE usp_PersonTypePropertyIndexGet (@UserId nvarchar(450), @ObjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'PersonTypeProperty' AND Action = 'Index';

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogPersonTypePropertyList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT PersonTypeProperties.PersonTypePropertyID ObjectTypePropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ISNULL(UINameCustom.Customization ,UIName.Name) ObjectTypePropertyStatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTypeProperties.ModifiedDate
FROM PersonTypeProperties 
JOIN Properties 
	ON PersonTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID



JOIN ObjectTypePropertyStatuses
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusID = PersonTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages UIName
	ON UIName.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ObjectTypePropertyStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = PersonTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTypeProperties.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND PersonTypeProperties.PersonTypeID= @ObjectTypeId
ORDER BY  ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) 

COMMIT TRANSACTION