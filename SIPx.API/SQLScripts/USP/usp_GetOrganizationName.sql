CREATE PROCEDURE usp_GetOrganizationName (@UserId nvarchar(450), @OrganizationId int) 
AS 
BEGIN
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


SELECT
	 ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this Organization')) OrganizationName
FROM   Organizations
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID
WHERE  Organizations.OrganizationId = @OrganizationId
END;
