CREATE PROCEDURE usp_ClassificationValueUserCreatePostCheck (
	@UserOfClassificationValueId nvarchar(450)
	, @ClassificationValueId int 
	, @ClassificationRelationTypeId int
	, @UserId nvarchar(450))
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN 
DECLARE @ErrorIdsTable TABLE (id int)

IF (SELECT COUNT(*) FROM ClassificationValues WHERE ClassificationValueID = @ClassificationValueId) = 0
BEGIN
insert into @ErrorIdsTable values(35)
END


IF (SELECT COUNT(*) FROM AspNetUsers WHERE ID = @UserOfClassificationValueId) = 0
BEGIN
insert into @ErrorIdsTable values(29)
END

IF (SELECT COUNT(*) FROM ClassificationRelationTypes WHERE ClassificationRelationTypeId = @ClassificationRelationTypeId) = 0
BEGIN
insert into @ErrorIdsTable values(27)
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