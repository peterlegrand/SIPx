CREATE PROCEDURE usp_PersonAdvancedSearch(
	@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @age int = null
	, @Birthdate datetime = null
	, @MainOrganizationId int = null
	, @IsUser int = null
	, @RoleId nvarchar(450) = null
	, @OrganizationId int = null
	, @ProjectId int = null
	, @CountryId int = null
	, @ProvinceState nvarchar(50) = null
	, @County nvarchar(50) = null
	, @City nvarchar(50) = null
	, @ClassificationId int = null
	, @ClassificationValueId int = null
	)
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

IF @Contains IS NULL
BEGIN
SET @Contains = ''
END

DECLARE @statement NVARCHAR(MAX);
DECLARE @FROM NVARCHAR(MAX);
DECLARE @WHERE NVARCHAR(MAX);
SET @FROM = 'SELECT Persons.PersonID ' +
	', Persons.FirstName ' +
	', Persons.MiddleName ' +
	', persons.LastName ' +
	', Persons.NickName ' +
	', ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,''No name for this organization'')) OrganizationName ' +
	', persons.DefaultOrganizationID OrganizationId ' +
	', Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
	', Creator.PersonID CreatorID ' +
	', Persons.CreatedDate ' +
' FROM  ' +
' Persons ' +
--' JOIN OrganizationLanguages ' +
--' ON Persons.DefaultOrganizationID = OrganizationLanguages.OrganizationID ' +
' LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = ' + trim(cast(@LanguageID as varchar(10))) + ') OrganizationUserLanguage' +
' ON OrganizationUserLanguage.OrganizationID= Persons.DefaultOrganizationID ' +
' LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage ' +
' ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID ' +
' JOIN Persons Creator ' +
' ON Creator.UserId = Persons.CreatorID '

SET @WHERE=' WHERE 1=1 ' 
--' AND OrganizationLanguages.LanguageID = ' +  trim(cast( @LanguageID as varchar(10)))



IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Freetext(Persons.Fulltext, ''' + trim(@Contains) + ''') ' 
END


IF @Age IS NOT NULL AND @Age <> 0
BEGIN
SET @WHERE = @WHERE + ' AND datediff(year,persons.Birthdate,getdate()) <= ' +trim(cast(  @age  as varchar(10))) 
+ ' AND datediff(year,persons.Birthdate,getdate()) + 1 > ' +trim(cast(  @age  as varchar(10)))
END


IF @Birthdate IS NOT NULL AND @Birthdate <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Month(persons.Birthdate) = ' + trim(cast( month(@Birthdate ) as varchar(28))) + 
	' AND Day(persons.Birthdate) = ' + trim(cast( day(@Birthdate ) as varchar(28)))
END


IF @MainOrganizationId IS NOT NULL AND @MainOrganizationId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND persons.DefaultOrganizationId = ' + trim(cast( @MainOrganizationId  as varchar(10)))
END



IF @IsUser = 0 
BEGIN
SET @WHERE = @WHERE + ' AND persons.UserId IS NULL ' 
END


IF @IsUser = 1
BEGIN
SET @WHERE = @WHERE + ' AND persons.UserId IS NOT NULL ' 
END

--SET @WHERE = @WHERE + cast(@isuser as varchar(2))

IF @RoleId IS NOT NULL AND @RoleId <> ''
BEGIN
SET @FROM = @FROM + ' JOIN AspNetUserRoles Roles ON Persons.UserId = Roles.UserID ' 
SET @WHERE = @WHERE + ' AND Roles.RoleId =''' +trim(cast(  @RoleId as varchar(450))) + ''''  
END



IF @OrganizationId IS NOT NULL AND @OrganizationId <> 0
BEGIN
SET @FROM = @FROM + ' JOIN AspNetUserRoles OrganizationRoles ON Persons.UserId = OrganizationRoles.UserID ' + 
	' JOIN AspNetRoleClaims Organizations ON Organizations.RoleId = OrganizationRoles.RoleID '
SET @WHERE = @WHERE + ' AND Organizations.ClaimType =''OrganizationRight'' AND Organizations.ClaimValue = CAST( ' + trim(cast( @OrganizationId  as varchar(10)))+ ' AS VARCHAR(5)) '  
END




IF @ProjectId IS NOT NULL AND @ProjectId <> 0
BEGIN
SET @FROM = @FROM + ' JOIN AspNetUserRoles ProjectRoles ON Persons.UserId = ProjectRoles.UserID ' + 
	' JOIN AspNetRoleClaims Projects ON Projects.RoleId = ProjectRoles.RoleID '
SET @WHERE = @WHERE + ' AND Projects.ClaimType =''ProjectRight'' AND Projects.ClaimValue = CAST( ' + trim(cast( @ProjectId  as varchar(10)))+ ' AS VARCHAR(5)) '  
END


IF @CountryId IS NOT NULL AND @CountryId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Persons.PersonId IN (SELECT PersonID FROM PersonAddresses WHERE CountryID = ' + trim(cast( @CountryId  as varchar(10)))+ ')'
END


IF @ProvinceState IS NOT NULL AND @ProvinceState <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Persons.PersonId IN (SELECT PersonID FROM PersonAddresses WHERE ProvinceState LIKE(''%' + trim(@ProvinceState) + '%''))'
END


IF @County IS NOT NULL AND @County <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Persons.PersonId IN (SELECT PersonID FROM PersonAddresses WHERE County LIKE(''%' +trim( @County) + '%''))'
END


IF @City IS NOT NULL AND @City <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Persons.PersonId IN (SELECT PersonID FROM PersonAddresses WHERE City LIKE(''%' + trim(@City) + '%''))'
END



IF @ClassificationId IS NOT NULL AND @ClassificationId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ( Persons.UserId IN (SELECT UserID FROM ClassificationUsers WHERE ClassificationId =' +trim(cast( @ClassificationId  as varchar(10)))+ ') OR ' +
	'Persons.UserId IN (SELECT UserID FROM ClassificationRoles JOIN AspNetUserRoles ON ClassificationRoles.RoleID = AspNetUserRoles.RoleID WHERE ClassificationId =' + trim(cast( @ClassificationId  as varchar(10))) + ')) '
END


IF @ClassificationValueId IS NOT NULL AND @ClassificationValueId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ( Persons.UserId IN (SELECT UserID FROM ClassificationValueUsers WHERE ClassificationValueId =' +trim(cast( @ClassificationValueId  as varchar(10)))+ ') OR ' +
	'Persons.UserId IN (SELECT UserID FROM ClassificationValueRoles JOIN AspNetUserRoles ON ClassificationValueRoles.RoleID = AspNetUserRoles.RoleID WHERE ClassificationValueId =' + trim(cast( @ClassificationValueId  as varchar(10))) + ')) '
END

SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)

--select @statement
EXECUTE sp_executesql @statement
