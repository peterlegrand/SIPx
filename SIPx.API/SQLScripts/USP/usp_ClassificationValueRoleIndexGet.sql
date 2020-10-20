CREATE PROCEDURE usp_ClassificationValueRoleIndexGet (@UserId nvarchar(450), @ClassificationValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationValueRoles.ClassificationValueRoleID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Role')) RoleName
	, ISNULL(UserRelationTypeLanguage.Name,ISNULL(DefaultRelationTypeLanguage.Name,'No name for this Role')) ClassificationRelationTypeName

FROM ClassificationValueRoles 
LEFT JOIN (SELECT RoleId, Name FROM RoleLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.RoleID= ClassificationValueRoles.RoleID
LEFT JOIN (SELECT RoleId, Name FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.RoleId = ClassificationValueRoles.RoleID

LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserRelationTypeLanguage
	ON UserRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueRoles.ClassificationRelationTypeId
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRelationTypeLanguage
	ON DefaultRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueRoles.ClassificationRelationTypeId


WHERE ClassificationValueRoles.ClassificationValueID = @ClassificationValueId
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Role'))
