CREATE PROCEDURE usp_OrganizationAdvancedSearch(
	@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @ParentOrganizationId int
	, @OrganizationTypeId int
	, @StatusId int
	, @PersonId int)
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

DECLARE @statement NVARCHAR(2200);
DECLARE @FROM NVARCHAR(2200);
DECLARE @WHERE NVARCHAR(2200);

SET @FROM ='SELECT Organizations.OrganizationID ' +
	' , ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,''No name for this Organization'')) OrganizationName ' +
	' , ISNULL(OrganizationUserLanguage.Description,ISNULL(OrganizationDefaultLanguage.Description,''No description for this Organization'')) OrganizationDescription ' +
	' , Persons.FirstName + '' '' + Persons.LastName CreatorName ' +
	' , Persons.PersonID CreatorId ' +
	' , Organizations.CreatedDate ' +

' FROM  ' +
	' Organizations ' +
' LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID, FullText FROM OrganizationLanguages WHERE LanguageId = ' + trim(cast(@LanguageID as varchar(10))) 

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @FROM = @FROM + ' AND FREETEXT(OrganizationLanguages.Fulltext, ''' + TRIM(@Contains) + ''')'
END



SET @FROM = @FROM + '  ) OrganizationUserLanguage ' +
	' ON OrganizationUserLanguage.OrganizationID= Organizations.OrganizationID ' +
' LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID, FullText FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ' 

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @FROM = @FROM + ' AND FREETEXT(OrganizationLanguages.Fulltext, ''' + TRIM(@Contains) + ''')'
END


SET @FROM = @FROM + ') OrganizationDefaultLanguage ' +
	' ON OrganizationDefaultLanguage.OrganizationId = Organizations.OrganizationID ' +
' JOIN Persons  ' +
	' ON Persons.UserID = Organizations.CreatorID '

SET @WHERE = '  WHERE OrganizationUserLanguage.OrganizationID IS NOT NULL AND OrganizationDefaultLanguage.OrganizationID IS NOT NULL '


IF @ParentOrganizationId IS NOT NULL  AND @ParentOrganizationId <>0
BEGIN
SET @WHERE = @WHERE + ' AND Organizations.ParentOrganizationId = ' + trim(cast(@ParentOrganizationId as varchar(10)))   
END


IF @OrganizationTypeId IS NOT NULL AND @OrganizationTypeId <>0
BEGIN
SET @WHERE = @WHERE + ' AND Organizations.OrganizationTypeId = ' + trim(cast(@OrganizationTypeId as varchar(10))) 
END

IF @StatusId IS NOT NULL AND @StatusId <>0
BEGIN
SET @WHERE = @WHERE + ' AND Organizations.StatusId = ' + trim(cast(@StatusId as varchar(10))) 
END


IF @PersonId IS NOT NULL AND @PersonId <>0
BEGIN
SET @WHERE = @WHERE + ' AND CAST(Organizations.OrganizationId as varchar(10) IN (SELECT ClaimValue FROM AspRoleClaims JOIN AspUserRoles ON AspRoleClaims.RoleId = AspUserRoles.RoleId JOIN Persons ON AspUserRoles.UserId = Persons.UserId WHERE PersonId = ' + trim(cast(@PersonId as varchar(10)))  + ' AND AspRoleClaims.ClaimType = ''OrganizationRight'')' 
END

SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)
--SELECT @statement
EXECUTE sp_executesql @statement
