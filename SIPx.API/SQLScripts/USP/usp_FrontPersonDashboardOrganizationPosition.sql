CREATE PROCEDURE usp_FrontPersonDashboardOrganizationPosition (@CurrentUserId nvarchar(450), @SelectedPersonId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT OrganizationPersons.OrganizationPersonID
	, OrganizationPersons.PersonId
	, OrganizationPersons.PositionID
	, Organizations.OrganizationID
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this Position')) PositionName
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this Position')) PositionName
FROM OrganizationPersons
JOIN Positions
	ON Positions.PositionID = OrganizationPersons.PositionID
JOIN Persons	
	ON Persons.PersonID = OrganizationPersons.PersonId
JOIN Organizations
	ON Organizations.OrganizationID =  OrganizationPersons.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Organizations.OrganizationID

LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageID FROM PositionLanguages JOIN Settings ON PositionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPositionLanguage
	ON DefaultPositionLanguage.PositionId = Positions.PositionID
LEFT JOIN (SELECT PositionId, Name, Description, MenuName, MouseOver, PositionLanguageID FROM PositionLanguages WHERE LanguageId = @LanguageID) UserPositionLanguage
	ON UserPositionLanguage.PositionID= Positions.PositionID

WHERE @SelectedPersonId = Persons.PersonID
	end;