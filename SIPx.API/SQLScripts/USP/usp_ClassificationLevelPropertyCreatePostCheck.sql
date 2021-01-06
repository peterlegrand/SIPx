CREATE PROCEDURE usp_ClassificationLevelPropertyCreatePostCheck (
	@ClassificationLevelId int
	, @PropertyId int
	, @PropertyStatusId int
	, @UserId nvarchar(450)
	) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ClassificationLevels WHERE ClassificationLevelID = @ClassificationLevelId) = 0
BEGIN
insert into @ErrorIdsTable values(21)
END


IF (SELECT COUNT(*) FROM Properties WHERE PropertyID = @PropertyId) = 0
BEGIN
insert into @ErrorIdsTable values(22)
END

IF (SELECT COUNT(*) FROM PropertyStatuses WHERE PropertyStatusId = @PropertyStatusId) = 0
BEGIN
insert into @ErrorIdsTable values(23)
END

IF (SELECT COUNT(*) FROM ClassificationLevelProperties WHERE ClassificationLevelID = @ClassificationLevelId AND PropertyID = @PropertyId) > 0
BEGIN
insert into @ErrorIdsTable values(24)
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