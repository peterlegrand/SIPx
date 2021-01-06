CREATE PROCEDURE usp_FrontPersonUpdatePostCheck (
	@PersonId int
	, @Salutation nvarchar(50)
	, @FirstName nvarchar(50)
	, @MiddleName nvarchar(50)
	, @LastName nvarchar(50)
	, @PersonalTitle nvarchar(50)
	, @Suffix nvarchar(50)
	, @NickName nvarchar(50)
	, @FirstNameLocal nvarchar(50)
	, @MiddleNameLocal nvarchar(50)
	, @LastNameLocal nvarchar(50)
	, @GenderId int
	, @Birthdate DateTime
	, @DeceasedDate DateTime
	, @DefaultOrganizationId int
	, @UserId nvarchar(450))
	AS 

--PETER TODO What is unique about a person?
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Persons WHERE PersonId = @PersonId) = 0 
BEGIN
insert into @ErrorIdsTable values(76)
END

IF (SELECT COUNT(*) FROM Genders WHERE GenderId = @GenderId) = 0 
BEGIN
insert into @ErrorIdsTable values(77)
END

IF (SELECT COUNT(*) FROM Projects WHERE ProjectId = @DefaultOrganizationId) = 0 
BEGIN
insert into @ErrorIdsTable values(49)
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