CREATE PROCEDURE usp_FrontOrganizationDashboard (@UserId nvarchar(450), @OrganizationId int) 
AS 
BEGIN
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT @SecurityLevelId = SecurityLevelId
FROM AspNetUsers
WHERE Id = @UserID
;

Declare @CanEdit bit;
Declare @CanCreate bit;
Declare @EditRights int;
Declare @CreateRights int;

SELECT @EditRights = Count(*) 
FROM AspNetRoleClaims 
JOIN AspNetUserRoles 
	ON AspNetRoleClaims.RoleId = AspNetUserRoles.RoleId 
WHERE AspNetUserRoles.UserId = @UserId 
	AND ClaimType = 'ApplicationRight'
	AND ClaimValue = 'FrontOrganization\Edit'

DECLARE @IsInternal bit;
SELECT @IsInternal = Internal
FROM OrganizationTypes 
JOIN Organizations 
	ON OrganizationTypes.OrganizationTypeID = Organizations.OrganizationTypeID
WHERE OrganizationId = @OrganizationId

If @EditRights > 0 AND @IsInternal = 0
begin 
SET @CanEdit = 1
end
else
begin
SET @CanEdit = 0
End

SELECT @CreateRights = Count(*) 
FROM AspNetRoleClaims 
JOIN AspNetUserRoles 
	ON AspNetRoleClaims.RoleId = AspNetUserRoles.RoleId 
WHERE AspNetUserRoles.UserId = @UserId 
	AND ClaimType = 'ApplicationRight'
	AND ClaimValue = 'FrontOrganization\Create'

If @CreateRights > 0 
begin 
SET @CanCreate = 1
End
else
begin 
SET @CanCreate = 0
End

SELECT
	Organizations.OrganizationID
	, Organizations.ParentOrganizationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Organization')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Organization')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Organization')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Organization')) MouseOver
	, Organizations.StatusID 
	, CASE WHEN Organizations.ParentOrganizationId = NULL THEN 'No parent Organization' ELSE ISNULL(UserParentOrganizationLanguage.Name,ISNULL(DefaultParentOrganizationLanguage.Name,'No name for this parent Organization')) END ParentOrganizationName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, Organizations.OrganizationTypeID
	, OrganizationTypeLanguages.Name OrganizationTypeName
	, @CanEdit CanEdit
	, @CanCreate CanCreate
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Organizations.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Organizations.ModifiedDate
FROM   Organizations
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserParentOrganizationLanguage
	ON UserParentOrganizationLanguage.OrganizationID= Organizations.ParentOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentOrganizationLanguage
	ON DefaultParentOrganizationLanguage.OrganizationId = Organizations.ParentOrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = Organizations.OrganizationID
JOIN OrganizationTypeLanguages
	ON Organizations.OrganizationTypeID = OrganizationTypeLanguages.OrganizationTypeID 
JOIN Statuses
	ON Statuses.StatusId = Organizations.StatusID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = Organizations.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Organizations.ModifierID
WHERE  Organizations.OrganizationId = @OrganizationId
	AND StatusName.LanguageId = @LanguageID
END;
