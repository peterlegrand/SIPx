CREATE PROCEDURE [dbo].[usp_OrganizationList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
	Organizations.OrganizationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization')) Name
FROM   Organizations
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = Organizations.OrganizationID
WHERE Organizations.StatusID = 1
