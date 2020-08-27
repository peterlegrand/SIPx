CREATE PROCEDURE [dbo].[usp_OrganizationTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationTypes.OrganizationTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization type')) Name
FROM OrganizationTypes 
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationTypeID= OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name, Description, MenuName, MouseOver FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationTypeId = OrganizationTypes.OrganizationTypeID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization type')) 
