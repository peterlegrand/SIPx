CREATE PROCEDURE usp_OrganizationTypeUpdatePostCheck (
		@OrganizationTypeId int
	, @Name nvarchar(50)
	, @IconId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


BEGIN

DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM OrganizationTypes WHERE OrganizationTypeId = @OrganizationTypeId) = 0 
BEGIN
insert into @ErrorIdsTable values(54)
END

IF (SELECT COUNT(*) FROM Icons WHERE IconId = @IconId) = 0 
BEGIN
insert into @ErrorIdsTable values(43)
END

IF  (SELECT COUNT(*) 
	FROM OrganizationTypeLanguages 
	WHERE LanguageId = @LanguageID
		AND Name = @Name) >0
BEGIN
	insert into @ErrorIdsTable values(56)
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