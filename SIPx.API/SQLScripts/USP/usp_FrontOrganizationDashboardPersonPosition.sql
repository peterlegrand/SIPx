CREATE PROCEDURE usp_FrontOrganizationDashboardPersonPosition (@UserId nvarchar(450), @OrganizationId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

select OrganizationPersons.OrganizationPersonID
	, OrganizationPersons.PersonId
	, OrganizationPersons.PositionID
	, Organizations.OrganizationID
	, Persons.FirstName
	, Persons.LastName
	, ISNULL(UserPositionLanguage.Name,ISNULL(DefaultPositionLanguage.Name,'No name for this Position')) PositionName
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this Organization')) OrganizationName

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
WHERE @OrganizationId = Organizations.OrganizationId
END;

--PETER TODO ORder by