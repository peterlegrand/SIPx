CREATE PROCEDURE [dbo].[usp_OrganizationType] (@UserID nvarchar(450), @OrganizationTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT OrganizationTypes.OrganizationTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this organization type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this organization type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this organization type')) MouseOver
	, OrganizationTypes.Internal
	, OrganizationTypes.LegalEntity
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationTypes.ModifiedDate
FROM OrganizationTypes 
LEFT JOIN (SELECT OrganizationTypeID, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationTypeID= OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationTypeID = OrganizationTypes.OrganizationTypeID
JOIN Persons Creator
	ON Creator.UserID = OrganizationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationTypes.ModifierID
WHERE OrganizationTypes.OrganizationTypeID = @OrganizationTypeID