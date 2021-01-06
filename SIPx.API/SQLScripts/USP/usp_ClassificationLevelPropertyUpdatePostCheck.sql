CREATE PROCEDURE usp_ClassificationLevelPropertyUpdatePostCheck (
	@UserID nvarchar(450)
	, @ClassificationLevelPropertyId int
	, @PropertyStatusId int) 
	
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ClassificationLevelProperties WHERE ClassificationLevelPropertyID = @ClassificationLevelPropertyId) = 0
BEGIN
insert into @ErrorIdsTable values(25)
END

IF (SELECT COUNT(*) FROM PropertyStatuses WHERE PropertyStatusId = @PropertyStatusId) = 0
BEGIN
insert into @ErrorIdsTable values(23)
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

END