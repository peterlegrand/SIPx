CREATE PROCEDURE usp_PersonAddressCreatePostCheck (
	@PersonId int
	, @AddressTypeId int
	, @CountryId int
	, @UserId nvarchar(450)) 
AS 

--PETER No need to check with other records as it is at the moment AND AND
--PETER TODO Proper checking on string and date and int.
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Persons WHERE PersonId = @PersonId) = 0 
BEGIN
insert into @ErrorIdsTable values(76)
END

IF (SELECT COUNT(*) FROM AddressTypes WHERE AddressTypeId = @AddressTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(49)
END

IF (SELECT COUNT(*) FROM Countries WHERE CountryID = @CountryID) = 0 
BEGIN
insert into @ErrorIdsTable values(50)
END


--PETER TODO Add a check for process template which includes if primary content is a field for that.
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