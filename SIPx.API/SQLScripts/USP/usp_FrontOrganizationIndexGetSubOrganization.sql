CREATE PROCEDURE [dbo].[usp_FrontOrganizationIndexGetSubOrganization] (@UserId nvarchar(450), @OrganizationId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

WITH OrganizationHierarchy (OrganizationID
	, StatusID
	, Path
	, OrganizationTypeID
	, CreatedDate
	, CreatorID
	, ModifierID
	, ModifiedDate)
AS
(
	SELECT 
		Organizations.OrganizationID
		, StatusID
		, CAST(Organizations.OrganizationId AS VARCHAR(255)) AS Path
		, OrganizationTypeID
		, CreatedDate
		, CreatorID
		, ModifierID
		, ModifiedDate
	FROM Organizations 
	WHERE Organizations.ParentOrganizationId =@OrganizationId

   UNION ALL
	SELECT 
		OrganizationNextLevel.OrganizationID
		, OrganizationNextLevel.StatusID
		, CAST(OrganizationBaseLevel.Path + '.' + CAST(OrganizationNextLevel.OrganizationId AS VARCHAR(255)) AS VARCHAR(255))
		, OrganizationNextLevel.OrganizationTypeID
	, OrganizationNextLevel.CreatedDate
	, OrganizationNextLevel.CreatorID
	, OrganizationNextLevel.ModifierID
	, OrganizationNextLevel.ModifiedDate

	FROM Organizations OrganizationNextLevel
	JOIN OrganizationHierarchy OrganizationBaseLevel
		ON OrganizationBaseLevel.OrganizationId = OrganizationNextLevel.ParentOrganizationID
	)
-- Statement using the CTE
SELECT 
	OrganizationHierarchy.OrganizationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Organization')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this Organization')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this Organization')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this Organization')) MouseOver
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, Path
	, OrganizationHierarchy.OrganizationTypeID
	, OrganizationTypeLanguages.Name OrganizationTypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationHierarchy.ModifiedDate
FROM   OrganizationHierarchy
JOIN OrganizationTypeLanguages
	ON OrganizationHierarchy.OrganizationTypeID = OrganizationTypeLanguages.OrganizationTypeID 
JOIN Statuses
	ON Statuses.StatusId = OrganizationHierarchy.StatusID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= OrganizationHierarchy.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = OrganizationHierarchy.OrganizationID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = OrganizationHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationHierarchy.ModifierID
WHERE StatusName.LanguageId = @LanguageID
ORDER BY Path;
END;
