CREATE PROCEDURE [dbo].[usp_Organizations] (@UserId nvarchar(450), @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

WITH OrganizationHierarchy (OrganizationID
	, StatusID
	, OrganizationTypeID
	, Path
	, CreatedDate
	, CreatorID
	, ModifierID
	, ModifiedDate)
AS
(
	SELECT 
		Organizations.OrganizationID
		, StatusID
		, OrganizationTypeID
		, CAST(Organizations.OrganizationId AS VARCHAR(255)) AS Path
		, CreatedDate
		, CreatorID
		, ModifierID
		, ModifiedDate
	FROM Organizations 
	WHERE Organizations.ParentOrganizationId IS NULL

   UNION ALL
	SELECT 
		OrganizationNextLevel.OrganizationID
		, OrganizationNextLevel.StatusID
		, OrganizationNextLevel.OrganizationTypeID
		, CAST(OrganizationBaseLevel.Path + '.' + CAST(OrganizationNextLevel.OrganizationId AS VARCHAR(255)) AS VARCHAR(255))
	, OrganizationNextLevel.CreatedDate
	, OrganizationNextLevel.CreatorID
	, OrganizationNextLevel.ModifierID
	, OrganizationNextLevel.ModifiedDate

	FROM Organizations OrganizationNextLevel
	JOIN OrganizationHierarchy OrganizationBaseLevel
		ON OrganizationBaseLevel.OrganizationId = OrganizationNextLevel.ParentOrganizationID
	)
-- Statement using the CTE
SELECT TOP (@Top) 
	OrganizationHierarchy.OrganizationID
	, OrganizationHierarchy.OrganizationTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this organization')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this organization')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this organization')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this organization')) MouseOver
	, ISNULL(UserTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this organization type')) OrganizationTypeName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, Path
	, OrganizationTypes.Internal
	, OrganizationTypes.LegalEntity
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, OrganizationHierarchy.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationHierarchy.ModifiedDate
FROM   OrganizationHierarchy
JOIN Statuses
	ON Statuses.StatusId = OrganizationHierarchy.StatusID
JOIN OrganizationTypes
	ON OrganizationHierarchy.OrganizationTypeId = OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= OrganizationHierarchy.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationId = OrganizationHierarchy.OrganizationID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage
	ON UserTypeLanguage.OrganizationTypeID= OrganizationHierarchy.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.OrganizationTypeID= OrganizationHierarchy.OrganizationTypeID
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
