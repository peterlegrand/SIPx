CREATE PROCEDURE [dbo].[usp_ClassificationValueAdvancedSearch](@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @ClassificationId int
	, @DateLevelId int
	, @DateFrom datetime
	, @DateTo datetime
	, @PersonId int
	 )
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

DECLARE @statement NVARCHAR(max);
DECLARE @FROM NVARCHAR(max);
DECLARE @WHERE NVARCHAR(max);


SET @FROM = 'SELECT ClassificationValues.ClassificationValueID ' +
	' , ClassificationValues.CreatedDate ' +
	' , Persons.FirstName + '' '' + Persons.LastName CreatorName ' +
	' , Persons.PersonID CreatorId ' +
	' , ISNULL(ClassificationValueUserLanguage.Name,ISNULL(ClassificationValueDefaultLanguage.Name,''No name for this ClassificationValue'')) ClassificationValueName ' +
	' , ISNULL(ClassificationValueUserLanguage.Description,ISNULL(ClassificationValueDefaultLanguage.Description,''No description for this ClassificationValue'')) ClassificationValueDescription ' +
	' , ISNULL(ClassificationUserLanguage.Name,ISNULL(ClassificationDefaultLanguage.Name,''No name for this Classification'')) ClassificationName ' +
' FROM ' +
	' ClassificationValues ' +
	' LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID, FullText FROM ClassificationValueLanguages WHERE LanguageId = ' + trim(cast(@LanguageID as varchar(10))) 
IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @FROM = @FROM+ ' AND Contains(ClassificationValueLanguages.Fulltext, ''' + trim(@Contains) + ''')' 
END


SET @FROM = @FROM + ' ) ClassificationValueUserLanguage ' +
	' ON ClassificationValueUserLanguage.ClassificationValueID= ClassificationValues.ClassificationValueID ' +
' LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID, FullText FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ' 
IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @FROM = @FROM+ ' AND Contains(ClassificationValueLanguages.Fulltext, ''' + trim(@Contains) + ''' ) ' 
 
END
SET @FROM = @FROM + ') ClassificationValueDefaultLanguage ' +
	' ON ClassificationValueDefaultLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID ' +
' LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = ' + trim(cast(@LanguageID as varchar(10))) +') ClassificationUserLanguage ' +
	' ON ClassificationUserLanguage.ClassificationID= ClassificationValues.ClassificationID ' +
' LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ) ClassificationDefaultLanguage ' +
	' ON ClassificationDefaultLanguage.ClassificationId = ClassificationValues.ClassificationID ' +
' JOIN Persons  ' +
	' ON Persons.UserID = ClassificationValues.CreatorID '

SET @WHERE = ' WHERE ClassificationValueUserLanguage.ClassificationValueID IS NOT NULL AND ClassificationValueDefaultLanguage.ClassificationValueID IS NOT NULL '

IF @ClassificationId IS NOT NULL AND @ClassificationId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ClassificationValues.ClassificationId = ' + TRIM(CAST(@ClassificationId AS varchar(10)))
END

IF @DateLevelId =2 --date
BEGIN
SET @WHERE = @WHERE + ' AND CAST(DateFrom as date) = ''' + CAST (@DateFrom as varchar(26)) + ''' AS date)'
END

IF @DateLevelId =3 --date range
BEGIN
SET @WHERE = @WHERE + ' AND CAST(DateFrom as date) > CAST (''' + CAST (@DateFrom as varchar(26)) + 
	''' AS date) AND CAST(DateTo as date) < CAST(''' + CAST (@DateTo as varchar(26)) +  ''' AS date)'
END

IF @DateLevelId =4 --date time
BEGIN
SET @WHERE = @WHERE + ' AND CAST(DateFrom as datetime) = CAST(''' + CAST (@DateFrom as nvarchar(26)) + ''' AS dateTime)'
END

IF @DateLevelId =5 --datetime range
BEGIN
SET @WHERE = @WHERE + ' AND CAST(DateFrom as datetime) > CAST(''' + CAST (@DateFrom as nvarchar(26)) + 
	''' AND CAST(DateTo as datetime) < CAST(''' + CAST (@DateTo as nvarchar(26)) + ''''
END

IF @PersonId IS NOT NULL AND @PersonId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ( ClassificationValues.ClassificationValueId IN (SELECT ClassificationID FROM ClassificationValueUsers JOIN Persons ON Persons.UserId = ClassificationValueUsers.UserId WHERE PersonId =' + trim(cast(@PersonId as varchar(10))) + ') OR ' +
	' ClassificationValues.ClassificationValueId IN (SELECT ClassificationValueId FROM ClassificationValueRoles JOIN AspNetUserRoles ON ClassificationValueRoles.RoleID = AspNetUserRoles.RoleID JOIN Persons ON Persons.UserId = AspNetUserRoles.UserId WHERE PersonId =' + trim(cast(@PersonId as varchar(10))) + ')) '
END

SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)

--select @statement
EXECUTE sp_executesql @statement

