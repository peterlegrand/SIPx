CREATE PROCEDURE usp_FrontOrganizationAdvancedSearchPost (
	@UserId nvarchar(450) 
	, @OrganizationName nvarchar(max) =''
	, @OrganizationParentId int
	, @OrganizationStatusId int
	, @OrganizationTypeId int 
	, @CountryId int
	, @OrganizationProvinceState nvarchar(max) =''
	, @OrganizationCity nvarchar(max) =''
	, @LegalEntity int
	, @Internal int
	, @IAmMemberOfOrganization int
	)
AS

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT Organizations.OrganizationID 
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization')) Name
FROM Organizations
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = Organizations.OrganizationID
--JOIN OrganizationAddresses
--	ON Organizations.OrganizationID = OrganizationAddresses.OrganizationID
JOIN OrganizationLanguages
	ON OrganizationLanguages.OrganizationID = Organizations.OrganizationID
WHERE (OrganizationLanguages.Name LIKE '%' + @OrganizationName + '%' OR @OrganizationName = '' OR @OrganizationName IS NULL )
	AND (Organizations.ParentOrganizationID = @OrganizationParentId OR @OrganizationParentId=0)
	AND (Organizations.StatusID = @OrganizationStatusId OR @OrganizationStatusId = 0)
	AND (Organizations.OrganizationTypeId = @OrganizationTypeId OR @OrganizationTypeId = 0)
	AND (Organizations.OrganizationID IN (SELECT OrganizationID FROM OrganizationAddresses WHERE CountryId = @CountryId) OR @CountryId = 0)
	AND (Organizations.OrganizationID IN (SELECT OrganizationID FROM OrganizationAddresses WHERE ProvinceState LIKE '%' + @OrganizationProvinceState + '%') OR @OrganizationProvinceState = ''OR @OrganizationProvinceState IS NULL)
	AND (Organizations.OrganizationID IN (SELECT OrganizationID FROM OrganizationAddresses WHERE City LIKE '%' + @OrganizationCity + '%') OR @OrganizationCity = '' OR @OrganizationCity IS NULL)
	AND (Organizations.OrganizationTypeID IN (SELECT @OrganizationTypeId FROM OrganizationTypes WHERE CAST(LegalEntity as int)  = @LegalEntity-1) OR @LegalEntity = 0)
	AND (Organizations.OrganizationTypeID IN (SELECT @OrganizationTypeId FROM OrganizationTypes WHERE CAST(Internal as int)  = @Internal-1) OR @Internal = 0)
	AND (
			(Organizations.OrganizationID IN (
				SELECT CAST(ClaimValue as int) 
				FROM AspNetRoleClaims 
				JOIN AspNetUserRoles 
					ON AspNetRoleClaims.RoleId = AspNetUserRoles.RoleId 
				WHERE AspNetUserRoles.UserId = @UserId 
					AND AspNetRoleClaims.ClaimType = 'OrganizationRight') AND @IAmMemberOfOrganization= 1)
			OR
			(Organizations.OrganizationID NOT IN (
				SELECT CAST(ClaimValue as int) 
				FROM AspNetRoleClaims 
				JOIN AspNetUserRoles 
					ON AspNetRoleClaims.RoleId = AspNetUserRoles.RoleId 
				WHERE AspNetUserRoles.UserId = @UserId 
					AND AspNetRoleClaims.ClaimType = 'OrganizationRight') AND @IAmMemberOfOrganization= 2)
			
			OR @IAmMemberOfOrganization = 0)
			