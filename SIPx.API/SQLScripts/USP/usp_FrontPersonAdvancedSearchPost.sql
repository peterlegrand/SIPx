CREATE PROCEDURE usp_FrontPersonAdvancedSearchPost (
	@UserId nvarchar(450) 
	, @FirstName nvarchar(50) =''
	, @LastName nvarchar(50) =''
	, @NickName nvarchar(50) =''
	, @GenderId int
	, @FromAge int
	, @ToAge int 
	, @OrganizationId int
	, @ProjectId int
	, @IsUser int
	, @RelationWithPersonId int
	, @CountryId int
	, @PersonProvinceState nvarchar(max) =''
	, @PersonCity nvarchar(max) =''
	)
AS

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT Persons.PersonID 
	, FirstName
	, MiddleName
	, LastName
	, NickName
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this Organization')) OrganizationName
FROM Persons
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Persons.DefaultOrganizationID
WHERE (Persons.FirstName LIKE '%' + @FirstName + '%' OR @FirstName = '' OR @FirstName IS NULL )
	AND (Persons.LastName LIKE '%' + @LastName + '%' OR @LastName = '' OR @LastName IS NULL )
	AND (Persons.NickName LIKE '%' + @NickName + '%' OR @NickName = '' OR @NickName IS NULL )
	
	AND (Persons.GenderID= @GenderID OR @GenderID=0)
	AND (DATEDIFF(year, GETDATE(), persons.BirthDate )>=@FromAge)
	AND (DATEDIFF(year, GETDATE(), persons.BirthDate )<=@ToAge)
	AND (Persons.PersonId IN (SELECT Persons.PersonID FROM AspNetRoleClaims 
		JOIN AspNetUserRoles
			ON AspNetRoleClaims.RoleId = AspNetUserRoles.RoleId
		JOIN Persons
			ON Persons.UserID = AspNetUserRoles.UserId
		WHERE ClaimType = 'OrganizationRight'
			AND Cast(ClaimValue as int) = @OrganizationId) OR @OrganizationId = 0)
	AND (Persons.PersonId IN (SELECT Persons.PersonID FROM AspNetRoleClaims 
		JOIN AspNetUserRoles
			ON AspNetRoleClaims.RoleId = AspNetUserRoles.RoleId
		JOIN Persons
			ON Persons.UserID = AspNetUserRoles.UserId
		WHERE ClaimType = 'ProjectRight'
			AND Cast(ClaimValue as int) = @ProjectId) OR @ProjectId = 0)
	AND ((@IsUser=2 AND Persons.UserID <> ''AND Persons.UserID is not null)
		OR
		(@IsUser=1 AND (Persons.UserID = ''OR Persons.UserID is null))
		OR 
		@IsUser=0)
	AND (PersonId in (SELECT FromPersonID
		FROM PersonRelations 
		WHERE ToPersonID = @RelationWithPersonId
			AND (ValidFrom <=getdate() OR ValidFrom IS NULL)
			AND (ValidTill >=getdate() OR ValidTill IS NULL))
		OR
		PersonId in (SELECT ToPersonID
		FROM PersonRelations 
		WHERE FromPersonID = @RelationWithPersonId
			AND (ValidFrom <=getdate() OR ValidFrom IS NULL)
			AND (ValidTill >=getdate() OR ValidTill IS NULL))
		OR
			@RelationWithPersonId =0)
	AND (Persons.PersonID IN (SELECT PersonID FROM PersonAddresses WHERE CountryId = @CountryId) OR @CountryId = 0)
	AND (Persons.PersonID IN (SELECT PersonID FROM PersonAddresses WHERE ProvinceState LIKE '%' + @PersonProvinceState + '%') OR @PersonProvinceState = ''OR @PersonProvinceState IS NULL)
	AND (Persons.PersonID IN (SELECT PersonID FROM PersonAddresses WHERE City LIKE '%' + @PersonCity + '%') OR @PersonCity = '' OR @PersonCity IS NULL)
			