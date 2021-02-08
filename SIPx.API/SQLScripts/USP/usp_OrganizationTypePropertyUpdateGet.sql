CREATE PROCEDURE usp_OrganizationTypePropertyUpdateGet (@UserId nvarchar(450),@OrganizationTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'OrganizationTypeProperty', 'Edit',1,'',@OrganizationTypePropertyId,@UserId

SELECT OrganizationTypeProperties.OrganizationTypePropertyID
	, OrganizationTypeProperties.OrganizationTypeID 
	, ISNULL(UserOrganizationTypeLanguage.Name,ISNULL(DefaultOrganizationTypeLanguage.Name,'No name for this Organization type')) OrganizationTypeName
	, OrganizationTypeProperties.PropertyID
	, OrganizationTypeProperties.ObjectTypePropertyStatusId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTypeProperties.ModifiedDate
FROM OrganizationTypeProperties 
JOIN OrganizationTypes 
	ON OrganizationTypeProperties.PropertyID = OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserOrganizationTypeLanguage
	ON UserOrganizationTypeLanguage.OrganizationTypeID= OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationTypeLanguage
	ON DefaultOrganizationTypeLanguage.OrganizationTypeId = OrganizationTypes.OrganizationTypeID

JOIN Persons Creator
	ON Creator.UserId = OrganizationTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTypeProperties.ModifierID
WHERE OrganizationTypeProperties.OrganizationTypePropertyId = @OrganizationTypePropertyID

COMMIT TRANSACTION


