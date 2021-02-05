CREATE PROCEDURE usp_OrganizationAddressCreatePostCheck (
 	@OrganizationId int
	, @AddressTypeId int
	, @AttnName nvarchar(50)
	, @Address1 nvarchar(100)
	, @Address2 nvarchar(100)
	, @HouseNumber nvarchar(20)
	, @HouseNumberExt nvarchar(20)
	, @City nvarchar(50)
	, @PostalCode nvarchar(50)
	, @PostalCodeExt nvarchar(50)
	, @CountryId int
	, @ProvinceState nvarchar(50)
	, @County nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @OrganizationId) = 0 
BEGIN
insert into @ErrorIdsTable values(48)
END


--PETER TODO Address type should have an active inactive option and then it should be filtered here.
IF (SELECT COUNT(*) FROM AddressTypes WHERE AddressTypeId= @AddressTypeId ) = 0
BEGIN
insert into @ErrorIdsTable values(49)
END

IF (SELECT COUNT(*) FROM Countries WHERE CountryId = @CountryId) = 0
BEGIN
insert into @ErrorIdsTable values(50)
END

--PETER TODO Add a check for process type which includes if primary content is a field for that.
SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END