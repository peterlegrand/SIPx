CREATE PROCEDURE [dbo].[usp_Classification] (@UserID nvarchar(450), @ClassificationID int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Classifications.ClassificationID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this classification')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this classification')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this classification')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, CASE WHEN Classifications.DefaultPageID IS NOT NULL THEN ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for the default page')) ELSE 'There is no default page' END MouseOver
	, Classifications.HasDropDown 
	, Classifications.DropDownSequence
FROM Classifications 
JOIN Statuses 
	ON Statuses.StatusID = Classifications.StatusID
JOIN UITermLanguages UIName
	ON UIName.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT ClassificationID, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationPageID, Name FROM ClassificationPageLanguages WHERE LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = Classifications.DefaultPageID
LEFT JOIN (SELECT ClassificationPageID, Name FROM ClassificationPageLanguages  JOIN Settings ON ClassificationPageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = Classifications.DefaultPageID
WHERE UIName.LanguageID = @LanguageID
	AND Classifications.ClassificationID = @ClassificationID;

SELECT ClassificationLevels.ClassificationLevelID
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationLevelLanguage.Description,ISNULL(DefaultClassificationLevelLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName,ISNULL(DefaultClassificationLevelLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver,ISNULL(DefaultClassificationLevelLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UIDateLevelNameCustom.Customization,UIDateLevelName.Name) DateLevelName
	, ClassificationLevels.Sequence
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
FROM ClassificationLevels 
LEFT JOIN (SELECT ClassificationLevelID, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages WHERE LanguageID = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelID, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
JOIN DateLevels 
	ON DateLevels.DateLevelID = ClassificationLevels.DateLevelID
JOIN UITermLanguages UIDateLevelName
	ON UIDateLevelName.UITermID = DateLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDateLevelNameCustom
	ON UIDateLevelNameCustom.UITermID = DateLevels.NameTermID	
WHERE ClassificationLevels.ClassificationID = @ClassificationID
	AND UIDateLevelName.LanguageID = @LanguageID
ORDER BY ClassificationLevels.Sequence;

SELECT ClassificationPages.ClassificationPageID
	, ISNULL(UserClassificationPageLanguage.Name,ISNULL(DefaultClassificationPageLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationPageLanguage.Description,ISNULL(DefaultClassificationPageLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationPageLanguage.MenuName,ISNULL(DefaultClassificationPageLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationPageLanguage.MouseOver,ISNULL(DefaultClassificationPageLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserClassificationPageLanguage.TitleName,ISNULL(DefaultClassificationPageLanguage.TitleName,'No title name for this role')) TitleName
	, ISNULL(UserClassificationPageLanguage.TitleDescription,ISNULL(DefaultClassificationPageLanguage.TitleDescription,'No title description for this role')) TitleDescription
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ClassificationPages.ShowTitleName
	, ClassificationPages.ShowTitleDescription
FROM ClassificationPages 
LEFT JOIN (SELECT ClassificationPageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM ClassificationPageLanguages WHERE LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT ClassificationPageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM ClassificationPageLanguages JOIN Settings ON ClassificationPageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
JOIN Statuses 
	ON Statuses.StatusID = ClassificationPages.StatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = Statuses.NameTermID
WHERE ClassificationPages.ClassificationID = @ClassificationID
	AND UIStatusName.LanguageID = @LanguageID;
	

SELECT ClassificationRoles.RoleID
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role')) RoleName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typerole')) RelationTypeName
FROM ClassificationRoles 
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageID = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleID = ClassificationRoles.RoleID
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleID = ClassificationRoles.RoleID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationRoles.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationRoles.ClassificationRelationTypeID
WHERE ClassificationRoles.ClassificationID = @ClassificationID
ORDER BY ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role'));


SELECT ClassificationUsers.UserID
	, Persons.FirstName
	, Persons.LastName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typeUser')) RelationTypeName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
FROM ClassificationUsers 
JOIN Persons
	ON Persons.Userid = ClassificationUsers.UserID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationID = Persons.DefaultOrganizationID
WHERE ClassificationUsers.ClassificationID = @ClassificationID
ORDER BY Persons.FirstName, Persons.LastName	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) ;





WITH ClassificationValueHierarchy (ClassificationValueID, Path)
AS
(
	SELECT 
		ClassificationValues.ClassificationValueID
		, CAST(ClassificationValues.ClassificationValueID AS VARCHAR(255)) AS Path
	FROM ClassificationValues 
	WHERE ClassificationValues.ParentValueID IS NULL
		AND ClassificationValues.ClassificationID = @ClassificationID

   UNION ALL
	SELECT 
		ClassificationValueNextLevel.ClassificationValueID
		, CAST(ClassificationValueBaseLevel.Path + '.' + CAST(ClassificationValueNextLevel.ClassificationValueID AS VARCHAR(255)) AS VARCHAR(255))

	FROM ClassificationValues ClassificationValueNextLevel
	JOIN ClassificationValueHierarchy ClassificationValueBaseLevel
		ON ClassificationValueBaseLevel.ClassificationValueID = ClassificationValueNextLevel.ParentValueID
	WHERE ClassificationValueNextLevel.ClassificationID = @ClassificationID
)
-- Statement using the CTE
SELECT  TOP (@Top)  ClassificationValueHierarchy.ClassificationValueID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, Path
FROM   ClassificationValueHierarchy
LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationValueID= ClassificationValueHierarchy.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationValueID = ClassificationValueHierarchy.ClassificationValueID
ORDER BY Path;
END;
