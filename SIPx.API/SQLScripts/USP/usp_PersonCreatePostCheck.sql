CREATE PROCEDURE usp_PersonCreatePostCheck (
	@GenderId int
	, @DefaultOrganizationId int
	, @UserId nvarchar(450) =''
	, @ModifierCreator nvarchar(450)
)	AS 

--PETER TODO What is unique about a person?
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierCreator
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM Genders WHERE GenderId = @GenderId) = 0 
BEGIN
insert into @ErrorIdsTable values(77)
END

IF (SELECT COUNT(*) FROM Organizations WHERE OrganizationId = @DefaultOrganizationId) = 0 
BEGIN
insert into @ErrorIdsTable values(49)
END

IF (SELECT COUNT(*) FROM AspNetUsers WHERE Id = @UserId) = 0 
BEGIN
insert into @ErrorIdsTable values(58)
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