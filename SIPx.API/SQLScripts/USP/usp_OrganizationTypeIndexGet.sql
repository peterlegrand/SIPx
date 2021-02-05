CREATE PROCEDURE [dbo].[usp_OrganizationTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationTypes.OrganizationTypeID
	, ObjectTypeStatusId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this organization type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this organization type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this organization type')) MouseOver
	, OrganizationTypes.Internal
	, OrganizationTypes.LegalEntity
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTypes.ModifiedDate
FROM OrganizationTypes 
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationTypeID= OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationTypeId = OrganizationTypes.OrganizationTypeID
JOIN Persons Creator
	ON Creator.UserId = OrganizationTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTypes.ModifierID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization type'))