CREATE PROCEDURE usp_UserUpdatePostCheck (
	@PersonId int
	, @FirstName nvarchar(50)
, @LastName nvarchar(50)
, @GenderId int
, @DefaultOrganizationId int
, @Email nvarchar(256)
, @ModifierCreator  nvarchar(450)	)
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierCreator
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

IF  (SELECT COUNT(*) 
	FROM Persons 
	WHERE PersonId = @PersonId) = 0
BEGIN
	insert into @ErrorIdsTable values(77)
END

IF  (SELECT COUNT(*) 
	FROM Genders 
	WHERE GenderId = @GenderId) = 0
BEGIN
	insert into @ErrorIdsTable values(77)
END

IF  (SELECT COUNT(*) 
	FROM Organizations 
	WHERE OrganizationId = @DefaultOrganizationId) = 0
BEGIN
	insert into @ErrorIdsTable values(48)
END

IF @FirstName ='' 
BEGIN
insert into @ErrorIdsTable values(120)
END

IF @LastName ='' 
BEGIN
insert into @ErrorIdsTable values(121)
END
--PETER TODO check for email
IF @Email ='' 
BEGIN
insert into @ErrorIdsTable values(122)
END


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
end