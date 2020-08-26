CREATE PROCEDURE [dbo].[usp_FrontClassificationValueIndexGetRoles] (@CurrentUserId nvarchar(450), @ClassificationValueId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserId 
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationValueRoles.ClassificationValueRoleID
	, ClassificationValueRoles.ClassificationRelationTypeID
	, ClassificationValueRoles.ClassificationValueID
	, ClassificationValueRoles.RoleID
	, AspNetRoles.Name
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation type')) ClassificationRelationTypeName

FROM ClassificationValueRoles
JOIN AspNetRoles
	ON ClassificationValueRoles.RoleID = AspNetRoles.Id

LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID= ClassificationValueRoles.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueRoles.ClassificationRelationTypeID
WHERE ClassificationValueRoles.ClassificationValueID = @ClassificationValueId
END