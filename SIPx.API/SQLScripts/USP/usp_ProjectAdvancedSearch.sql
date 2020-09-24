CREATE PROCEDURE usp_ProjectAdvancedSearch(
	@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @ParentProjectId int
	, @ProjectTypeId int
	, @SecurityLevelId int
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

SET @FROM = 'SELECT Projects.ProjectID ' +
	' , ISNULL(ProjectUserLanguage.Name,ISNULL(ProjectDefaultLanguage.Name,''No name for this Project'')) ProjectName ' +
	' , ISNULL(ProjectUserLanguage.Description,ISNULL(ProjectDefaultLanguage.Description,''No description for this Project'')) ProjectDescription ' +
	' , Persons.FirstName + '' '' + Persons.LastName CreatorName ' +
	' , Persons.PersonID CreatorId ' +
	' , Projects.CreatedDate ' +

' FROM  ' +
	' Projects ' +
' LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID, FullText FROM ProjectLanguages WHERE LanguageId = ' + trim(cast(@LanguageID as varchar(10))) 

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @FROM = @FROM + ' AND FREETEXT(ProjectLanguages.Fulltext, ''' + TRIM(@Contains) + ''')'
END



SET @FROM = @FROM + '  ) ProjectUserLanguage ' +
	' ON ProjectUserLanguage.ProjectID= Projects.ProjectID ' +
' LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID, FullText FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ' 

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @FROM = @FROM + ' AND FREETEXT(ProjectLanguages.Fulltext, ''' + TRIM(@Contains) + ''')'
END


SET @FROM = @FROM + ') ProjectDefaultLanguage ' +
	' ON ProjectDefaultLanguage.ProjectId = Projects.ProjectID ' +
' JOIN Persons  ' +
	' ON Persons.UserID = Projects.CreatorID '

SET @WHERE = '  WHERE ProjectUserLanguage.ProjectID IS NOT NULL AND ProjectDefaultLanguage.ProjectID IS NOT NULL '


IF @ParentProjectId IS NOT NULL AND @ParentProjectId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Projects.ParentProjectId = ' + trim(cast(@ParentProjectId as varchar(10)))   
END


IF @ProjectTypeId IS NOT NULL AND @ProjectTypeId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Projects.ProjectTypeId = ' + trim(cast(@ProjectTypeId as varchar(10))) 
END

IF @SecurityLevelId IS NOT NULL AND @SecurityLevelId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Projects.SecurityLevelId = ' + trim(cast(@SecurityLevelId as varchar(10))) 
END

IF @StatusId IS NOT NULL AND @StatusId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Projects.StatusId = ' + trim(cast(@StatusId as varchar(10))) 
END


IF @PersonId IS NOT NULL AND @PersonId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND CAST(Projects.ProjectId as varchar(10) IN (SELECT ClaimValue FROM AspRoleClaims JOIN AspUserRoles ON AspRoleClaims.RoleId = AspUserRoles.RoleId JOIN Persons ON AspUserRoles.UserId = Persons.UserId WHERE PersonId = ' + trim(cast(@PersonId as varchar(10)))  + ' AND AspRoleClaims.ClaimType = ''ProjectRight'')' 
END

SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)
--SELECT @statement
EXECUTE sp_executesql @statement
