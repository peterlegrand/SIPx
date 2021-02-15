CREATE PROCEDURE usp_OrganizationTypePropertyIndexGet (@UserId nvarchar(450), @ObjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'OrganizationTypeProperty' AND Action = 'Index';

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogOrganizationTypePropertyList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT OrganizationTypeProperties.OrganizationTypePropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTypeProperties.ModifiedDate
FROM OrganizationTypeProperties 
JOIN Properties 
	ON OrganizationTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID



JOIN ObjectTypePropertyStatuses
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusID = OrganizationTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages UIName
	ON UIName.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ObjectTypePropertyStatuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = OrganizationTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTypeProperties.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND OrganizationTypeProperties.OrganizationTypeID= @ObjectTypeId
ORDER BY  ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) 

COMMIT TRANSACTION