CREATE PROCEDURE [dbo].[usp_RoleList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AspNetRoles.ID RoleId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
FROM AspNetRoles  
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.RoleID= AspNetRoles.ID
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.RoleId = AspNetRoles.ID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Role')) 
