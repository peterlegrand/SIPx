CREATE PROCEDURE [dbo].[usp_Organizations] (@UserID nvarchar(450), @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
		, CAST(Organizations.OrganizationID AS VARCHAR(255)) AS Path
		, CreatedDate
		, CreatorID
		, ModifierID
		, ModifiedDate
	FROM Organizations 
	WHERE Organizations.ParentOrganizationID IS NULL

   UNION ALL
	SELECT 
		OrganizationNextLevel.OrganizationID
		, OrganizationNextLevel.StatusID
		, OrganizationNextLevel.OrganizationTypeID
		, CAST(OrganizationBaseLevel.Path + '.' + CAST(OrganizationNextLevel.OrganizationID AS VARCHAR(255)) AS VARCHAR(255))
	, OrganizationNextLevel.CreatedDate
	, OrganizationNextLevel.CreatorID
	, OrganizationNextLevel.ModifierID
	, OrganizationNextLevel.ModifiedDate

	FROM Organizations OrganizationNextLevel
	JOIN OrganizationHierarchy OrganizationBaseLevel
		ON OrganizationBaseLevel.OrganizationID = OrganizationNextLevel.ParentOrganizationID
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
	ON Statuses.StatusID = OrganizationHierarchy.StatusID
JOIN OrganizationTypes
	ON OrganizationHierarchy.OrganizationTypeID = OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationID, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.OrganizationID= OrganizationHierarchy.OrganizationID
LEFT JOIN (SELECT OrganizationID, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.OrganizationID = OrganizationHierarchy.OrganizationID
LEFT JOIN (SELECT OrganizationTypeID, Name FROM OrganizationTypeLanguages WHERE LanguageID = @LanguageID) UserTypeLanguage
	ON UserTypeLanguage.OrganizationTypeID= OrganizationHierarchy.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeID, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.OrganizationTypeID= OrganizationHierarchy.OrganizationTypeID
JOIN UITermLanguages StatusName
	ON Statuses.NameTermID = StatusName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserStatusName
	ON Statuses.NameTermID = UserStatusName.UITermID  
JOIN Persons Creator
	ON Creator.UserID = OrganizationHierarchy.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = OrganizationHierarchy.ModifierID
WHERE StatusName.LanguageID = @LanguageID
ORDER BY Path;
END;
