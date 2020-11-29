CREATE PROCEDURE usp_ClassificationUserCreatePostCheck (
	@UserOfClassificationId nvarchar(450)
	, @ClassificationId int 
	, @ClassificationRelationTypeId int
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

IF (SELECT COUNT(*) FROM Classifications WHERE ClassificationID = @ClassificationId) = 0
BEGIN
insert into @ErrorIdsTable values(28)
END


IF (SELECT COUNT(*) FROM AspNetUsers WHERE ID = @UserOfClassificationId) = 0
BEGIN
insert into @ErrorIdsTable values(32)
END

IF (SELECT COUNT(*) FROM ClassificationRelationTypes WHERE ClassificationRelationTypeId = @ClassificationRelationTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(27)
END

IF (SELECT COUNT(*) FROM ClassificationUsers WHERE ClassificationID = @ClassificationId AND UserID = @UserOfClassificationId) > 0
BEGIN
insert into @ErrorIdsTable values(33)
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