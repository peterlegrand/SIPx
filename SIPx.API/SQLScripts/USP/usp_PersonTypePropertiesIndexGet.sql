CREATE PROCEDURE usp_PersonTypePropertiesIndexGet (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'PersonTypeProperties' AND Action = 'Index';
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogPersonTypePropertiesList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT PersonTypePropertiess.PersonTypePropertiesID
	, ISNULL(UserLanguage.PersonTypePropertiesLanguageID,ISNULL(DefaultLanguage.PersonTypePropertiesLanguageID,0)) PersonTypePropertiesLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this PersonTypeProperties')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this PersonTypeProperties')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this PersonTypeProperties')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this PersonTypeProperties')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, CASE WHEN PersonTypePropertiess.DefaultPageId IS NULL THEN ISNULL(UserPersonTypePropertiesPageLanguage.Name,ISNULL(DefaultPersonTypePropertiesPageLanguage.Name,'No name for the default page')) ELSE 'There is no default page' END DefaultPageName
	, PersonTypePropertiess.DefaultPageID
	, PersonTypePropertiess.HasDropDown 
	, PersonTypePropertiess.DropDownSequence
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTypePropertiess.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTypePropertiess.ModifiedDate
FROM PersonTypePropertiess 
JOIN Statuses 
	ON Statuses.StatusId = PersonTypePropertiess.StatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT PersonTypePropertiesId, Name, Description, MenuName, MouseOver, PersonTypePropertiesLanguageID FROM PersonTypePropertiesLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PersonTypePropertiesID= PersonTypePropertiess.PersonTypePropertiesID
LEFT JOIN (SELECT PersonTypePropertiesId, Name, Description, MenuName, MouseOver, PersonTypePropertiesLanguageID FROM PersonTypePropertiesLanguages JOIN Settings ON PersonTypePropertiesLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PersonTypePropertiesId = PersonTypePropertiess.PersonTypePropertiesID
LEFT JOIN (SELECT PersonTypePropertiesPageId, Name FROM PersonTypePropertiesPageLanguages WHERE LanguageId = @LanguageID) UserPersonTypePropertiesPageLanguage
	ON UserPersonTypePropertiesPageLanguage.PersonTypePropertiesPageId = PersonTypePropertiess.DefaultPageID
LEFT JOIN (SELECT PersonTypePropertiesPageId, Name FROM PersonTypePropertiesPageLanguages  JOIN Settings ON PersonTypePropertiesPageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPersonTypePropertiesPageLanguage
	ON DefaultPersonTypePropertiesPageLanguage.PersonTypePropertiesPageId = PersonTypePropertiess.DefaultPageID
JOIN Persons Creator
	ON Creator.UserId = PersonTypePropertiess.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTypePropertiess.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE UIName.LanguageId = @LanguageID
	AND LanguageTerm.LanguageID = @LanguageId
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this PersonTypeProperties')) 



	COMMIT TRANSACTION