CREATE PROCEDURE usp_FrontOrganizationContentTypeIndexGet (@UserId nvarchar(450), @OrganizationId int)
AS
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT @SecurityLevelId = SecurityLevelID FROM AspNetUsers WHERE id = @UserId;

SELECT 
	Contenttypes.ContentTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) ContentTypeName
	, Contenttypes.ContentTypeGroupID 
FROM ContentTypes
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID
JOIN ContentTypeRoles 
	ON ContentTypeRoles.ContentTypeId = ContentTypes.ContentTypeID 
JOIN AspNetRoles
	ON ContentTypeRoles.RoleId = AspNetRoles.Id
JOIN AspNetUserRoles 
	ON AspNetRoles.Id = AspNetUserRoles.RoleId 
WHERE ContentTypes.SecurityLevelID <= @SecurityLevelId
	AND AspNetRoles.ProjectId IS NULL
	AND AspNetRoles.OrganizationId = @OrganizationId
	AND ContentTypeRoles.CanCreate = 1
ORDER BY 	 ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type'))
