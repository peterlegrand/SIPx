CREATE PROCEDURE [dbo].[usp_Organization] (@UserId nvarchar(450), @OrganizationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
	Organizations.OrganizationID
	, Organizations.OrganizationTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this organization')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this organization')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this organization')) MouseOver
	, ISNULL(UserTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this organization type')) OrganizationTypeName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, CASE WHEN Organizations.ParentOrganizationId = NULL THEN 'No parent Organization' ELSE ISNULL(UserParentOrganizationLanguage.Name,ISNULL(DefaultParentOrganizationLanguage.Name,'No name for this parent Organization')) END ParentOrganizationName
	, OrganizationTypes.Internal
	, OrganizationTypes.LegalEntity
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Organizations.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Organizations.ModifiedDate
FROM   Organizations
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserParentOrganizationLanguage
	ON UserParentOrganizationLanguage.OrganizationID= Organizations.ParentOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentOrganizationLanguage
	ON DefaultParentOrganizationLanguage.OrganizationId = Organizations.ParentOrganizationID
JOIN Statuses
	ON Statuses.StatusId = Organizations.StatusID
JOIN OrganizationTypes
	ON Organizations.OrganizationTypeId = OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage
	ON UserTypeLanguage.OrganizationTypeID= Organizations.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.OrganizationTypeID= Organizations.OrganizationTypeID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = Organizations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Organizations.ModifierID
WHERE StatusName.LanguageId = @LanguageID
	AND Organizations.OrganizationId = @OrganizationID
