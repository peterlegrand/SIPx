CREATE PROCEDURE usp_ProjectTypePropertyIndexGet (@UserId nvarchar(450), @ObjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ProjectTypeProperty' AND Action = 'Index';

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogProjectTypePropertyList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT ProjectTypeProperties.ProjectTypePropertyID ObjectTypePropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ISNULL(UINameCustom.Customization ,UIName.Name) ObjectTypePropertyStatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectTypeProperties.ModifiedDate
FROM ProjectTypeProperties 
JOIN Properties 
	ON ProjectTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID



JOIN ObjectTypePropertyStatuses
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusID = ProjectTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages UIName
	ON UIName.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ObjectTypePropertyStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProjectTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectTypeProperties.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND ProjectTypeProperties.ProjectTypeID= @ObjectTypeId
ORDER BY  ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) 

COMMIT TRANSACTION