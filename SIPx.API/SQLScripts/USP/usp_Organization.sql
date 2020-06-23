CREATE PROCEDURE [dbo].[usp_Organization] (@UserID nvarchar(450), @OrganizationID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT 
	Organizations.OrganizationID
	, Organizations.OrganizationTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this organization')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this organization')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this organization')) MouseOver
	, ISNULL(UserTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this organization type')) OrganizationTypeName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, OrganizationTypes.Internal
	, OrganizationTypes.LegalEntity
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Organizations.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Organizations.ModifiedDate
FROM   Organizations
JOIN Statuses
	ON Statuses.StatusID = Organizations.StatusID
JOIN OrganizationTypes
	ON Organizations.OrganizationTypeID = OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationID, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationID, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationID = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationTypeID, Name FROM OrganizationTypeLanguages WHERE LanguageID = @LanguageID) UserTypeLanguage
	ON UserTypeLanguage.OrganizationTypeID= Organizations.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeID, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.OrganizationTypeID= Organizations.OrganizationTypeID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermID = StatusName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserStatusName
	ON Statuses.NameTermID = UserStatusName.UITermID  
JOIN Persons Creator
	ON Creator.UserID = Organizations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Organizations.ModifierID
WHERE StatusName.LanguageID = @LanguageID
	AND Organizations.OrganizationID = @OrganizationID
