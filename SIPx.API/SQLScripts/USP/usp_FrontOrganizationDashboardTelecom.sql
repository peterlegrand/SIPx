CREATE PROCEDURE usp_FrontOrganizationDashboardTelecom (@CurrentUserId nvarchar(450), @SelectedOrganizationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT OrganizationTelecoms.OrganizationTelecomID
	, TelecomValue
	, ISNULL( UserTelecomTypeName.Customization, TelecomTypeName.Name) TelecomTypeName
	, ISNULL(OrganizationTelecomPhones.CountryCode,'') CountryCode
	, ISNULL(OrganizationTelecomPhones.AreaCode,'') AreaCode
	, ISNULL(OrganizationTelecomPhones.ExtensionCode,'') ExtensionCode
	, ISNULL(OrganizationTelecomPhones.AskForName,'') AskForName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTelecoms.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTelecoms.ModifiedDate
FROM OrganizationTelecoms
JOIN OrganizationTelecomPhones
	ON OrganizationTelecoms.OrganizationTelecomID = OrganizationTelecomPhones.OrganizationTelecomID
JOIN TelecomTypes
	ON OrganizationTelecoms.TelecomTypeID = TelecomTypes.TelecomTypeId
JOIN UITermLanguages TelecomTypeName
	ON TelecomTypes.NameTermId = TelecomTypeName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserTelecomTypeName
	ON TelecomTypes.NameTermId = UserTelecomTypeName.UITermId  
JOIN Organizations
	ON Organizations.OrganizationID = OrganizationTelecoms.OrganizationID
JOIN Persons Creator
	ON Creator.UserId = OrganizationTelecoms.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTelecoms.ModifierID
WHERE Organizations.OrganizationID= @SelectedOrganizationId
	AND TelecomTypeName.LanguageId = @LanguageID
